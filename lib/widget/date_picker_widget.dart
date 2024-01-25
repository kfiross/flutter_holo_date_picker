import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../date_time_formatter.dart';
import '../date_picker_theme.dart';
import '../date_picker_constants.dart';
import '../i18n/date_picker_i18n.dart';

/// Solar months of 31 days.
const List<int> _solarMonthsOf31Days = const <int>[1, 3, 5, 7, 8, 10, 12];

/// DatePicker widget.
class DatePickerWidget extends StatefulWidget {
  DatePickerWidget({
    Key? key,
    this.firstDate,
    this.lastDate,
    this.initialDate,
    this.dateFormat = DATETIME_PICKER_DATE_FORMAT,
    this.locale = DATETIME_PICKER_LOCALE_DEFAULT,
    this.pickerTheme = DateTimePickerTheme.Default,
    this.onCancel,
    this.onChange,
    this.onConfirm,
    this.looping = false,
  }) : super(key: key) {
    DateTime minTime = firstDate ?? DateTime.parse(DATE_PICKER_MIN_DATETIME);
    DateTime maxTime = lastDate ?? DateTime.parse(DATE_PICKER_MAX_DATETIME);
    assert(minTime.compareTo(maxTime) < 0);
  }

  final DateTime? firstDate, lastDate, initialDate;
  final String? dateFormat;
  final DateTimePickerLocale? locale;
  final DateTimePickerTheme? pickerTheme;

  final DateVoidCallback? onCancel;
  final DateValueCallback? onChange, onConfirm;
  final bool looping;

  @override
  State<StatefulWidget> createState() =>
      _DatePickerWidgetState(this.firstDate, this.lastDate, this.initialDate);
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  late DateTime _minDateTime, _maxDateTime;
  int? _currYear, _currMonth, _currDay;
  List<int>? _yearRange, _monthRange, _dayRange;
  FixedExtentScrollController? _yearScrollCtrl,
      _monthScrollCtrl,
      _dayScrollCtrl;

  late Map<String, FixedExtentScrollController?> _scrollCtrlMap;
  late Map<String, List<int>?> _valueRangeMap;

