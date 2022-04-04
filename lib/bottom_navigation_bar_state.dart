import 'package:cs4800_cipher_app/Screens/listing_screen.dart';
import 'package:flutter/material.dart';
import 'package:cs4800_cipher_app/Screens/marketplace_screen.dart';
import 'package:cs4800_cipher_app/Screens/cart_screen.dart';
import 'package:cs4800_cipher_app/Screens/profile_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';


class BottomNavBarState extends StatefulWidget {
  @override
  _BottomNavBarStateState createState() => _BottomNavBarStateState();
}

class _BottomNavBarStateState extends State<BottomNavBarState> {

  PersistentTabController _controller = PersistentTabController(initialIndex: 0);

//Screens for each nav items.
  List<Widget> _navScreens() {
    return [
      MarketplaceScreen(),
      ProfileScreen(),
      CartScreen(),
    ];
  }


  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: ImageIcon(AssetImage('assets/images/marketplace.png'),size: 40),
        title: (""),
        inactiveColorPrimary: Color(0xFF000000),
        activeColorPrimary: Color(0xFF6C6C6C),
      ),
      PersistentBottomNavBarItem(
        icon: ImageIcon(AssetImage('assets/images/profile.png'),size: 55),
        title: (""),
        inactiveColorPrimary: Color(0xFF000000),
        activeColorPrimary: Color(0xFF6C6C6C),
      ),
      PersistentBottomNavBarItem(
        icon: ImageIcon(AssetImage('assets/images/empty_cart.png'),size: 40),
        title: (""),
        inactiveColorPrimary: Color(0xFF000000),
        activeColorPrimary: Color(0xFF6C6C6C),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
        context,
        controller: _controller,
        screens: _navScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Color(0xFFDBDBDB),
        handleAndroidBackButtonPress: true,
        //resizeToAvoidBottomInset: true,
        hideNavigationBarWhenKeyboardShows: true,
        popAllScreensOnTapOfSelectedTab: true,
        navBarStyle: NavBarStyle.style12,
      );
  }
}
