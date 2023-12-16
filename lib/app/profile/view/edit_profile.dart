import 'package:application/components/custom_dropdown_utton.dart';
import 'package:application/components/custom_phone_field.dart';
import 'package:application/packages.dart';
import 'package:application/required_files.dart';

import '../controller/profile_controller.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  final _ = Get.find<ProfileController>();
  final data = Get.arguments as User;
  final List<String> genderList = ['Unspecified', 'Male', 'Female'];

  String? _profile;
  TextEditingController _userName = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _countryCode = TextEditingController();
  TextEditingController _status = TextEditingController();
  TextEditingController _gender = TextEditingController();
  final double space = 32;
  String? path;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _profile = data.profile;
      _userName = TextEditingController(text: data.name ?? '');
      _status = TextEditingController(text: data.status ?? '');
      _countryCode = TextEditingController(text: data.countryCode ?? '');
      _phoneNumber = TextEditingController(text: data.phoneNumber ?? '');
      _gender = TextEditingController(text: data.gender ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edite Profile'.tr),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    SizedBox(child: CustomAvatar(imageUrl: _profile ?? '')),
                    const SizedBox(height: 8),
                    CustomTextField(
                      labelText: 'User Name',
                      controller: _userName,
                      keyboardType: TextInputType.name,
                      validator: (value) => Validator.userName(value!),
                    ),
                    SizedBox(height: space),
                    CustomTextField(
                      labelText: 'Status',
                      controller: _status,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: space),
                    CustomPhoneField(
                        hintText: 'Edit your Number',
                        labelText: 'Phone Number',
                        initialSelected: _countryCode.text,
                        phoneNumber: _phoneNumber,
                        contryCode: _countryCode),
                    SizedBox(height: space),
                    CustomDropdownButton(
                      title: 'Gender',
                      controller: _gender,
                      listItem: genderList,
                      initValue: data.gender,
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
