import 'package:application/packages.dart';
import 'package:application/required_files.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../../../components/title_page.dart';
import '../controller/forgot_pass.dart';

class VerifyPhoneNumber extends StatelessWidget {
  VerifyPhoneNumber({super.key});

  final double space = 32;
  final double fontSize = 10;

  final _ = Get.find<ForgotPasswordController>();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _verificationCode = TextEditingController();
  final String title = 'Verify Your Number';
  final String subTitle =
      'Please enter your verification code that we sent to you via app notifications ';

  final data = Get.arguments as Map<String, dynamic>;

  void _verifyPhoneNumber() async {
    if (_verificationCode.text != '') {
      data['verificationCode'] = _verificationCode.text;
      final response = await _.verifyPhoneNumber(map: data);
      if (response) Get.toNamed(Routes.createNewPassword, arguments: data);
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
                      AppAssets.key,
                    ),
                  ),
                ),
                SizedBox(height: space),
                FadeAnimationDx(
                  delay: 4,
                  child: OTPTextField(
                    length: 6,
                    width: Get.width * 0.6,
                    fieldWidth: 30,
                    spaceBetween: 4,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldStyle: FieldStyle.underline,
                    outlineBorderRadius: 2,
                    onCompleted: (code) => _verificationCode.text = code,
                    onChanged: (value) {},
                  ),
                ),
                SizedBox(height: space),
                FadeAnimationDx(
                  delay: 5,
                  child: CustomElevatedButton(
                    onPressed: _verifyPhoneNumber,
                    child: Obx(
                      () => _.isLoading.value
                          ? const CustomProgress(
                              color: Colors.white,
                            )
                          : Text(
                              'Verify'.tr,
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
