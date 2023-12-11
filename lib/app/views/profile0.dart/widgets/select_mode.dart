import 'package:application/packages.dart';
import 'package:application/required_files.dart';

class SelectMode extends StatefulWidget {
  const SelectMode({super.key});

  @override
  State<SelectMode> createState() => _SelectModeState();
}

class _SelectModeState extends State<SelectMode> {
  final LocalStorage localStorage = LocalStorage();
  bool? _selectedValue;
  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedValue = localStorage.readData(keys: Keys.theme);
    });
  }

  void onChanged(bool? value) {
    setState(() {
      _selectedValue = value;
    });

    if (value == null) {
      Get.changeThemeMode(ThemeMode.system);
    } else if (value == true) {
      Get.changeThemeMode(ThemeMode.dark);
    } else if (value == false) {
      Get.changeThemeMode(ThemeMode.light);
    }

    localStorage.saveData(keys: Keys.theme, data: value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomListItem(
          child: Row(
            children: [
              Radio(
                value: null,
                groupValue: _selectedValue,
                onChanged: (value) => onChanged(null),
              ),
              Text('System Settings'.tr,
                  style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
          onTap: () => onChanged(null),
        ),
        const Divider(),
        CustomListItem(
          child: Row(
            children: [
              Radio(
                value: false,
                groupValue: _selectedValue,
                onChanged: (value) => onChanged(value!),
              ),
              Text('Light Mode'.tr,
                  style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
          onTap: () => onChanged(false),
        ),
        const Divider(),
        CustomListItem(
          child: Row(
            children: [
              Radio(
                value: true,
                groupValue: _selectedValue,
                onChanged: (value) => onChanged(value!),
              ),
              Text('Dark Mode'.tr,
                  style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
          onTap: () => onChanged(true),
        ),
      ],
    );
  }
}
