import 'package:byride_app/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class NavigationShellProvider extends StatelessWidget {
  const NavigationShellProvider({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;
  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        useLegacyColorScheme: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: navigationShell.currentIndex,
        items: const [
          BottomNavigationBarItem(
              tooltip: 'Home',
              icon: PhosphorIcon(PhosphorIconsRegular.houseSimple),
              label: 'Home',
              activeIcon: PhosphorIcon(
                PhosphorIconsDuotone.houseSimple,
              )),
          BottomNavigationBarItem(
            tooltip: 'Search',
            icon: PhosphorIcon(PhosphorIconsRegular.car),
            label: 'My Vehicle',
            activeIcon: PhosphorIcon(
              PhosphorIconsDuotone.car,
            ),
          ),
          BottomNavigationBarItem(
              icon: PhosphorIcon(PhosphorIconsRegular.userCircle),
              tooltip: 'Profile',
              label: 'Profile',
              activeIcon: PhosphorIcon(
                PhosphorIconsDuotone.userCircle,
              ))
        ],
        onTap: _goBranch,
        unselectedIconTheme: IconThemeData(
          color: textGrey.withOpacity(0.5),
          size: 30,
        ),
        selectedLabelStyle: GoogleFonts.poppins(
            color: primaryColor, fontSize: 12, fontWeight: FontWeight.w600),
        unselectedLabelStyle: GoogleFonts.poppins(
            color: textGrey, fontSize: 12, fontWeight: FontWeight.w400),
        selectedIconTheme: const IconThemeData(color: primaryColor, size: 30),
      ),
    );
  }
}
