import 'package:application/packages.dart';

class FadeAnimationDy extends StatelessWidget {
  const FadeAnimationDy({super.key, required this.delay, required this.child});
  final int delay;
  final Widget child;

  bool getLocal() {
    return Get.locale.toString() == 'ar' ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: delay),
      curve: Curves.easeOut,
      builder: (BuildContext context, double value, Widget? child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: getLocal() == true
                ? Offset(0, -30 * (1 - value))
                : Offset(0, 30 * (1 - value)),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
