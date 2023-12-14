import 'package:application/packages.dart';
import 'package:application/required_files.dart';

import '../controller/profile_controller.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  final double space = 32;

  final _ = Get.find<ProfileController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edite Profile'.tr),
        actions: [
          TextButton(
              onPressed: () => _.updateProfile(), child: Text('Save'.tr)),
        ],
      ),
      body: Column(
        children: [
          Obx(
            () => _.isLoading.value
                ? const LinearProgressIndicator()
                : const SizedBox(height: 4),
          ),
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    CustomTextField(
                      labelText: 'User Name',
                      textEditingController: _.userName,
                      keyboardType: TextInputType.name,
                      validator: (value) => Validator.userName(value!),
                    ),
                    SizedBox(height: space),
                    CustomTextField(
                      labelText: 'Status',
                      textEditingController: _.status,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: space),
                    CustomTextField(
                      labelText: 'Phone Number',
                      textEditingController: _.phoneNumber,
                      keyboardType: TextInputType.phone,
                      validator: (value) => Validator.mobile(value!),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
