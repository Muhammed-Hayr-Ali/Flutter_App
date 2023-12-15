import 'package:application/required_files.dart';
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

  int currentIndex = 0;

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
        icon: SvgPicture.asset(AppAssets.home),
        activeIcon: SvgPicture.asset(AppAssets.homeActive),
        label: 'Home'),
    BottomNavigationBarItem(
        icon: SvgPicture.asset(AppAssets.shop),
        activeIcon: SvgPicture.asset(AppAssets.shopActive),
        label: 'Brands'),
    BottomNavigationBarItem(
        icon: SvgPicture.asset(AppAssets.cart),
        activeIcon: SvgPicture.asset(AppAssets.cartActive),
        label: 'Cart'),
    BottomNavigationBarItem(
        icon: SvgPicture.asset(AppAssets.userCircle),
        activeIcon: SvgPicture.asset(AppAssets.userCircleActive),
        label: 'Profile'),
  ];

  void _onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: view[currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
        child: Material(
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (value) => _onTap(value),
            items: items,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }
}
//  FlashyTabBar(
//         backgroundColor: Colors.transparent,
//         animationDuration: const Duration(milliseconds: 100),
//         shadows: const [],
//         selectedIndex: currentScreen,
//         showElevation: true,
//         onItemSelected: (value) => onItemTapped(value),
//         items: [
//           FlashyTabBarItem(
//             icon: const Icon(PhosphorIcons.house),
//             title: Text('Home'.tr),
//           ),
//           FlashyTabBarItem(
//             icon: const Icon(Icons.search),
//             title: const Text('Search'),
//           ),
//           FlashyTabBarItem(
//             icon: const Icon(PhosphorIcons.bell),
//             title: Text('Notifications'.tr),
//           ),
//           FlashyTabBarItem(
//             icon: const Icon(PhosphorIcons.user_circle),
//             title: Text('Profile'.tr),
//           ),
//         ],
//       ),
