import 'package:application/packages.dart';

import '../../../../components/title_page.dart';
import '../controller/forgot_pass.dart';
import 'package:application/required_files.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  final double space = 32;
  final double fontSize = 10;

  final _ = Get.put<ForgotPasswordController>(ForgotPasswordController());
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _phoneNumber = TextEditingController();
  final String title = 'Forgot Password';
  final String subTitle =
      'Please Enter your Phone Number To Receive a Verification Code';

  void _sendVerificationCode() async {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> map = {'phone_number': _phoneNumber.text};
      final response = await _.sendVerificationCode(map: map);
      if (response) Get.toNamed(Routes.verifyPhoneNumber, arguments: map);
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
                      AppAssets.simCard,
                    ),
                  ),
                ),
                SizedBox(height: space),
                FadeAnimationDx(
                  delay: 4,
                  child: CustomTextField(
                    labelText: 'Phone Number',
                    hintText: 'E.g 0933123456',
                    controller: _phoneNumber,
                    keyboardType: TextInputType.phone,
                    validator: (value) => Validator.phoneNumber(value!),
                  ),
                ),
                SizedBox(height: space),
                FadeAnimationDx(
                  delay: 5,
                  child: CustomElevatedButton(
                    onPressed: _sendVerificationCode,
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
                SizedBox(height: space),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
