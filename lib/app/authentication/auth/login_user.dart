import 'package:application/packages.dart';
import 'package:application/required_files.dart';

import 'components/title_page.dart';
import 'controller/auth_controller.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final double space = 32;
  final double fontSize = 10;

  final _ = Get.find<AuthControlleer>();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final String title = 'Sign In';
  final String subTitle = 'Hi! Welcome Back, you\'ve been missed';

  void _recovery() {
    Get.toNamed(Routes.forgotPassword);
  }

  void _signIn() async {
    if (_.isLoading.value) return;

    if (_formKey.currentState!.validate()) {
      _.login({
        'email': _email.text,
        'password': _password.text,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                FadeAnimationDx(
                  delay: 2,
                  child: CustomTextField(
                    labelText: 'E-mail',
                    hintText: 'example@gmail.com',
                    textEditingController: _email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => Validator.email(value!),
                  ),
                ),
                SizedBox(height: space),
                FadeAnimationDx(
                  delay: 3,
                  child: CustomTextField(
                    labelText: 'Password',
                    hintText: '************',
                    isPassword: true,
                    textEditingController: _password,
                    keyboardType: TextInputType.multiline,
                    validator: (value) => Validator.pass(value!),
                  ),
                ),
                SizedBox(height: space / 2),
                FadeAnimationDx(
                  delay: 4,
                  child: TextButton(
                    onPressed: _recovery,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot your password?'.tr,
                          style: TextStyle(
                              fontSize: 12, color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: space * 2.2),
                FadeAnimationDx(
                  delay: 5,
                  child: CustomElevatedButton(
                    height: 54,
                    width: double.infinity,
                    borderRadius: BorderRadius.circular(28),
                    onPressed: _signIn,
                    child: Obx(() => _.isLoading.value
                        ? const CustomProgress(
                            color: Colors.white,
                          )
                        : Text(
                            'Sign in'.tr,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          )),
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
