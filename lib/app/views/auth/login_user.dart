import 'package:application/packages.dart';
import 'package:application/required_files.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final double space = 32;
  final double fontSize = 10;

  final _ = Get.find<Auth>();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeAnimationDx(
                  delay: 1,
                  child: Row(
                    children: [
                      Text(
                        'Welcome'.tr,
                        style: TextStyle(
                            fontSize: 30,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Back'.tr,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: space),
                FadeAnimationDx(
                  delay: 2,
                  child: CustomTextField(
                    labelText: 'E-mail',
                    textEditingController: _email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => Validator.userName(value!),
                  ),
                ),
                SizedBox(height: space),
                FadeAnimationDx(
                  delay: 3,
                  child: CustomTextField(
                    labelText: 'Password',
                    isPassword: true,
                    textEditingController: _password,
                    keyboardType: TextInputType.multiline,
                    validator: (value) => Validator.pass(value!),
                  ),
                ),
                SizedBox(height: space),
                FadeAnimationDx(
                  delay: 4,
                  child: TextButton(
                    onPressed: _recovery,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Forgot your password? '.tr,
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Text(
                          'Recovery'.tr,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.green),
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
                            style: const TextStyle(color: Colors.white),
                          )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
