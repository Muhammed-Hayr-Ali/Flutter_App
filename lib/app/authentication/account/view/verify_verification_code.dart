import 'package:application/packages.dart';
import 'package:application/required_files.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../auth/components/title_page.dart';
import '../controller/account_controller.dart';

class VerifyVerificationCode extends StatelessWidget {
  VerifyVerificationCode({super.key});

  final double space = 32;
  final double fontSize = 10;

  final _ = Get.put(AccountController());
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _verificationCode = TextEditingController();
  final String title = 'Verify Your Email';
  final String subTitle = 'Please Enter your verification code that we sent you through your email ';
  
  final data = Get.arguments as Map;
  void _verifyVerificationCode() async {
    _.verifyVerificationCode(email: data['email'], verificationCode: _verificationCode.text);
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
            
                 PageTitle(
                  title: title,
                  subTitle: subTitle,
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
                    Icons.mark_email_read_sharp,
                    size: size * .5,
                    color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(height: space),


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
                    onCompleted: (code) => _verificationCode.text = code,
                    onChanged: (value) => _.verifyVerificationCodeError.value = '',
                  ),
                ),
                SizedBox(height: space),
                Obx(
                  () => Text(
                    _.verifyVerificationCodeError.value.tr,
                    style: const TextStyle(fontSize: 12, color: Colors.red),
                  ),
                ),
                SizedBox(height: space),
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
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                            ),
                    ),
                  ),
                ),
                           SizedBox(height: space * 2.2),
   ],
            ),
          ),
        ),
      ),
    );
  }
}
