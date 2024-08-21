part of 'date_picker_i18n.dart';

/// Lao (LO) Lao
class _StringsLo extends _StringsI18n {
  const _StringsLo();

  @override
  String getCancelText() {
    return 'Cancel';
  }

  @override
  String getDoneText() {
    return 'Done';
  }

  @override
  List<String> getMonths() {
    return [
      "ມັງກອນ", // January
      "ກຸມພາ", // February
      "ມີນາ", // March
      "ເມສາ", // April
      "ພຶດສະພາ", // May
      "ມິຖຸນາ", // June
      "ກໍລະກົດ", // July
      "ສິງຫາ", // August
      "ກັນຍາ", // September
      "ຕຸລາ", // October
      "ພະຈິກ", // November
      "ທັນວາ" // December
    ];
  }

  @override
  List<String> getWeeksFull() {
    return [
      "ວັນຈັນ", // Monday
      "ວັນອັງຄານ", // Tuesday
      "ວັນພຸດ", // Wednesday
      "ວັນພະຫັດ", // Thursday
      "ວັນສຸກ", // Friday
      "ວັນເສົາ", // Saturday
      "ວັນອາທິດ", // Sunday
    ];
  }

  @override
  List<String> getWeeksShort() {
    return [
      "ຈັນ", // Monday
      "ອັງຄານ", // Tuesday
      "ພຸດ", // Wednesday
      "ພະຫັດ", // Thursday
      "ສຸກ", // Friday
      "ເສົາ", // Saturday
      "ອາທິດ", // Sunday
    ];
  }
}
