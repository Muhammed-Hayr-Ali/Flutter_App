import 'package:application/components/custom_date_picker.dart';
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
  final data = Get.arguments as User;
  final _ = Get.find<ProfileController>();
  final ImageService imageService = ImageService();
  final double space = 32;

  String? _profile;
  String? _path;
  TextEditingController _userName = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _countryCode = TextEditingController();
  TextEditingController _status = TextEditingController();
  TextEditingController _gender = TextEditingController();
  TextEditingController _dateBirth = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      _profile = data.profile;
      _userName = TextEditingController(text: data.name ?? '');
      _status = TextEditingController(text: data.status ?? '');
      _countryCode = TextEditingController(text: data.countryCode ?? '');
      _phoneNumber = TextEditingController(text: data.phoneNumber ?? '');
      _gender = TextEditingController(text: data.gender ?? '');
      _dateBirth = TextEditingController(text: data.dateBirth ?? '');
    });
  }

  void upDateProfile() {
    if (_.isLoading.value) return;
    Map<String, dynamic> newUser = {
      'name': _userName.text,
      'status': _status.text,
      'countryCode': _countryCode.text,
      'phoneNumber': _phoneNumber.text,
      'gender': _gender.text,
      'dateBirth': _dateBirth.text,
      'path': _path,
    };
    _.updateProfile(newUser: newUser);
  }

  void uploadImageProfile() async {
    final imagePath = await imageService.getImage();
    if (imagePath != null) {
      setState(() {
        _path = imagePath;
      });
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
                                child: _path != null
                                    ? CustomAvatar(
                                        sourceImage: SourceImage.localImage,
                                        imagePath: _path)
                                    : CustomAvatar(
                                        sourceImage: SourceImage.networkImage,
                                        imagePath: _profile),
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
                                child: _path != null
                                    ? GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _path = null;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child:
                                              SvgPicture.asset(AppAssets.trash),
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: GestureDetector(
                                          onTap: uploadImageProfile,
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
                      CustomPhoneField(
                          labelText: 'Phone Number',
                          hintText: 'Enter your phone number',
                          initialSelected: _countryCode.text,
                          phoneNumber: _phoneNumber,
                          contryCode: _countryCode),
                      SizedBox(height: space),
                      CustomDropdownButton(
                        title: 'Gender',
                        controller: _gender,
                        listItem: AppConstants.genderList,
                        initValue: data.gender,
                      ),
                      SizedBox(height: space),
                      CustomDatePicker(
                        controller: _dateBirth,
                        initialDate: data.dateBirth,
                      ),
                      const SizedBox(height: 38.0),
                      Center(
                        child: CustomElevatedButton(
                          width: Get.width * 0.7,
                          height: 48,
                          borderRadius: BorderRadius.circular(38.0),
                          backgroundColor: AppColors.primaryColor,
                          onPressed: upDateProfile,
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
                      const SizedBox(height: 80.0),
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
