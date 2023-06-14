// ignore_for_file: unused_import

import 'package:donor_darah/custom_textStyle.dart';
import 'package:donor_darah/presentation/pages/Agenda/detail_agenda.dart';
import 'package:donor_darah/presentation/pages/Notifikasi/notifikasi_detail.dart';

import 'package:donor_darah/presentation/pages/Profil/screen_akun.dart';
import 'package:velocity_x/velocity_x.dart';

import 'Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: camel_case_types
class dasboard extends StatefulWidget {
  const dasboard({super.key});

  @override
  State<dasboard> createState() => _dasboardState();
}

// ignore: camel_case_types
class _dasboardState extends State<dasboard> {
  //Untuk List Screen
  int selectedIndex = 0;
  var key = PageController();
  PageController pageController = PageController(initialPage: 0);

  List<Widget> pages = [
    const Home(),
    const DetailAgenda(),
    const Notifikasidetail(),
    const ScreenAkun()
  ];
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white249Color,
      bottomNavigationBar: BottomNavigationBar(

          // ignore: prefer_const_constructors
          selectedLabelStyle: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
          selectedItemColor: redColor,
          unselectedItemColor: greyColor,
          showUnselectedLabels: false,
          currentIndex: selectedIndex,
          onTap: (value) {
            pageController.jumpToPage(value);

            setState(() {
              selectedIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              activeIcon: Image.asset("assets/images/DD48.png"),
              icon: Image.asset("assets/images/DD49.png"),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset("assets/images/Icon2.png"),
              icon: Image.asset("assets/images/Icon.png"),
              label: 'Agenda',
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset("assets/images/DD50.png"),
              icon: Image.asset("assets/images/DD51.png"),
              label: 'Notifikasi',
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset("assets/images/DD52.png"),
              icon: Image.asset("assets/images/DD53.png"),
              label: 'Profil',
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
