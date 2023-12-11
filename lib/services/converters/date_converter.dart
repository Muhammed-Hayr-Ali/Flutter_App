import 'package:application/packages.dart';

enum DateType { dateOnly, standard, relative }

class DateConverter {
  static DateConverter instanse = DateConverter();

  String dateConverter({
    required String date,
    required DateType dateType,
    int levelOfPrecision = 0,
  }) {
    DateTime now = DateTime.parse(date.toString());

    String dateOnly = now.format('d/m/Y');

    String standard = now
        .format(
            Get.locale.toString() == 'en' ? 'd/m/Y   h:i A' : 'Y/m/d   h:i A')
        .replaceAll('PM', 'PM'.tr)
        .replaceAll('AM', 'AM'.tr);

    String relative =
        (DateTimeFormat.relative(now, levelOfPrecision: levelOfPrecision))
            .replaceAll('seconds', 'seconds'.tr)
            .replaceAll('second', 'second'.tr)
            .replaceAll('minutes', 'minutes'.tr)
            .replaceAll('minute', 'minute'.tr)
            .replaceAll('hours', 'hours'.tr)
            .replaceAll('hour', 'hour'.tr)
            .replaceAll('days', 'days'.tr)
            .replaceAll('day', 'day'.tr)
            .replaceAll('weeks', 'weeks'.tr)
            .replaceAll('week', 'week'.tr)
            .replaceAll('months', 'months'.tr)
            .replaceAll('month', 'month'.tr)
            .replaceAll('years', 'years'.tr)
            .replaceAll('year', 'year'.tr);

    switch (dateType) {
      case DateType.dateOnly:
        return dateOnly;

      case DateType.standard:
        return standard;

      case DateType.relative:
        return relative;

      default:
        return relative;
    }
  }
}
