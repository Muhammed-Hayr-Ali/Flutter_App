import 'package:application/packages.dart';
import 'package:application/required_files.dart';

import 'auth/controller/auth_controller.dart';

class Authentication extends StatelessWidget {
  Authentication({super.key});

  final double fontSize = 9;
  final _ = Get.put<AuthControlleer>(AuthControlleer());

  void _continueWithGoogle() async {
    if (_.isLoading.value) return;
    final response = await _.continueWithGoogle();
    if (response) Get.offAllNamed(Routes.home);
  }

  void _signIn() {
    if (_.isLoading.value) return;
    Get.toNamed(Routes.loginUser);
  }

  void _createNewAccount() {
    if (_.isLoading.value) return;
    Get.toNamed(Routes.creatNewAccount);
  }

  void _dataPolicy() {
    _.dataPolicy();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  AppAssets.logoPNG,
                  width: Get.width * 0.35,
                ),
              ),
            ),
            FadeAnimationDy(
              delay: 2,
              child: CustomElevatedButton(
                backgroundColor: AppColors.grayColor.withOpacity(0.2),
                overlayColor: Colors.black12,
                onPressed: _continueWithGoogle,
                child: Obx(
                  () => _.isLoading.value
                      ? CustomProgress(
                          color: AppColors.primaryColor,
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Continue With Google'.tr,
                            ),
                            const SizedBox(width: 6),
                            SvgPicture.asset(AppAssets.google),
                          ],
                        ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'You can also '.tr,
              style: const TextStyle(fontSize: 12),
            ),
            FadeAnimationDy(
              delay: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _createNewAccount,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        'create an account'.tr,
                        style: TextStyle(
                            fontSize: 12,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Text(
                    ' or '.tr,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  GestureDetector(
                    onTap: _signIn,
                    child: Text(
                      'login'.tr,
                      style: TextStyle(
                          fontSize: 12,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            FadeAnimationDy(
              delay: 4,
              child: TextButton(
                onPressed: _dataPolicy,
                style: ButtonStyle(
                  splashFactory: NoSplash.splashFactory,
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.scale(
                      scale: 0.5,
                      child: Checkbox(
                        visualDensity:
                            const VisualDensity(horizontal: -4.0, vertical: 0),
                        value: true,
                        checkColor: AppColors.primaryColor,
                        activeColor: Colors.transparent,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        side: MaterialStateBorderSide.resolveWith(
                          (states) => BorderSide(
                              width: 2.0, color: AppColors.primaryColor),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onChanged: (newValue) {},
                      ),
                    ),
                    Text(
                      'By continuing, you agree to '.tr,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text('our data policy'.tr,
                        style: Theme.of(context).textTheme.bodySmall?.merge(
                              TextStyle(color: AppColors.primaryColor),
                            )),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
