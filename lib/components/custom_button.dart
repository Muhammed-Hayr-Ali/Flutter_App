import '../packages.dart';
import '../required_files.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      this.onPressed,
      this.child,
      this.width,
      this.height = 58,
      this.backgroundColor,
      this.borderColor = Colors.black,
      this.borderWidth = 0,
      this.border = false,
      this.elevation = 0.0,
      this.borderRadius = 58,
      this.padding = 8,
      this.overlayColor});

  final void Function()? onPressed;
  final Widget? child;
  final double? width;
  final double height;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? overlayColor;
  final Color borderColor;
  final double borderWidth;
  final bool border;
  final double elevation;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? Get.width * 0.85,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          overlayColor:
              MaterialStateProperty.all<Color>(overlayColor ?? Colors.white12),
          padding: MaterialStateProperty.all(EdgeInsets.all(padding)),
          elevation: MaterialStateProperty.resolveWith<double?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return elevation;
              }
              return elevation; // Defer to the widget's default.
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return backgroundColor != null
                    ? backgroundColor?.withOpacity(0.9)
                    : AppColors.primaryColor;
              }
              return backgroundColor ??
                  AppColors.primaryColor; // Defer to the widget's default.
            },
          ),
          shape: MaterialStateProperty.resolveWith(
            (Set<MaterialState> states) {
              return RoundedRectangleBorder(
                  side: border
                      ? BorderSide(color: borderColor, width: borderWidth)
                      : BorderSide.none,
                  borderRadius: BorderRadius.circular(height)); // <-- Radius
            },
          ),
        ),
        child: child,
      ),
    );
  }
}
