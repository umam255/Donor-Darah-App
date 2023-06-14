// ignore_for_file: unused_import

import 'package:donor_darah/custom_textStyle.dart';

import 'Home.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class ScreenLog extends StatefulWidget {
  const ScreenLog({super.key});

  @override
  State<ScreenLog> createState() => _ScreenLogState();
}

// ignore: camel_case_types
class _ScreenLogState extends State<ScreenLog> {
  //Untuk List Screen
  int selectedIndex = 0;
  PageController pageController = PageController(initialPage: 0);
  List<Widget> pages = [
    const ScreenLog(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white249Color,
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: redColor,
          unselectedItemColor: greyColor,
          showUnselectedLabels: true,
          currentIndex: selectedIndex,
          onTap: (value) {
            pageController.jumpToPage(value);
            setState(() {
              selectedIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined),
              label: 'Agenda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifikasi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Akun',
            ),
          ]),
      body: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return pages[index];
        },
      ),
    );
  }
}
