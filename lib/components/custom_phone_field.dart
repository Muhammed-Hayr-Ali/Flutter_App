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

  const CustomPhoneField(
      {super.key,
      required this.phoneNumber,
      required this.contryCode,
      this.validator,
      this.labelText,
      this.hintText,
      this.initialSelected});

  @override
  State<CustomPhoneField> createState() => _CustomPhoneFieldState();
}

const countryPickerWithParams = FlCountryCodePicker(
  localize: true,
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
);

class _CustomPhoneFieldState extends State<CustomPhoneField> {
  String? countryCode;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      labelText: widget.labelText,
      hintText: widget.hintText,
      controller: widget.phoneNumber,
      keyboardType: TextInputType.phone,
      validator: widget.validator,
      prefix: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () async {
              // Show the country code picker when tapped.
              final picked = await countryPickerWithParams.showPicker(
                context: context,
                // initialSelectedLocale: widget.initialSelectedLocale,
              );
              // Null check
              if (picked != null) {
                debugPrint(picked.code);
                widget.contryCode.text = picked.dialCode;
                setState(() {
                  countryCode = picked.dialCode;
                });
              }
            },
            child: Text(countryCode ?? widget.initialSelected ?? '',
                style: const TextStyle(color: Colors.black)),
          ),
          const SizedBox(width: 8)
        ],
      ),
    );
  }
}
