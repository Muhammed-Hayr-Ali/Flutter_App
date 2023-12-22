import 'package:application/packages.dart';
import 'package:application/required_files.dart';

class CustomListTile extends StatelessWidget {
  final String? leading;
  final String? title;
  final String? subtitle;
  final double radius;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final void Function()? onTap;
  const CustomListTile(
      {super.key,
      this.radius = 14,
      this.onTap,
      this.title,
      this.margin,
      this.color,
      this.subtitle,
      this.leading});

  @override
  Widget build(BuildContext context) {
    bool isRtl = Get.locale?.languageCode == 'ar';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 4.0, vertical: 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        onTap: onTap,
        leading: SizedBox(
          child: leading != null ? SvgPicture.asset(leading!) : null,
        ),
        title: title != null
            ? Text(
                '$title'.tr,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              )
            : const SizedBox(),
        subtitle: subtitle != null
            ? Text(
                '$subtitle'.tr,
                style: TextStyle(
                    color: AppColors.grayColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w200),
              )
            : const SizedBox(),
        trailing: isRtl
            ? const Icon(Icons.chevron_right_outlined)
            : const Icon(Icons.chevron_right_outlined),
      ),
    );
  }
}
