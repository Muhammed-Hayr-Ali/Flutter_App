import 'package:application/packages.dart';
import 'package:application/required_files.dart';

class SetPassword extends StatelessWidget {
  SetPassword({super.key});

  final double space = 32;
  final double fontSize = 10;

  final _ = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _verificationCode = TextEditingController();

  void _reset() async {
    if (_.isLoading.value) return;

    if (_formKey.currentState!.validate()) {
      final response = await _.reset(
          _email.text, _verificationCode.text, _confirmPassword.text);
      response ? Get.offAllNamed(Routes.home) : null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
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
                        'Reset'.tr,
                        style: TextStyle(
                            fontSize: 30,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Password'.tr,
                        style: TextStyle(
                            fontSize: 30,
                            color: AppColors.blueVogue,
                            fontWeight: FontWeight.w200),
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
                    validator: (value) => Validator.email(value!),
                  ),
                ),
                SizedBox(height: space),
                FadeAnimationDx(
                  delay: 3,
                  child: CustomTextField(
                    labelText: 'verification code',
                    textEditingController: _verificationCode,
                    keyboardType: TextInputType.phone,
                    validator: (value) => Validator.verificationCode(value!),
                  ),
                ),
                SizedBox(height: space / 2),
                FadeAnimationDx(
                  delay: 5,
                  child: Text(
                    'You can find the verification code in the inbox'.tr,
                    style: const TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ),
                SizedBox(height: space / 2),
                FadeAnimationDx(
                  delay: 4,
                  child: CustomTextField(
                    labelText: 'Password',
                    isPassword: true,
                    textEditingController: _password,
                    keyboardType: TextInputType.multiline,
                    validator: (value) =>
                        Validator.password(value!, _confirmPassword.text),
                  ),
                ),
                SizedBox(height: space),
                FadeAnimationDx(
                  delay: 5,
                  child: CustomTextField(
                    labelText: 'Confirm password',
                    isPassword: true,
                    textEditingController: _confirmPassword,
                    keyboardType: TextInputType.multiline,
                    validator: (value) =>
                        Validator.password(value!, _password.text),
                  ),
                ),
                SizedBox(height: space * 2.2),
                FadeAnimationDx(
                  delay: 6,
                  child: CustomElevatedButton(
                    height: 54,
                    width: double.infinity,
                    borderRadius: BorderRadius.circular(28),
                    onPressed: _reset,
                    child: Obx(() => _.isLoading.value
                        ? const CustomProgress(
                            color: Colors.white,
                          )
                        : Text('Reset'.tr,
                            style: const TextStyle(color: Colors.white),)),
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

// 