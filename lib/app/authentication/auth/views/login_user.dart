import 'package:application/packages.dart';
import 'package:application/required_files.dart';

import '../../../../components/title_page.dart';
import '../controller/login_controller.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final double space = 32;
  final double fontSize = 10;

  final _ = Get.put<LoginController>(LoginController());
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
      Map<String, dynamic> data = {
        'email': _email.text,
        'password': _password.text,
      };

      final response = await _.login(data: data);
      if (response) Get.offAllNamed(Routes.home);
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
                FadeAnimationDx(
                  delay: 2,
                  child: PageTitle(
                    title: title,
                    subTitle: subTitle,
                  ),
                ),
                SizedBox(height: space),
                FadeAnimationDx(
                  delay: 3,
                  child: CustomTextField(
                    labelText: 'E-mail',
                    hintText: 'example@gmail.com',
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => Validator.email(value!),
                  ),
                ),
                SizedBox(height: space),
                FadeAnimationDx(
                  delay: 4,
                  child: CustomTextField(
                    labelText: 'Password',
                    hintText: '************',
                    isPassword: true,
                    controller: _password,
                    keyboardType: TextInputType.multiline,
                    validator: (value) => Validator.pass(value!),
                  ),
                ),
                SizedBox(height: space / 2),
                FadeAnimationDx(
                  delay: 5,
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
                  delay: 6,
                  child: CustomElevatedButton(
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
                SizedBox(height: space),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
