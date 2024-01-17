import 'package:application/components/custom_date_picker.dart';
import 'package:application/components/custom_dropdown_utton.dart';
import 'package:application/packages.dart';
import 'package:application/required_files.dart';

import '../controller/profile_controller.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final double space = 32;
  final data = Get.arguments as User;

  final _formKey = GlobalKey<FormState>();
  final _ = Get.find<ProfileController>();
  final ImageService imageService = ImageService();

  String? _profileUrl;
  String? _newPath;
  TextEditingController _userName = TextEditingController();
  TextEditingController _status = TextEditingController();
  TextEditingController _gender = TextEditingController();
  TextEditingController _dateBirth = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      _profileUrl = data.profile;
      _userName = TextEditingController(text: data.name ?? '');
      _status = TextEditingController(text: data.status ?? '');
      _gender = TextEditingController(text: data.gender ?? '');
      _dateBirth = TextEditingController(text: data.dateBirth ?? '');
      _phoneNumber = TextEditingController(text: data.phoneNumber ?? '');
    });
  }

  void uploadImageProfile() async {
    final imagePath = await imageService.getImage();
    if (imagePath != null) {
      setState(() {
        _newPath = imagePath;
      });
    }
  }

  void _removeNewPath() {
    setState(() {
      _newPath = null;
    });
  }

  void _updateProfile() {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> data = {
        'newPath': _newPath,
        'name': _userName.text,
        'status': _status.text,
        'gender': _gender.text,
        'date_birth': _dateBirth.text,
        'phone_number': _phoneNumber.text,
      };
      _.updateProfile(map: data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edite Profile'.tr),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    children: [
                      SizedBox(
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Hero(
                              tag: 'user_avatar',
                              child: GestureDetector(
                                onTap: uploadImageProfile,
                                child: _newPath != null
                                    ? CustomAvatar(
                                        sourceImage: SourceImage.localImage,
                                        imagePath: _newPath)
                                    : CustomAvatar(
                                        sourceImage: SourceImage.networkImage,
                                        imagePath: _profileUrl!),
                              ),
                            ),
                            Container(
                              height: 34,
                              width: 34,
                              padding: const EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(34),
                                  color: Colors.white),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(34),
                                    color: AppColors.primaryColor),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: _newPath != null
                                      ? GestureDetector(
                                          onTap: _removeNewPath,
                                          child:
                                              SvgPicture.asset(AppAssets.trash),
                                        )
                                      : GestureDetector(
                                          child:
                                              SvgPicture.asset(AppAssets.pen),
                                        ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      CustomTextField(
                        labelText: 'Name',
                        hintText: 'Ex. John Doe',
                        controller: _userName,
                        keyboardType: TextInputType.name,
                        validator: (value) => Validator.userName(value!),
                      ),
                      SizedBox(height: space),
                      CustomTextField(
                        labelText: 'Status',
                        hintText: 'Hello World!',
                        controller: _status,
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: space),
                      CustomDropdownButton(
                        title: 'Gender',
                        controller: _gender,
                        listItem: AppConstants.genderList,
                        initValue: _gender.text,
                      ),
                      SizedBox(height: space),
                      CustomDatePicker(
                        controller: _dateBirth,
                        initialDate: _dateBirth.text,
                      ),
                      SizedBox(height: space),
                      CustomTextField(
                        labelText: 'Phone Number',
                        hintText: 'E.g 0933123456',
                        controller: _phoneNumber,
                        keyboardType: TextInputType.phone,
                        validator: (value) => Validator.phoneNumber(value!),
                      ),
                      SizedBox(height: space),
                      Center(
                        child: CustomElevatedButton(
                          onPressed: _updateProfile,
                          child: Obx(
                            () => _.isLoading.value
                                ? const CustomProgress(color: Colors.white)
                                : Text(
                                    'Save'.tr,
                                    style: const TextStyle(color: Colors.white),
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
          ],
        ),
      ),
    );
  }
}
