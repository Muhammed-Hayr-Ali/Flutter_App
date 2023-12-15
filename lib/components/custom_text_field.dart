import 'package:application/required_files.dart';

import '../packages.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.labelText,
    this.underline,
    this.isPassword = false,
    required this.textEditingController,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.suffix = true,
    this.hintText,
    this.autofocus = false,
    this.prefix,
    this.enabled,
  });

  final bool? enabled;
  final String? labelText;
  final Color? underline;
  final bool isPassword;
  final bool suffix;
  final TextEditingController textEditingController;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final String? hintText;
  final bool autofocus;
  final Widget? prefix;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
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
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.grey.withOpacity(0.08)),
          child: TextFormField(
            enabled: widget.enabled,
            autofocus: widget.autofocus,
            controller: widget.textEditingController,
            keyboardType: widget.keyboardType,
            obscureText: widget.isPassword ? obscureText : false,
            validator: widget.validator,
            onChanged: widget.onChanged,
            cursorHeight: 26,
            style: const TextStyle(fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              prefix: widget.prefix,
              hintText: widget.hintText,
              //  labelText: '${widget.labelText}'.tr,
              suffix: widget.suffix
                  ? GestureDetector(
                      onTap: widget.isPassword ? updatevisiblity : clear,
                      child: widget.isPassword
                          ? Icon(
                              obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              size: 16,
                              color: AppColors.grayColor,
                            )
                          : Icon(
                              Icons.cancel,
                              size: 16,
                              color: AppColors.grayColor,
                            ),
                    )
                  : null,
              // errorBorder: const UnderlineInputBorder(
              //   borderSide: BorderSide(color: Colors.red),
              // ),
            ),
          ),
        ),
      ],
    );
  }

  updatevisiblity() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  clear() {
    widget.textEditingController.clear();
  }
}
