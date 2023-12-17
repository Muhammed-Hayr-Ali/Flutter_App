import 'package:application/packages.dart';
import 'package:application/required_files.dart';

class CustomDatePicker extends StatefulWidget {
  final String? labelText;
  final TextEditingController controller;
  final String? initialDate;

  const CustomDatePicker(
      {super.key, required this.controller, this.labelText, this.initialDate});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  String? dateTime;

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1924),
      lastDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.day,
      locale: const Locale('en', 'US'),
      textDirection: TextDirection.ltr,
      initialEntryMode: DatePickerEntryMode.calendar,
      helpText: 'Select a date',
      cancelText: 'Cancel',
      confirmText: 'Ok',
      fieldHintText: 'Month/Day/Year',
      fieldLabelText: 'Date',
      errorFormatText: 'Invalid date format',
      errorInvalidText: 'Invalid date',
      useRootNavigator: true,
    );

    if (picked != null) {
      String newDate = picked.format('d/m/Y');
      widget.controller.text = newDate;

      setState(() {
        dateTime = newDate;
      });
    }
  }

  void _remove() {
    widget.controller.clear();
    setState(() {
      dateTime = null;
    });
  }

  @override
  void initState() {
    super.initState();
    dateTime = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: widget.labelText != null
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('${widget.labelText}'.tr),
                    const SizedBox(height: 2),
                  ],
                )
              : null,
        ),
        GestureDetector(
          onTap:  _selectDate,
          child: Container(
            height: 48,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey.withOpacity(0.08)),
            child: Row(
              children: [
                Expanded(
                  child: dateTime != null
                      ? Text(
                          dateTime ?? '',
                          style: const TextStyle(fontSize: 18),
                        )
                      : const Text(
                          '8/11/1986',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                ),
                SizedBox(
                  child: dateTime != null
                      ? GestureDetector(
                          onTap: _remove,
                          child: Icon(
                            Icons.cancel,
                            size: 16,
                            color: AppColors.grayColor,
                          ),
                        )
                      : null,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
