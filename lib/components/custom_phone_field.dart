import 'package:application/packages.dart';
import 'package:application/required_files.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';

enum Mode { phone, contry }

class CustomPhoneField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final String? initialSelected;
  final String? initialvalue;
  final bool showDialCode;
  final bool showSearchBar;
  final Mode mode;
  final TextEditingController? phoneNumber;
  final TextEditingController? contryCode;
  final TextEditingController? contryName;
  final String? Function(String?)? validator;

  const CustomPhoneField({
    super.key,
    this.phoneNumber,
    this.contryCode,
    this.validator,
    this.labelText,
    this.hintText,
    this.initialSelected,
    this.showDialCode = true,
    this.showSearchBar = true,
    this.mode = Mode.phone,
    this.contryName,
    this.initialvalue,
  });

  @override
  State<CustomPhoneField> createState() => _CustomPhoneFieldState();
}

class _CustomPhoneFieldState extends State<CustomPhoneField> {
  String? countryCode;
  String? countryName;
  List<String> favorites = const [
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
  ];
  Future<void> _showContryCodePicker() async {
    final picked = await FlCountryCodePicker(
        showDialCode: widget.showDialCode,
        showSearchBar: widget.showSearchBar,
        favorites: favorites,
        searchBarTextStyle:
            TextStyle(color: AppColors.blackColor, fontWeight: FontWeight.w500),
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
        )).showPicker(
      context: context,
    );
    if (picked != null) {
      if (widget.contryCode != null) {
        widget.contryCode!.text = picked.dialCode;
      }
      if (widget.contryName != null) {
        widget.contryName!.text = picked.name;
      }

      setState(() {
        countryCode = picked.dialCode;
        countryName = picked.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.mode == Mode.contry
        ? GestureDetector(
            onTap: _showContryCodePicker,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: widget.labelText != null
                      ? Column(
                          children: [
                            Text('${widget.labelText}'.tr),
                            const SizedBox(height: 2),
                          ],
                        )
                      : null,
                ),
                Container(
                  height: 48,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.grey.withOpacity(0.08)),
                  child: Center(
                      child: Row(
                    children: [
                      countryCode != null
                          ? Text(
                              countryName!,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            )
                          : widget.initialvalue != null
                              ? Text(
                                  widget.initialvalue!,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                )
                              : Text(
                                  widget.initialSelected ?? '',
                                  style: TextStyle(
                                      color: AppColors.grayColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                    ],
                  )),
                )
              ],
            ),
          )
        : CustomTextField(
            isLtrOnly: true,
            labelText: widget.labelText,
            hintText: widget.hintText,
            controller: widget.phoneNumber ?? TextEditingController(),
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
                        style: widget.contryCode!.text == ''
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
