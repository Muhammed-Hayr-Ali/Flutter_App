import 'package:application/packages.dart';

class CustomDropdownButton extends StatefulWidget {
  final String? title;
  final TextEditingController value;
  final List<String> listItem;

  const CustomDropdownButton(
      {super.key, required this.value, required this.listItem, this.title});

  @override
  State<CustomDropdownButton> createState() => _CustomState();
}

class _CustomState extends State<CustomDropdownButton> {
  String initValue = '';

  @override
  void initState() {
    super.initState();
    initValue = widget.listItem[0];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: widget.title == ''
              ? null
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${widget.title}'.tr),
                    const SizedBox(height: 2),
                  ],
                ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.grey.withOpacity(0.08)),
          child: DropdownButtonFormField(
            decoration: const InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              errorBorder: InputBorder.none,
              filled: false,
            ),
            // dropdownColor: Colors.w,
            value: initValue,
            onChanged: (String? newValue) {
              widget.value.text = newValue ?? '';
              initValue = newValue ?? '';
            },
            items:
                widget.listItem.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
