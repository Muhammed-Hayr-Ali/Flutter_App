import 'package:application/packages.dart';
import 'package:application/required_files.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  // final HomeController _ =
  //     Get.put<HomeController>(HomeController(), permanent: true);
  final double offsetToArmed = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            const Text(
              'Shop',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(width: 2),
            Text(
              'Online',
              style: TextStyle(
                  fontSize: 20,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              color: Colors.amber,
            ),
            Container(
              height: 200,
              color: Colors.amberAccent,
            ),
            Container(
              height: 200,
              color: Colors.blue,
            ),
            Container(
              height: 200,
              color: Colors.blueGrey,
            ),
            Container(
              height: 200,
              color: Colors.brown,
            ),
            Container(
              height: 200,
              color: Colors.deepOrange,
            ),
            Container(
              height: 200,
              color: Colors.deepPurple,
            ),
            Container(
              height: 200,
              color: Colors.greenAccent,
            ),
            Container(
              height: 200,
              color: Colors.lightBlue,
            ),
            Container(
              height: 200,
              color: Colors.limeAccent,
            ),
          ],
        ),
      ),
    );
  }
}
