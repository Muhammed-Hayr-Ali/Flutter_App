import 'package:application/packages.dart';
import 'package:application/required_files.dart';

class CustomListTile extends StatefulWidget {
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
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  bool? isRtl;

  @override
  void initState() {
    super.initState();
    String local = Get.locale.toString();
    isRtl = local == 'ar' ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 4.0, vertical: 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.radius),
        ),
        onTap: widget.onTap,
        leading: SizedBox(
          child:
              widget.leading != null ? SvgPicture.asset(widget.leading!) : null,
        ),
        title: widget.title != null
            ? Text(
                '${widget.title}'.tr,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              )
            : const SizedBox(),
        subtitle: widget.subtitle != null
            ? Text(
                '${widget.subtitle}'.tr,
                style: TextStyle(
                    color: AppColors.grayColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w200),
              )
            : const SizedBox(),
        trailing: isRtl == true
            ? const Icon(Icons.chevron_left_outlined)
            : const Icon(Icons.chevron_right_outlined),
      ),
    );
  }
}
