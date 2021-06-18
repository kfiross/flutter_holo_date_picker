part of 'date_picker_i18n.dart';

/// English (EN) United States
class _StringsNl extends _StringsI18n {
  const _StringsNl();

  @override
  String getCancelText() {
    return 'annuleren';
  }

  @override
  String getDoneText() {
    return 'Gedaan';
  }

  @override
  List<String> getMonths() {
    return [
      "januari-",
      "februari",
      "maart",
      "april",
      "mei",
      "juni-",
      "juli-",
      "augustus",
      "september",
      "oktober",
      "november",
      "december"
    ];
  }

  @override
  List<String> getWeeksFull() {
    return [
      "maandag",
      "dinsdag",
      "woensdag",
      "donderdag",
      "vrijdag",
      "zaterdag",
      "zondag",
    ];
  }

  @override
  List<String> getWeeksShort() {
    return [
      "maandag",
      "dinsdag",
      "woensdag",
      "donderdag",
      "vrijdag",
      "zaterdag",
      "zondag",
    ];
  }
}
