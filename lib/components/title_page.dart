import 'package:application/packages.dart';
import 'package:application/required_files.dart';

class PageTitle extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final double? heightSpace;
  const PageTitle(
      {super.key, this.title, this.subTitle, this.heightSpace = 16});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: title != null
              ? Text(
                  '$title'.tr,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.w200),
                )
              : null,
        ),
        SizedBox(height: subTitle != null ? heightSpace : 0),
        SizedBox(
          child: subTitle != null
              ? Text(
                  '$subTitle'.tr,
                  style: TextStyle(
                      color: AppColors.grayColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w300),
                )
              : null,
        ),
      ],
    );
  }
}
