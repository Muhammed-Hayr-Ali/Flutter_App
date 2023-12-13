import 'package:application/packages.dart';
import 'package:application/required_files.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            const SizedBox(),
            Image.asset(
              AppAssets.logoPNG,
              width: Get.width * 0.35,
            ),
            const CustomProgress(),
            const Text('By PST', style: TextStyle(fontSize: 10))
          ],
        ),
      ),
    );
  }
}
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           toolbarHeight: 0,
//         ),
//         body: FutureBuilder<bool>(
//           future: SplashScreenController().currentUser(),
//           builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return loading();
//             } else {
//               if (snapshot.hasError) {
//                 return Authentication();
//               } else {
//                 if (snapshot.data == true) {
//                   return const NavBar();
//                 } else {
//                   return Authentication();
//                 }
//               }
//             }
//           },
//         ));
//   }
// }

// Widget loading() {
//   return Center(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         const SizedBox(),
//         const SizedBox(),
//         Image.asset(CustomAssets.logoPNG, width: Get.width * 0.4),
//         const CustomProgress(),
//         const Text('By PST', style: TextStyle(fontSize: 10))
//       ],
//     ),
//   );
// }
