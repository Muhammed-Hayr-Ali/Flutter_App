
import 'package:application/packages.dart';

class LadingProfile extends StatelessWidget {
  const LadingProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: Get.width * 0.22,
                width: Get.width * 0.22,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(Get.width * 0.22 / 4)),
              ),
              const SizedBox()
            ],
          ),
          const SizedBox(height: 14),
          Container(
            height: 26,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(4.0)),
          ),
          const SizedBox(height: 2),
          Container(
            height: 15,
            width: 222,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(4.0)),
          ),
          const SizedBox(height: 6),
          Container(
            height: 15,
            width: 190,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(4.0)),
          ),
        ],
      ),
    );
  }
}
