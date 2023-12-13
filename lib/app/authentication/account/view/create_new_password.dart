import 'package:application/packages.dart';

import '../controller/account.dart';
import 'package:application/required_files.dart';

class CreateNewPassword extends StatelessWidget {
  CreateNewPassword({super.key});

  final double space = 32;
  final double fontSize = 10;

  final _ = Get.put(Account());
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  void _recovery() async {
    if (_formKey.currentState!.validate()) {
      _.createNewPassword(password: _password.text);
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
                  delay: 1,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Forgot'.tr,
                        style: TextStyle(
                            fontSize: 30,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Password'.tr,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: space),
                Container(
                  height: size,
                  width: size,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size),
                    color: AppColors.primaryColor.withOpacity(0.1),
                  ),
                  child: Icon(
                    Icons.lock,
                    size: size * .5,
                    color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(height: space),
                Text(
                  'Please Enter your email Address To Recieve a Verification Code'
                      .tr,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 10),
   
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
                              style: const TextStyle(color: Colors.white),
                            ),
                    ),
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
