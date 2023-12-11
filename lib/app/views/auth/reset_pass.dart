import 'package:application/packages.dart';
import 'package:application/required_files.dart';

class RessetPass extends StatelessWidget {
  RessetPass({super.key});

  final double space = 32;
  final double fontSize = 10;

  final _ = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();

  void _recovery() async {
    if (_.isLoading.value) return;

    if (_formKey.currentState!.validate()) {
      final response = await _.resetPassword(_email.text);
      response ? Get.toNamed(Routes.setPassword) : null; //;
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
                        'Recovery'.tr,
                        style: TextStyle(
                            fontSize: 30,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'account'.tr,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w200),
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
                SizedBox(height: space * 2.2),
                FadeAnimationDx(
                  delay: 3,
                  child: CustomElevatedButton(
                    height: 54,
                    width: double.infinity,
                    borderRadius: BorderRadius.circular(28),
                    onPressed: _recovery,
                    child: Obx(() => _.isLoading.value
                        ? const CustomProgress(
                            color: Colors.white,
                          )
                        : Text('Recovery'.tr,
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
