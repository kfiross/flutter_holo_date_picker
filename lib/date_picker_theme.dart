import 'package:flutter/material.dart';

/// Default value of DatePicker's background color.
const DATETIME_PICKER_BACKGROUND_COLOR = Colors.white;

/// Default value of whether show title widget or not.
const DATETIME_PICKER_SHOW_TITLE_DEFAULT = true;

/// Default value of DatePicker's height.
const double DATETIME_PICKER_HEIGHT = 160.0;

/// Default value of DatePicker's title height.
const double DATETIME_PICKER_TITLE_HEIGHT = 36.0;

/// Default value of DatePicker's column height.
const double DATETIME_PICKER_ITEM_HEIGHT = 36.0;

/// Default value of DatePicker's item [TextStyle].
const TextStyle DATETIME_PICKER_ITEM_TEXT_STYLE = const TextStyle(color: Colors.black, fontSize: 16.0);

/// Default value of DatePicker's item text [Color].
const Color DATETIME_PICKER_ITEM_TEXT_COLOR = Colors.black;

/// Default value of DatePicker's item small size text.
const double DATETIME_PICKER_ITEM_TEXT_SIZE_SMALL = 15;

/// Default value of DatePicker's item big size text.
const double DATETIME_PICKER_ITEM_TEXT_SIZE_BIG = 17;

/// Default value of DatePicker's dividers.
const double DATETIME_PICKER_DIVIDER_THICKNESS = 2;

/// Default value of DatePicker's relative ratio between this its height and the simulated cylinder's diameter.
const double DATETIME_PICKER_CURVE_RATIO = 1.1;

/// Default value of DatePicker's dividers.
const double DATETIME_PICKER_ITEM_SPACE = 0.95;

/// To support both stable and beta channels until
/// 'DiagnosticableMixin' is officially deprecated.
class DateTimePickerTheme {
  final cancelDefault = const Text('OK');

  /// DateTimePicker theme.
  ///
  /// [backgroundColor] DatePicker's background color.
  /// [cancelTextStyle] Default cancel widget's [TextStyle].
  /// [confirmTextStyle] Default confirm widget's [TextStyle].
  /// [cancel] Custom cancel widget.
  /// [confirm] Custom confirm widget.
  /// [title] Custom title widget. If specify a title widget, the cancel and confirm widgets will not display. Must set [titleHeight] value for custom title widget.
  /// [showTitle] Whether display title widget or not. If set false, the default cancel and confirm widgets will not display, but the custom title widget will display if had specified one custom title widget.
  /// [pickerHeight] The value of DatePicker's height.
  /// [titleHeight] The value of DatePicker's title height.
  /// [itemHeight] The value of DatePicker's column height.
  /// [itemTextStyle] The value of DatePicker's column [TextStyle].
  const DateTimePickerTheme({
    this.backgroundColor = DATETIME_PICKER_BACKGROUND_COLOR,
    this.cancelTextStyle,
    this.confirmTextStyle,
    this.cancel,
    this.confirm,
    this.title,
    this.showTitle = DATETIME_PICKER_SHOW_TITLE_DEFAULT,
    this.pickerHeight = DATETIME_PICKER_HEIGHT,
    this.titleHeight = DATETIME_PICKER_TITLE_HEIGHT,
    this.itemHeight = DATETIME_PICKER_ITEM_HEIGHT,
    this.itemTextStyle = DATETIME_PICKER_ITEM_TEXT_STYLE,
    this.dividerColor,
    this.dividerThickness = DATETIME_PICKER_DIVIDER_THICKNESS,
    this.curveRatio = DATETIME_PICKER_CURVE_RATIO,
    this.itemSpace = DATETIME_PICKER_ITEM_SPACE,
  });

  static const DateTimePickerTheme Default = const DateTimePickerTheme();

  /// DatePicker's background color.
  ///
  /// If this is null then the [DATETIME_PICKER_BACKGROUND_COLOR] is used.
  final Color backgroundColor;

  /// Default cancel widget's [TextStyle].
  final TextStyle? cancelTextStyle;

  /// Default confirm widget's [TextStyle].
  final TextStyle? confirmTextStyle;

  /// Custom cancel [Widget].
  final Widget? cancel;

  /// Custom confirm [Widget].
  final Widget? confirm;

  /// Custom title [Widget]. If specify a title widget, the cancel and confirm widgets will not display.
  final Widget? title;

  /// Whether display title widget or not. If set false, the default cancel and confirm widgets will not display, but the custom title widget will display if had specified one custom title widget.
  final bool showTitle;

  /// The value of DatePicker's height.
  ///
  /// If this is null, then the [DATETIME_PICKER_HEIGHT] is used.
  final double pickerHeight;

  /// The value of DatePicker's title height.
  ///
  /// If this is null, then the [DATETIME_PICKER_TITLE_HEIGHT] is used.
  final double titleHeight;

  /// The value of DatePicker's row height.
  ///
  /// If this is null, then the [DATETIME_PICKER_ITEM_HEIGHT] is used.
  final double itemHeight;

  /// The value of DatePicker's column [TextStyle].
  ///
  /// If this is null, then the [DATETIME_PICKER_ITEM_TEXT_STYLE] is used.
  final TextStyle itemTextStyle;

  /// The value of DatePicker's divider color [Color].
  final Color? dividerColor;

  /// The value of DatePicker's divider thickness.
  ///
  /// A divider with a [dividerThickness] of 0.0 is always drawn as a line with a height of exactly one device pixel.
  ///
  /// If this is null, then the [DATETIME_PICKER_DIVIDER_THICKNESS] is used.
  final double dividerThickness;

  /// Relative ratio between this picker's height and the simulated cylinder's diameter.
  ///
  /// If this is null, then the [DATETIME_PICKER_CURVE_RATIO] is used.
  final double curveRatio;

  /// The value of DatePicker's item spacing.
  ///
  /// If this is null, then the [DATETIME_PICKER_ITEM_SPACE] is used.
  final double itemSpace;
}
