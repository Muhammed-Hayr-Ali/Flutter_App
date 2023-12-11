import '../packages.dart';
import '../required_files.dart';

class CustomProgress extends StatelessWidget {
  final double size;
  final double width;
  final Color? color;
  const CustomProgress({super.key, this.size = 28, this.width = 1, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        strokeWidth: width,
        color: color ?? AppColors.primaryColor,
      ),
    );
  }
}
