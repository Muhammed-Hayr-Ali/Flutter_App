import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  final double? height;
  final double? width;
  final void Function()? onTap;
  final Widget? child;
  final Color? background;
  final double radius;
  const CustomListItem(
      {super.key,
      this.height = 50,
      this.onTap,
      this.child,
      this.background = Colors.transparent,
      this.radius = 12.0,
      this.width = double.infinity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Material(
        borderRadius: BorderRadius.circular(radius),
        color: background,
        child: InkWell(
          borderRadius: BorderRadius.circular(radius),
          onTap: onTap,
          child: Center(child: child),
        ),
      ),
    );
  }
}
