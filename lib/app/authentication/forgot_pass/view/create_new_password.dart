import 'package:application/packages.dart';

import '../../../../components/title_page.dart';
import '../controller/forgot_pass.dart';
import 'package:application/required_files.dart';

class CreateNewPassword extends StatelessWidget {
  CreateNewPassword({super.key});

  final double space = 32;
  final double fontSize = 10;

  final _ = Get.find<ForgotPasswordController>();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final String title = 'Create New Password';
  final String subTitle =
      'Your New Password Must Be Different from Previous Password';
  final data = Get.arguments as Map<String, dynamic>;
  void _createNewPassword() async {
    if (_formKey.currentState!.validate()) {
      data['password'] = _password.text;

      final response = await _.createNewPassword(map: data);
      if (response) Get.offAllNamed(Routes.loginUser);
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
                  child: Container(
                    height: size,
                    width: size,
                    padding: EdgeInsets.all(size * 0.2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size),
                      color: AppColors.primaryColor.withOpacity(0.1),
                    ),
                    child: SvgPicture.asset(
                      AppAssets.password,
                    ),
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
                    validator: (value) =>
                        Validator.password(value!, _confirmPassword.text),
                  ),
                ),
                SizedBox(height: space),
                FadeAnimationDx(
                  delay: 5,
                  child: CustomTextField(
                    labelText: 'Confirm password',
                    hintText: '************',
                    isPassword: true,
                    controller: _confirmPassword,
                    keyboardType: TextInputType.multiline,
                    validator: (value) =>
                        Validator.password(value!, _password.text),
                  ),
                ),
                SizedBox(height: space),
                FadeAnimationDx(
                  delay: 6,
                  child: CustomElevatedButton(
                    onPressed: _createNewPassword,
                    child: Obx(
                      () => _.isLoading.value
                          ? const CustomProgress(
                              color: Colors.white,
                            )
                          : Text(
                              'save'.tr,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.white),
                            ),
                    ),
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
