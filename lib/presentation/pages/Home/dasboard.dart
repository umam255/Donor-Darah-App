// ignore_for_file: unused_import

import 'package:donor_darah/custom_textStyle.dart';
import 'package:donor_darah/presentation/pages/Agenda/detail_agenda.dart';
import 'package:donor_darah/presentation/pages/Notifikasi/notifikasi_detail.dart';
import 'package:donor_darah/presentation/pages/Profil/profile_screen.dart';

import 'package:donor_darah/presentation/pages/Profil/screen_akun.dart';
import 'package:velocity_x/velocity_x.dart';

import 'Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: camel_case_types
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

// ignore: camel_case_types
class _DashboardScreenState extends State<DashboardScreen> {
  //Untuk List Screen
  int selectedIndex = 0;
  var key = PageController();
  PageController pageController = PageController(initialPage: 0);

  List<Widget> pages = [
    const Home(),
    const DetailAgenda(),
    const Notifikasidetail(),
    const ProfileScreen()
  ];
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
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
        items: [
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              "assets/images/DD48.png",
            ),
            icon: Image.asset(
              "assets/images/DD49.png",
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              "assets/images/Icon2.png",
            ),
            icon: Image.asset("assets/images/Icon.png"),
            label: 'Agenda',
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              "assets/images/DD50.png",
            ),
            icon: Image.asset(
              "assets/images/DD51.png",
            ),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              "assets/images/DD52.png",
            ),
            icon: Image.asset("assets/images/DD53.png"),
            label: 'Profile',
          ),
        ],
      ),
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
