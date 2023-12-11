import 'package:application/packages.dart';

class FadeAnimationDx extends StatelessWidget {
  FadeAnimationDx({super.key, required this.delay, required this.child});
  final int delay;
  final Widget child;
  final List<int> delayList = [];

  void _buildList() {
    for (var i = 2; i < 28; i++) {
      delayList.add(i * 128);
    }
  }

  @override
  Widget build(BuildContext context) {
    _buildList();
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: delayList[delay]),
      curve: Curves.easeOut,
      builder: (BuildContext context, double value, Widget? child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(-30 * (1 - value), 0),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
