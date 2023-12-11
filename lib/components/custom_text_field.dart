import '../packages.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    this.underline,
    this.isPassword = false,
    required this.textEditingController,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.suffix = true,
    this.hintText,
    this.autofocus = false,
  });

  final String labelText;
  final Color? underline;
  final bool isPassword;
  final bool suffix;
  final TextEditingController textEditingController;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final String? hintText;
  final bool autofocus;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: widget.autofocus,
      controller: widget.textEditingController,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword ? obscureText : false,
      validator: widget.validator,
      onChanged: widget.onChanged,
      cursorHeight: 26,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText.tr,
        suffix: widget.suffix
            ? GestureDetector(
                onTap: widget.isPassword ? updatevisiblity : clear,
                child: widget.isPassword
                    ? Icon(
                        obscureText ? Icons.visibility : Icons.visibility_off,
                        size: 16,
                        color: Colors.grey.shade300,
                      )
                    : Icon(
                        Icons.cancel,
                        size: 16,
                        color: Colors.grey.shade300,
                      ),
              )
            : null,
        // errorBorder: const UnderlineInputBorder(
        //   borderSide: BorderSide(color: Colors.red),
        // ),
      ),
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