  bool _isChangeDateRange = false;
  // whene change year the returned month is incorrect with the shown one
  // So _lock make sure that month doesn't change from cupertino widget
  // we will handle it manually
  bool _lock = false;
  _DatePickerWidgetState(
      DateTime? minDateTime, DateTime? maxDateTime, DateTime? initialDateTime) {
    // handle current selected year、month、day
    DateTime initDateTime = initialDateTime ?? DateTime.now();
    this._currYear = initDateTime.year;
    this._currMonth = initDateTime.month;
    this._currDay = initDateTime.day;

    // handle DateTime range
    this._minDateTime = minDateTime ?? DateTime.parse(DATE_PICKER_MIN_DATETIME);
    this._maxDateTime = maxDateTime ?? DateTime.parse(DATE_PICKER_MAX_DATETIME);

    // limit the range of year
    this._yearRange = _calcYearRange();
    this._currYear = min(max(_minDateTime.year, _currYear!), _maxDateTime.year);

    // limit the range of month
    this._monthRange = _calcMonthRange();
    this._currMonth = _calcCurrentMonth();

    // limit the range of day
    this._dayRange = _calcDayRange();
    this._currDay = min(max(_dayRange!.first, _currDay!), _dayRange!.last);

    // create scroll controller
    _yearScrollCtrl = FixedExtentScrollController(
        initialItem: _currYear! - _yearRange!.first);
    _monthScrollCtrl = FixedExtentScrollController(
        initialItem: _currMonth! - _monthRange!.first);
    _dayScrollCtrl =
        FixedExtentScrollController(initialItem: _currDay! - _dayRange!.first);

    _scrollCtrlMap = {
      'y': _yearScrollCtrl,
      'M': _monthScrollCtrl,
      'd': _dayScrollCtrl
    };
    _valueRangeMap = {'y': _yearRange, 'M': _monthRange, 'd': _dayRange};
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
      child: GestureDetector(
        child: Material(
            color: Colors.transparent, child: _renderPickerView(context)),
      ),
    );
  }

  /// render date picker widgets
  Widget _renderPickerView(BuildContext context) {
    Widget datePickerWidget = _renderDatePickerWidget();

    return datePickerWidget;
  }

  /// notify selected date changed
  void _onSelectedChange() {
    if (widget.onChange != null) {
      DateTime dateTime = DateTime(_currYear!, _currMonth!, _currDay!);
      widget.onChange!(dateTime, _calcSelectIndexList());
    }
  }

  /// find scroll controller by specified format
  FixedExtentScrollController? _findScrollCtrl(String format) {
    FixedExtentScrollController? scrollCtrl;
    _scrollCtrlMap.forEach((key, value) {
      if (format.contains(key)) {
        scrollCtrl = value;
      }
    });
    return scrollCtrl;
  }

  /// find item value range by specified format
  List<int>? _findPickerItemRange(String format) {
    List<int>? valueRange;
    _valueRangeMap.forEach((key, value) {
      if (format.contains(key)) {
        valueRange = value;
      }
    });
    return valueRange;
  }

  /// render the picker widget of year、month and day
  Widget _renderDatePickerWidget() {
    List<Widget> pickers = [];
    List<String> formatArr =
        DateTimeFormatter.splitDateFormat(widget.dateFormat);
    formatArr.forEach((format) {
      List<int> valueRange = _findPickerItemRange(format)!;

      Widget pickerColumn = _renderDatePickerColumnComponent(
          scrollCtrl: _findScrollCtrl(format),
          valueRange: valueRange,
          format: format,
          valueChanged: (value) {
            if (format.contains('y')) {
              _lock = true;
              _changeYearSelection(value);
              _lock = false;
            } else if (format.contains('M')) {
              if (_lock) {
                _lock = false;
                return;
              }
              _changeMonthSelection(value);
            } else if (format.contains('d')) {
              _changeDaySelection(value);
            }
          },
          fontSize: widget.pickerTheme!.itemTextStyle.fontSize ??
              sizeByFormat(widget.dateFormat!));
      pickers.add(pickerColumn);
    });
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: pickers);
  }

  Widget _renderDatePickerColumnComponent(
      {required FixedExtentScrollController? scrollCtrl,
      required List<int> valueRange,
      required String format,
      required ValueChanged<int> valueChanged,
      double? fontSize}) {
    return Expanded(
      flex: 1,
      child: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Positioned(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 18),
              height: widget.pickerTheme!.pickerHeight,
              decoration:
                  BoxDecoration(color: widget.pickerTheme!.backgroundColor),
              child: CupertinoPicker(
                selectionOverlay:
                    Container(decoration: widget.pickerTheme!.pickedDateDecoration),
                backgroundColor: widget.pickerTheme!.backgroundColor,
                scrollController: scrollCtrl,
                squeeze: 0.95,
                diameterRatio: 1.5,
                itemExtent: widget.pickerTheme!.itemHeight,
                onSelectedItemChanged: valueChanged,
                looping: widget.looping,
                children: List<Widget>.generate(
                  valueRange.last - valueRange.first + 1,
                  (index) {
                    return _renderDatePickerItemComponent(
                      valueRange.first + index,
                      format,
                      fontSize,
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned(
            child: Container(
                margin: const EdgeInsets.only(top: 63),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                    Expanded(
                      child: Divider(
                        color: widget.pickerTheme!.dividerColor ??
                            widget.pickerTheme!.itemTextStyle.color,
                        height: 1,
                        thickness: 2,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.02)
                  ],
                )),
          ),
          Positioned(
            child: Container(
                margin: const EdgeInsets.only(top: 99),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                    Expanded(
                      child: Divider(
                        color: widget.pickerTheme!.dividerColor ??
                            widget.pickerTheme!.itemTextStyle.color,
                        height: 1,
                        thickness: 2,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  double sizeByFormat(String format) {
    if (format.contains("-MMMM") || format.contains("MMMM-"))
      return DATETIME_PICKER_ITEM_TEXT_SIZE_SMALL;

    return DATETIME_PICKER_ITEM_TEXT_SIZE_BIG;
  }

  Widget _renderDatePickerItemComponent(
      int value, String format, double? fontSize) {
    var weekday = DateTime(_currYear!, _currMonth!, value).weekday;

    return Container(
      height: widget.pickerTheme!.itemHeight,
      alignment: Alignment.center,
      child: AutoSizeText(
        DateTimeFormatter.formatDateTime(value, format, widget.locale, weekday),
        maxLines: 1,
        // style: TextStyle(
        //     color: widget.pickerTheme!.itemTextStyle.color,
        //     fontSize: fontSize ?? widget.pickerTheme!.itemTextStyle.fontSize
        // ),
        style: widget.pickerTheme?.itemTextStyle ??
            DATETIME_PICKER_ITEM_TEXT_STYLE,
      ),
    );
  }

  /// change the selection of year picker
  void _changeYearSelection(int index) {
    int year = _yearRange!.first + index;
    if (_currYear != year) {
      _currYear = year;
      _changeDateRange();
      _onSelectedChange();
    }
  }

  /// change the selection of month picker
  void _changeMonthSelection(int index) {
    _monthRange = _calcMonthRange();

    int month = _monthRange!.first + index;
    if (_currMonth != month) {
      _currMonth = month;

      _changeDateRange();
      _onSelectedChange();
    }
  }

  /// change the selection of day picker
  void _changeDaySelection(int index) {
    if (_isChangeDateRange) {
      return;
    }

    int dayOfMonth = _dayRange!.first + index;
    if (_currDay != dayOfMonth) {
      _currDay = dayOfMonth;
      _onSelectedChange();
    }
  }

  // get the correct month
  int? _calcCurrentMonth() {
    int? _currMonth = this._currMonth!;
    List<int> monthRange = _calcMonthRange();
    if (_currMonth < monthRange.last) {
      _currMonth = max(_currMonth, monthRange.first);
    } else {
      _currMonth = max(monthRange.last, monthRange.first);
    }

    return _currMonth;
  }

  /// change range of month and day
  void _changeDateRange() {
    if (_isChangeDateRange) {
      return;
    }
    _isChangeDateRange = true;

    List<int> monthRange = _calcMonthRange();
    bool monthRangeChanged = _monthRange!.first != monthRange.first ||
        _monthRange!.last != monthRange.last;
    if (monthRangeChanged) {
      // selected year changed
      _currMonth = _calcCurrentMonth();
    }

    List<int> dayRange = _calcDayRange();
    bool dayRangeChanged =
        _dayRange!.first != dayRange.first || _dayRange!.last != dayRange.last;
    if (dayRangeChanged) {
      // day range changed, need limit the value of selected day
      _currDay = max(min(_currDay!, dayRange.last), dayRange.first);
    }

    setState(() {
      _monthRange = monthRange;
      _dayRange = dayRange;

      _valueRangeMap['M'] = monthRange;
      _valueRangeMap['d'] = dayRange;
    });

    if (monthRangeChanged) {
      // CupertinoPicker refresh data not working (https://github.com/flutter/flutter/issues/22999)
      int currMonth = _currMonth!;
      _monthScrollCtrl!.jumpToItem(monthRange.last - monthRange.first);
      if (currMonth < monthRange.last) {
        _monthScrollCtrl!.jumpToItem(currMonth - monthRange.first);
      }
    }

    if (dayRangeChanged) {
      // CupertinoPicker refresh data not working (https://github.com/flutter/flutter/issues/22999)
      int currDay = _currDay!;

      if (currDay < dayRange.last) {
        _dayScrollCtrl!.jumpToItem(currDay - dayRange.first);
      } else {
        _dayScrollCtrl!.jumpToItem(dayRange.last - dayRange.first);
      }
    }

    _isChangeDateRange = false;
  }

  /// calculate the count of day in current month
  int _calcDayCountOfMonth() {
    if (_currMonth == 2) {
      return isLeapYear(_currYear!) ? 29 : 28;
    } else if (_solarMonthsOf31Days.contains(_currMonth)) {
      return 31;
    }
    return 30;
  }

  /// whether or not is leap year
  bool isLeapYear(int year) {
    return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;
  }

  /// calculate selected index list
  List<int> _calcSelectIndexList() {
    int yearIndex = _currYear! - _minDateTime.year;
    int monthIndex = _currMonth! - _monthRange!.first;
    int dayIndex = _currDay! - _dayRange!.first;
    return [yearIndex, monthIndex, dayIndex];
  }

  /// calculate the range of year
  List<int> _calcYearRange() {
    return [_minDateTime.year, _maxDateTime.year];
  }

  /// calculate the range of month
  List<int> _calcMonthRange() {
    int minMonth = 1, maxMonth = 12;
    int minYear = _minDateTime.year;
    int maxYear = _maxDateTime.year;
    if (minYear == _currYear) {
      // selected minimum year, limit month range
      minMonth = _minDateTime.month;
    }
    if (maxYear == _currYear) {
      // selected maximum year, limit month range
      maxMonth = _maxDateTime.month;
    }
    return [minMonth, maxMonth];
  }

  /// calculate the range of day
  List<int> _calcDayRange({currMonth}) {
    int minDay = 1, maxDay = _calcDayCountOfMonth();
    int minYear = _minDateTime.year;
    int maxYear = _maxDateTime.year;
    int minMonth = _minDateTime.month;
    int maxMonth = _maxDateTime.month;
    if (currMonth == null) {
      currMonth = _currMonth;
    }
    if (minYear == _currYear && minMonth == currMonth) {
      // selected minimum year and month, limit day range
      minDay = _minDateTime.day;
    }
    if (maxYear == _currYear && maxMonth == currMonth) {
      // selected maximum year and month, limit day range
      maxDay = _maxDateTime.day;
    }
    return [minDay, maxDay];
  }
}
