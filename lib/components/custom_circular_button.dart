import 'package:flutter/material.dart';

class CustomCircularButton extends StatelessWidget {
  final double? size;
  final Color? color;
  final double padding;
  final Widget? child;
  final void Function() onTap;
  const CustomCircularButton(
      {super.key,
      this.color = Colors.transparent,
      this.size = 48,
      this.child,
      this.padding = 0,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: ClipOval(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
