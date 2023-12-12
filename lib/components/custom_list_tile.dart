import 'package:application/packages.dart';

class CustomListTile extends StatefulWidget {
  final double radius;
  final IconData? icon;
  final Color? color;
  final void Function()? onTap;
  final String? title;
  final double? elevation;
  final Color? background;
  final EdgeInsetsGeometry? margin;
  const CustomListTile(
      {super.key,
      this.radius = 14,
      this.icon,
      this.onTap,
      this.title,
      this.elevation = 0.0,
      this.background,
      this.margin,
      this.color});

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  bool isRtl = false;
  @override
  void initState() {
    super.initState();
    String local = Get.locale.toString();
    setState(() {
      isRtl = local != 'ar' ? true : false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: widget.margin ?? const EdgeInsets.fromLTRB(8, 8, 8, 0),
      color: widget.background,
      elevation: widget.elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.radius),
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.radius),
        ),
        onTap: widget.onTap,
        leading: Icon(
          widget.icon,
          size: 22,
          color: widget.color,
        ),
        title: widget.title != null
            ? Text(
                '${widget.title}'.tr,
                style: const TextStyle(fontSize: 14),
              )
            : const SizedBox(),
        trailing: isRtl
            ? const Icon(Icons.chevron_left)
            : const Icon(Icons.chevron_right),
      ),
    );
  }
}
