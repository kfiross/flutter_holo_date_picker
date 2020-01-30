part of 'date_picker_i18n.dart';

/// Hebrew (HE)
class _StringsHe extends _StringsI18n {
  const _StringsHe();

  @override
  String getCancelText() {
    return 'ביטול';
  }

  @override
  String getDoneText() {
    return 'אישור';
  }

  @override
  List<String> getMonths() {
    return [
      "ינואר",
      "פברואר",
      "מרץ",
      "אפריל",
      "מאי",
      "יוני",
      "יולי",
      "אוגוסט",
      "ספמטבר",
      "אוקטובר",
      "נובמבר",
      "דצמבר"
    ];
  }

  @override
  List<String> getWeeksFull() {
    return [
      "שני",
      "שלישי",
      "רביעי",
      "חמישי",
      "שישי",
      "שבת",
      "ראשון",
    ];
  }

  @override
  List<String> getWeeksShort() {
    return [
      "Mon",
      "Tue",
      "Wed",
      "Thur",
      "Fri",
      "Sat",
      "Sun",
    ];
  }
}
