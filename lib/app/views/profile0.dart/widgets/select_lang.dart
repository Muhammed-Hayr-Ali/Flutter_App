import 'package:application/packages.dart';
import 'package:application/required_files.dart';

class SelectLang extends StatefulWidget {
  const SelectLang({super.key});

  @override
  State<SelectLang> createState() => _SelectModeState();
}

class _SelectModeState extends State<SelectLang> {
  final LocalStorage localStorage = LocalStorage();
  String _selectedValue = 'en';

  @override
  void initState() {
    _selectedValue = localStorage.readData(keys: Keys.language) ?? 'ar';
    super.initState();
  }

  void onChanged(String value) {
    setState(() {
      _selectedValue = value;
    });
    Get.updateLocale(Locale(value));

    localStorage.saveData(keys: Keys.language, data: value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomListItem(
          child: Row(
            children: [
              Radio<String>(
                value: 'ar',
                groupValue: _selectedValue,
                onChanged: (value) => onChanged(value!),
              ),
              Text('العربية', style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
          onTap: () => onChanged('ar'),
        ),
        const Divider(),
        CustomListItem(
          child: Row(
            children: [
              Radio<String>(
                value: 'en',
                groupValue: _selectedValue,
                onChanged: (value) => onChanged(value!),
              ),
              Text('English', style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
          onTap: () => onChanged('en'),
        ),
      ],
    );
  }
}
