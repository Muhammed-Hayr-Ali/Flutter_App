import 'package:application/packages.dart';

class LadingProfile extends StatelessWidget {
  const LadingProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          children: [
            Container(
              height: Get.width * 0.25,
              width: Get.width * 0.25,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Get.width * 0.25)),
            ),
            const SizedBox(height: 14),
            Container(
              height: 26,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.0)),
            ),
            const SizedBox(height: 4),
            Container(
              height: 15,
              width: 222,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.0)),
            ),
            const SizedBox(height: 6),
            Container(
              height: 15,
              width: 190,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.0)),
            ),
          ],
        ),
      ),
    );
  }
}