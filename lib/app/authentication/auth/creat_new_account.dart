import 'package:application/packages.dart';
import 'package:application/required_files.dart';
import 'components/upload_image.dart';
import 'controller/auth.dart';

class CreatNewAccount extends StatelessWidget {
  CreatNewAccount({super.key});

  final double space = 32;

  final _ = Get.find<Auth>();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _userName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _imagePath = TextEditingController();

  void _createNewAccount() async {
    if (_.isLoading.value) return;

    if (_formKey.currentState!.validate()) {
      _.register({
        'name': _userName.text,
        'email': _email.text,
        'password': _password.text,
        'path': _imagePath.text
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
                        'join'.tr,
                        style: TextStyle(
                            fontSize: 30,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'us'.tr,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: space),
                UploadImage(
                  pathImage: _imagePath,
                ),
                SizedBox(height: space),
                FadeAnimationDx(
                  delay: 2,
                  child: CustomTextField(
                    labelText: 'User Name',
                    textEditingController: _userName,
                    keyboardType: TextInputType.name,
                    validator: (value) => Validator.userName(value!),
                  ),
                ),
                SizedBox(height: space),
                FadeAnimationDx(
                  delay: 4,
                  child: CustomTextField(
                    labelText: 'E-mail',
                    textEditingController: _email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => Validator.email(value!),
                  ),
                ),
                SizedBox(height: space / 2),
                FadeAnimationDx(
                  delay: 5,
                  child: Text(
                    'You cannot edit the email at a later time'.tr,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
                SizedBox(height: space / 2),
                FadeAnimationDx(
                  delay: 6,
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
                  delay: 7,
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
                  delay: 9,
                  child: CustomElevatedButton(
                    height: 54,
                    width: double.infinity,
                    borderRadius: BorderRadius.circular(28),
                    onPressed: _createNewAccount,
                    child: Obx(() => _.isLoading.value
                        ? const CustomProgress(color: Colors.white)
                        : Text(
                            'Create New Account'.tr,
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
