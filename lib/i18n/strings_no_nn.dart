part of 'date_picker_i18n.dart';

/// Norwegian Nynorsk (NO)
class _StringsNoNn extends _StringsI18n {
  const _StringsNoNn();

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
      "Måndag",
      "Tysdag",
      "Onsdag",
      "Torsdag",
      "Fredag",
      "Laurdag",
      "Søndag",
    ];
  }

  @override
  List<String> getWeeksShort() {
    return [
      "Mån",
      "Tys",
      "Ons",
      "Tor",
      "Fre",
      "Lau",
      "Søn",
    ];
  }
}
