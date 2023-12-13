import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:application/packages.dart';

import '../../home/home.dart';
import '../../notification/notifications.dart';
import '../../profile/view/profile_screen.dart';
import '../../search/search.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final List<Widget> view = [
    const Home(),
    const Search(),
    const Notifications(),
    ProfileScreen(),
  ];

  int currentScreen = 0;

  onItemTapped(int index) {
    setState(() {
      currentScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: view[currentScreen],
      bottomNavigationBar: FlashyTabBar(
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 100),
        shadows: const [],
        selectedIndex: currentScreen,
        showElevation: true,
        onItemSelected: (value) => onItemTapped(value),
        items: [
          FlashyTabBarItem(
            icon: const Icon(PhosphorIcons.house),
            title: Text('Home'.tr),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.search),
            title: const Text('Search'),
          ),
          FlashyTabBarItem(
            icon: const Icon(PhosphorIcons.bell),
            title: Text('Notifications'.tr),
          ),
          FlashyTabBarItem(
            icon: const Icon(PhosphorIcons.user_circle),
            title: Text('Profile'.tr),
          ),
        ],
      ),
    );
  }
}
