import 'package:application/required_files.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';

class CustomPhoneField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final String? initialSelected;
  final TextEditingController phoneNumber;
  final TextEditingController contryCode;
  final String? Function(String?)? validator;

  const CustomPhoneField({
    super.key,
    required this.phoneNumber,
    required this.contryCode,
    this.validator,
    this.labelText,
    this.hintText,
    this.initialSelected,
  });

  @override
  State<CustomPhoneField> createState() => _CustomPhoneFieldState();
}

class _CustomPhoneFieldState extends State<CustomPhoneField> {
  final countryPickerWithParams = FlCountryCodePicker(
      showDialCode: true,
      showSearchBar: true,
      favorites: [
        "SY",
        "BH",
        "DZ",
        "SD",
        "IQ",
        "KW",
        "MA",
        "JO",
        "AE",
        "SA",
        "SO",
        "SS",
        "IQ",
        "KW",
        "BH",
        "JO",
        "DZ",
        "AE",
        "MA",
        "MR",
        "TN",
        "DJ",
        "SO",
        "PS",
        "LB",
        "LY",
        "EG",
        "YE",
        "OM",
        "QA"
      ],
     searchBarTextStyle: TextStyle(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w500),
      searchBarDecoration: InputDecoration(
        hintText: 'Syria',
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.08),
        contentPadding: const EdgeInsets.all(8.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ));

  String? countryCode;
  Future<void> _showContryCodePicker() async {
    final picked = await countryPickerWithParams.showPicker(
      context: context,
    );
    if (picked != null) {
      widget.contryCode.text = picked.dialCode;
      setState(() {
        countryCode = picked.dialCode;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      isLtrOnly: true,
      labelText: widget.labelText,
      hintText: widget.hintText,
      controller: widget.phoneNumber,
      keyboardType: TextInputType.phone,
      validator: widget.validator,
      prefix: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: _showContryCodePicker,
              child: Text(countryCode ?? widget.initialSelected ?? '',
                  textDirection: TextDirection.ltr,
                  style: widget.contryCode.text == ''
                      ? TextStyle(
                          color: AppColors.grayColor,
                          fontWeight: FontWeight.w500)
                      : TextStyle(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w500)),
            ),
            const SizedBox(width: 8)
          ],
        ),
      ),
    );
  }
}
