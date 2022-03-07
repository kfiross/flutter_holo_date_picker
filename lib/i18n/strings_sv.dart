part of 'date_picker_i18n.dart';

/// Swedish (SV)
class _StringsSv extends _StringsI18n {
  const _StringsSv();

  @override
  String getCancelText() {
    return 'Avbryt';
  }

  @override
  String getDoneText() {
    return 'Klar';
  }

  @override
  List<String> getMonths() {
    return [
      "Januari",
      "Februari",
      "Mars",
      "April",
      "Maj",
      "Juni",
      "Juli",
      "Augusti",
      "September",
      "Oktober",
      "November",
      "December"
    ];
  }

  @override
  List<String> getWeeksFull() {
    return [
      "Måndag",
      "Tisdag",
      "Onsdag",
      "Torsdag",
      "Fredag",
      "Lördag",
      "Söndag",
    ];
  }

  @override
  List<String> getWeeksShort() {
    return [
      "Mån",
      "Tis",
      "Ons",
      "Tor",
      "Fre",
      "Lör",
      "Sön",
    ];
  }
}
