import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_clone/utils/customColors.dart';
import 'package:social_media_clone/widgets/custom_app_bar.dart';

class TabBarController extends StatefulWidget {
  const TabBarController({super.key});

  @override
  State<TabBarController> createState() => _TabBarControllerState();
}

class _TabBarControllerState extends State<TabBarController> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Instagram Klon"),
      bottomNavigationBar: customBottomNavigationBar(),
    );
  }

  BottomNavigationBar customBottomNavigationBar() {
    return BottomNavigationBar(
      onTap: (value) {
        setState(() {
          _currentIndex = value;
        });
      },
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: CustomColors.loginButtonTextColor,
      items: [
        _customBottomNavigationBarItem(CupertinoIcons.house, "Anasayfa"),
        _customBottomNavigationBarItem(CupertinoIcons.search, "Ara"),
        _customBottomNavigationBarItem(CupertinoIcons.photo_camera, "Reels"),
        _customBottomNavigationBarItem(CupertinoIcons.shopping_cart, "Alışveriş"),
        _customBottomNavigationBarItem(CupertinoIcons.person, "Profil"),
      ],
    );
  }

  BottomNavigationBarItem _customBottomNavigationBarItem(IconData iconData, String label) => BottomNavigationBarItem(
    icon:Icon(iconData), label: label);
}