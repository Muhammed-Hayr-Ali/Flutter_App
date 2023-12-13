import 'package:application/packages.dart';
import 'package:application/required_files.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class VerifyVerificationCode extends StatelessWidget {
  VerifyVerificationCode({super.key});

  final double space = 32;
  final double fontSize = 10;

  final _ = Get.put(Account());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
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
                      'Verification'.tr,
                      style: TextStyle(
                          fontSize: 30,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Code'.tr,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w200),
                    ),
                  ],
                ),
              ),
              SizedBox(height: space),
              Text.rich(TextSpan(
                  text:
                      'Enter your verification code that we sent you through your email '
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
                  ])),
              const SizedBox(height: 10),
              Center(
                child: FadeAnimationDx(
                  delay: 2,
                  child: Obx(
                    () => _.isLoading.value
                        ? const CustomProgress()
                        : OTPTextField(
                            length: 6,
                            width: Get.width * 0.6,
                            fieldWidth: 30,
                            spaceBetween: 4,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textFieldAlignment: MainAxisAlignment.spaceAround,
                            fieldStyle: FieldStyle.underline,
                            outlineBorderRadius: 2,
                            onChanged: (v) => _.codeHasError(false),
                            onCompleted: (code) =>
                                _.verifyVerificationCode(code: code),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Obx(
                  () => _.codeHasError.value
                      ? Text(
                          'You have entered an incorrect verification code'.tr,
                          style:
                              const TextStyle(fontSize: 12, color: Colors.red),
                        )
                      : const SizedBox(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
