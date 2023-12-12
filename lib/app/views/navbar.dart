import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:application/packages.dart';
import 'package:application/required_files.dart';

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
      // bottomNavigationBar: BottomNavigationBar(
      //   landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
      //   type: BottomNavigationBarType.fixed,
      //   fixedColor: Colors.red,
      //   elevation: 0,
      //   enableFeedback: true,
      //   onTap: (value) => onItemTapped(value),
      //   currentIndex: currentScreen,
      //   showSelectedLabels: false,
      //   showUnselectedLabels: false,
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: const Icon(PhosphorIcons
      //             .house), // icon('assets/icons/bottom_navbar/home_icon.svg', 'home'),
      //         activeIcon: const Icon(PhosphorIcons.house_fill),
      //         label: 'home'.tr),
      //     BottomNavigationBarItem(
      //         icon: const Icon(PhosphorIcons
      //             .magnifying_glass), //const Icon(PhosphorIcons.house),
      //         activeIcon: const Icon(PhosphorIcons.magnifying_glass_fill),
      //         label: 'Search'.tr),
      //     BottomNavigationBarItem(
      //         icon: const Icon(
      //           PhosphorIcons.bell,
      //         ), //const Icon(PhosphorIcons.house),
      //         activeIcon: const Icon(
      //           PhosphorIcons.bell_fill,
      //         ),
      //         label: 'Notifications'.tr),
      //     BottomNavigationBarItem(
      //         icon: const Icon(
      //           PhosphorIcons.user_circle,
      //         ),
      //         activeIcon: const Icon(
      //           PhosphorIcons.user_circle_fill,
      //         ),
      //         label: 'Profile'.tr),
      //   ],
      // ),

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
