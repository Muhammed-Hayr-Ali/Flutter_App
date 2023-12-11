import 'package:application/packages.dart';
import 'package:application/required_files.dart';

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
          Obx(
            () => _.loadingSave.value
                ? const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: CustomProgress()),
                  )
                : TextButton(onPressed: () {}, child: Text('Save'.tr)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
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
    );
  }
}
