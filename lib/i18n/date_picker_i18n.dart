import 'dart:math';

part 'strings_ar.dart';
part 'strings_bn.dart';
part 'strings_cz.dart';
part 'strings_de.dart';
part 'strings_en_us.dart';
part 'strings_es.dart';
part 'strings_fr.dart';
part 'strings_he.dart';
part 'strings_ht.dart';
part 'strings_hu.dart';
part 'strings_id.dart';
part 'strings_it.dart';
part 'strings_jp.dart';
part 'strings_ko.dart';
part 'strings_lo.dart';
part 'strings_lt.dart';
part 'strings_nl.dart';
part 'strings_no_nb.dart';
part 'strings_no_nn.dart';
part 'strings_pl.dart';
part 'strings_pt_br.dart';
part 'strings_ro.dart';
part 'strings_ru.dart';
part 'strings_sr.dart';
part 'strings_sv.dart';
part 'strings_th.dart';
part 'strings_tr.dart';
part 'strings_zh_cn.dart';

abstract class _StringsI18n {
  const _StringsI18n();

  /// Get the done widget text
  String getDoneText();

  /// Get the cancel widget text
  String getCancelText();

  /// Get the name of month
  List<String> getMonths();

  /// Get the full name of week
  List<String> getWeeksFull();

  /// Get the short name of week
  List<String>? getWeeksShort();
}

enum DateTimePickerLocale {
  /// English (EN) United States
  en_us,

  /// Chinese (ZH) Simplified
  zh_cn,

  /// Portuguese (PT) Brazil
  pt_br,

  /// Spanish (ES)
  es,

  /// Romanian (RO)
  ro,

  /// Bengali (BN)
  bn,

  /// Arabic (AR)
  ar,

  /// Japanese (JP)
  jp,

  /// Russian (RU)
  ru,

  /// German (DE)
  de,

  /// Korea (KO)
  ko,

  /// Italian (IT)
  it,

  /// Hungarian (HU)
  hu,

  /// Hebrew (HE)
  he,

  /// Indonesian (ID)
  id,

  /// Turkish (TR)
  tr,

  /// Norwegian Bokmål (NO)
  no_nb,

  /// Norwegian Nynorsk (NO)
  no_nn,

  /// French (FR)
  fr,

  /// Thai (TH)
  th,

  /// Lithuaniana (LT)
  lt,

  /// Dutch (NL)
  nl,

  /// Haitian Creole (HT)
  ht,

  /// Swedish (SV)
  sv,

  /// Czech (CZ)
  cz,

  /// Polish (PL)
  pl,

  /// Serbian (SR)
  sr,

  /// Lao (LO)
  lo,
}

/// Default value of date locale
const DateTimePickerLocale DATETIME_PICKER_LOCALE_DEFAULT =
    DateTimePickerLocale.en_us;

const Map<DateTimePickerLocale, _StringsI18n> datePickerI18n = {
  DateTimePickerLocale.en_us: const _StringsEnUs(),
  DateTimePickerLocale.zh_cn: const _StringsZhCn(),
  DateTimePickerLocale.pt_br: const _StringsPtBr(),
  DateTimePickerLocale.es: const _StringsEs(),
  DateTimePickerLocale.ro: const _StringsRo(),
  DateTimePickerLocale.bn: const _StringsBn(),
  DateTimePickerLocale.ar: const _StringsAr(),
  DateTimePickerLocale.jp: const _StringsJp(),
  DateTimePickerLocale.ru: const _StringsRu(),
  DateTimePickerLocale.de: const _StringsDe(),
  DateTimePickerLocale.ko: const _StringsKo(),
  DateTimePickerLocale.it: const _StringsIt(),
  DateTimePickerLocale.hu: const _StringsHu(),
  DateTimePickerLocale.he: const _StringsHe(),
  DateTimePickerLocale.id: const _StringsId(),
  DateTimePickerLocale.tr: const _StringsTr(),
  DateTimePickerLocale.no_nb: const _StringsNoNb(),
  DateTimePickerLocale.no_nn: const _StringsNoNn(),
  DateTimePickerLocale.nl: const _StringsNl(),
  DateTimePickerLocale.fr: const _StringsFr(),
  DateTimePickerLocale.th: const _StringsTh(),
  DateTimePickerLocale.lt: const _StringsLt(),
  DateTimePickerLocale.ht: const _StringsHt(),
  DateTimePickerLocale.sv: const _StringsSv(),
  DateTimePickerLocale.cz: const _StringsCz(),
  DateTimePickerLocale.pl: const _StringsPl(),
  DateTimePickerLocale.sr: const _StringsSr(),
  DateTimePickerLocale.lo: const _StringsLo(),
};

class DatePickerI18n {
  /// Get done button text
  static String getLocaleDone(DateTimePickerLocale locale) {
    _StringsI18n i18n = datePickerI18n[locale] ??
        datePickerI18n[DATETIME_PICKER_LOCALE_DEFAULT]!;
    return i18n.getDoneText();
  }

  /// Get cancel button text
  static String getLocaleCancel(DateTimePickerLocale locale) {
    _StringsI18n i18n = datePickerI18n[locale] ??
        datePickerI18n[DATETIME_PICKER_LOCALE_DEFAULT]!;
    return i18n.getCancelText();
  }

  /// Get locale month array
  static List<String> getLocaleMonths(DateTimePickerLocale? locale) {
    _StringsI18n i18n = datePickerI18n[locale!] ??
        datePickerI18n[DATETIME_PICKER_LOCALE_DEFAULT]!;
    List<String> months = i18n.getMonths();
    if (months.isNotEmpty) {
      return months;
    }
    return datePickerI18n[DATETIME_PICKER_LOCALE_DEFAULT]!.getMonths();
  }

  /// Get locale week array
  static List<String>? getLocaleWeeks(DateTimePickerLocale? locale,
      [bool isFull = true]) {
    _StringsI18n? i18n = datePickerI18n[locale!] ??
        datePickerI18n[DATETIME_PICKER_LOCALE_DEFAULT];
    if (isFull) {
      List<String> weeks = i18n!.getWeeksFull();
      if (weeks.isNotEmpty) {
        return weeks;
      }
      return datePickerI18n[DATETIME_PICKER_LOCALE_DEFAULT]!.getWeeksFull();
    }

    List<String>? weeks = i18n!.getWeeksShort();
    if (weeks != null && weeks.isNotEmpty) {
      return weeks;
    }

    List<String> fullWeeks = i18n.getWeeksFull();
    if (fullWeeks.isNotEmpty) {
      return fullWeeks
          .map((item) => item.substring(0, min(3, item.length)))
          .toList();
    }
    return datePickerI18n[DATETIME_PICKER_LOCALE_DEFAULT]!.getWeeksShort();
  }
}
