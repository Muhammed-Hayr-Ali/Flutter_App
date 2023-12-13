import 'package:application/packages.dart';
import 'package:application/required_files.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../controller/account.dart';

class VerifyVerificationCode extends StatelessWidget {
  VerifyVerificationCode({super.key});

  final double space = 32;
  final double fontSize = 10;

  final _ = Get.put(Account());
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _code = TextEditingController();

  void _verifyVerificationCode() async {
    _.verifyVerificationCode(code: _code.text);
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
                        'Verify Your'.tr,
                        style: TextStyle(
                            fontSize: 30,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Email'.tr,
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
                    Icons.mail,
                    size: size * .5,
                    color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(height: space),
                Text.rich(
                  TextSpan(
                    text:
                        'Please Enter your verification code that we sent you through your email '
                            .tr,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                    children: <InlineSpan>[
                      TextSpan(
                        text: _.email ?? '',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryColor),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                FadeAnimationDx(
                  delay: 2,
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
                      onChanged: (v) => _.invalidCodeError(false),
                      onCompleted: (code) => _code.text = code),
                ),
                SizedBox(height: space),
                Obx(
                  () => _.invalidCodeError.value
                      ? Text(
                          'Email verification code is invalid. You can request a new code if the code expires, noting that the code is valid for 15 minutes'
                              .tr,
                          style:
                              const TextStyle(fontSize: 12, color: Colors.red),
                        )
                      : const SizedBox(),
                ),
                SizedBox(height: space * 2.2),
                FadeAnimationDx(
                  delay: 3,
                  child: CustomElevatedButton(
                    height: 54,
                    width: double.infinity,
                    borderRadius: BorderRadius.circular(28),
                    onPressed: _verifyVerificationCode,
                    child: Obx(
                      () => _.isLoading.value
                          ? const CustomProgress(
                              color: Colors.white,
                            )
                          : Text(
                              'Verify'.tr,
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
