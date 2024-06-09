import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:prestige_automobile/constants/colors.dart';
import 'package:prestige_automobile/pages/add_form_page.dart';
import 'package:prestige_automobile/pages/home_page.dart';
import 'package:prestige_automobile/pages/profile_page.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({super.key});

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  List<Widget> buildScreens() {
    return [const HomePage(), const AddFormPage(), ProfilePage()];
  }

  List<PersistentBottomNavBarItem> navBarItems() {
    return [
      PersistentBottomNavBarItem(
          activeColorPrimary: kThirdColor,
          icon: const Icon(
            Icons.home_sharp,
            color: kThirdColor,
          ),
          inactiveIcon: const Icon(
            Icons.home_outlined,
            color: kThirdColor,
          )),
      PersistentBottomNavBarItem(
          activeColorPrimary: kThirdColor,
          icon: const Icon(
            Icons.add_box_sharp,
            color: kThirdColor,
          ),
          inactiveIcon: const Icon(
            Icons.add_box_outlined,
            color: kThirdColor,
          )),
      PersistentBottomNavBarItem(
          activeColorPrimary: kThirdColor,
          icon: const Icon(
            Icons.person,
            color: kThirdColor,
          ),
          inactiveIcon: const Icon(
            Icons.perm_identity,
            color: kThirdColor,
          )),
    ];
  }

  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      navBarHeight: 70,

      context,
      controller: controller,
      screens: buildScreens(),
      items: navBarItems(),
      confineInSafeArea: true,
      backgroundColor: kPrimaryColor,
      handleAndroidBackButtonPress: true,

      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInCirc,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.linearToEaseOut,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.simple,
      //padding: NavBarPadding.symmetric(horizontal: kSP25x),
      //hideNavigationBar: true,
      margin: EdgeInsets.all(0),
    );
  }
}
