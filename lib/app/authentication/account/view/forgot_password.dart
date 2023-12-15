import 'package:application/packages.dart';

import '../../auth/components/title_page.dart';
import '../controller/account_controller.dart';
import 'package:application/required_files.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  final double space = 32;
  final double fontSize = 10;

  final _ = Get.put(AccountController());
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();
  final String title = 'Forgot Password';
  final String subTitle =
      'Please Enter your email Address To Recieve a Verification Code';

  void _recovery() async {
    if (_formKey.currentState!.validate()) {
      _.forgotPassword(mail: _email.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    double size = Get.width * 0.5;
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PageTitle(
                  title: title,
                  subTitle: subTitle,
                ),
                SizedBox(height: space),
                Container(
                  height: size,
                  width: size,
                  padding: EdgeInsets.all(size * 0.2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size),
                    color: AppColors.primaryColor.withOpacity(0.1),
                  ),
                  child: SvgPicture.asset(
                    AppAssets.keySquare,
                  ),
                ),
                SizedBox(height: space),
                FadeAnimationDx(
                  delay: 2,
                  child: CustomTextField(
                    labelText: 'E-mail',
                    textEditingController: _email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => Validator.email(value!),
                    onChanged: (value) => _.forgotPasswordError.value = '',
                  ),
                ),
                SizedBox(height: space),
                Obx(
                  () => Text(
                    _.forgotPasswordError.value.tr,
                    style: const TextStyle(fontSize: 12, color: Colors.red),
                  ),
                ),
                SizedBox(height: space),
                FadeAnimationDx(
                  delay: 3,
                  child: CustomElevatedButton(
                    height: 54,
                    width: double.infinity,
                    borderRadius: BorderRadius.circular(28),
                    onPressed: _recovery,
                    child: Obx(
                      () => _.isLoading.value
                          ? const CustomProgress(
                              color: Colors.white,
                            )
                          : Text(
                              'Send'.tr,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.white),
                            ),
                    ),
                  ),
                ),
                SizedBox(height: space * 2.2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
