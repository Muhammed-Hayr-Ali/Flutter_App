import 'package:application/packages.dart';
import 'package:application/required_files.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final double space = 32;
  final _localStorage = LocalStorage();
  final ProfileController _ = Get.find<ProfileController>();
  final _formKey = GlobalKey<FormState>();
  final userName = TextEditingController();
  final phoneNumber = TextEditingController();
  final status = TextEditingController();

  void getUserProfile() {
    var data = _localStorage.readData(keys: Keys.profile);
    UserProfile currentUser = UserProfile.fromJson(data);
    userName.text = currentUser.name!;
    status.text = currentUser.status!;
    phoneNumber.text = currentUser.phoneNumber!;
  }

  void updateUserProfile() {
    UserProfile userProfile = UserProfile(
      name: userName.text,
      status: status.text,
      phoneNumber: phoneNumber.text,
    );
    _.save(userProfile);
  }

  @override
  void initState() {
    super.initState();
    getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edite Profile'.tr),
        actions:  [
            Obx(
              () => _.loadingSave.value
                  ? const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: CustomProgress()),
                    )
                  : TextButton(
                      onPressed: updateUserProfile,
                      child: Text('Save'.tr)),
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
                  textEditingController: userName,
                  keyboardType: TextInputType.name,
                  validator: (value) => Validator.userName(value!),
                ),
                SizedBox(height: space),
                CustomTextField(
                  labelText: 'Status',
                  textEditingController: status,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: space),
                CustomTextField(
                  labelText: 'Phone Number',
                  textEditingController: phoneNumber,
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
