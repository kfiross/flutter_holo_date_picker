part of 'date_picker_i18n.dart';

class _StringsId extends _StringsI18n {
  const _StringsId();

  @override
  String getCancelText() {
    return 'Batal';
  }

  @override
  String getDoneText() {
    return 'Pilih';
  }

  @override
  List<String> getMonths() {
    return [
      "Januari",
      "Februari",
      "Maret",
      "April",
      "Mei",
      "Juni",
      "Juli",
      "Agustus",
      "September",
      "Oktober",
      "November",
      "Desember"
    ];
  }

  @override
  List<String> getWeeksFull() {
    return [
      "Senin",
      "Selasa",
      "Rabu",
      "Kamis",
      "Jum'at",
      "Sabtu",
      "Minggu",
    ];
  }

  @override
  List<String> getWeeksShort() {
    return [
      "Sen",
      "Sel",
      "Rab",
      "Kam",
      "Jum",
      "Sab",
      "Min",
    ];
  }
}
