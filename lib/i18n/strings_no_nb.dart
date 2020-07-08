part of 'date_picker_i18n.dart';

/// Norwegian Bokmål (NO)
class _StringsNoNb extends _StringsI18n {
  const _StringsNoNb();

  @override
  String getCancelText() {
    return 'Avbryt';
  }

  @override
  String getDoneText() {
    return 'Ferdig';
  }

  @override
  List<String> getMonths() {
    return [
      "Januar",
      "Februar",
      "Mars",
      "April",
      "Mai",
      "Juni",
      "Juli",
      "August",
      "September",
      "Oktober",
      "November",
      "Desember"
    ];
  }

  @override
  List<String> getWeeksFull() {
    return [
      "Mandag",
      "Tirsdag",
      "Onsdag",
      "Torsdag",
      "Fredag",
      "Lørdag",
      "Søndag",
    ];
  }

  @override
  List<String> getWeeksShort() {
    return [
      "Man",
      "Tir",
      "Ons",
      "Tor",
      "Fre",
      "Lør",
      "Søn",
    ];
  }
}
