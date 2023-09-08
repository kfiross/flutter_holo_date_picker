part of 'date_picker_i18n.dart';

/// Serbian (SR)
class _StringsSr extends _StringsI18n {
  const _StringsSr();

  @override
  String getCancelText() {
    return 'Otkaži';
  }

  @override
  String getDoneText() {
    return 'U redu';
  }

  @override
  List<String> getMonths() {
    return [
      "Januar",
      "Februar",
      "Mart",
      "April",
      "Maj",
      "Jun",
      "Jul",
      "Avgust",
      "Septembar",
      "Oktobar",
      "Novembar",
      "Decembar",
    ];
  }

  @override
  List<String> getWeeksFull() {
    return [
      "Ponedeljak",
      "Utorak",
      "Sreda",
      "Četvrtak",
      "Petak",
      "Subota",
      "Nedelja",
    ];
  }

  @override
  List<String> getWeeksShort() {
    return [
      "Po",
      "Ut",
      "Sr",
      "Če",
      "Pe",
      "Su",
      "Ne",
    ];
  }
}
