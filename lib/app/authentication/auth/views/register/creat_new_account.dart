import 'package:application/packages.dart';
import 'package:application/required_files.dart';
import '../../../../../components/title_page.dart';
import '../../controller/creat_new_account.dart';

class CreatNewAccount extends StatelessWidget {
  CreatNewAccount({super.key});

  final double space = 32;

  final _ = Get.put<CreatNewAccountController>(CreatNewAccountController());
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  final String title = 'Create Account';
  final String subTitle =
      'Fill in your information below, and proceed to the home page';

  void _createNewAccount() async {
    if (_.isLoading.value) return;

    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> data = {
        'email': _email.text,
        'password': _password.text,
      };
      final response = await _.checkMailAvailability(map: data);
      if (response) Get.toNamed(Routes.completetYourProfile, arguments: data);
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
                    labelText: 'Email',
                    hintText: 'example@gmail.com',
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => Validator.email(value!),
                  ),
                ),
                SizedBox(height: space / 2),
                Row(
                  children: [
                    FadeAnimationDx(
                      delay: 4,
                      child: Text(
                        'You cannot edit the email at a later time'.tr,
                        style:
                            TextStyle(fontSize: 12, color: AppColors.grayColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: space / 2),
                FadeAnimationDx(
                  delay: 5,
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
                  delay: 6,
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
                  delay: 7,
                  child: CustomElevatedButton(
                    onPressed: _createNewAccount,
                    child: Obx(() => _.isLoading.value
                        ? const CustomProgress(color: Colors.white)
                        : Text(
                            'Next'.tr,
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
