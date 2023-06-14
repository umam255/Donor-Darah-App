// ignore_for_file: camel_case_types, avoid_unnecessary_containers, non_constant_identifier_names, prefer_typing_uninitialized_variablesimport 'package:donor_darah/Home/slide1.dart';

import 'package:donor_darah/custom_textStyle.dart';
import 'package:donor_darah/presentation/pages/Home/slide2.dart';
import 'package:donor_darah/presentation/pages/Home/slide3.dart';
import 'package:flutter/material.dart';

import 'screen_slide1_clone.dart';

class ScreenLogout extends StatefulWidget {
  const ScreenLogout({super.key});

  @override
  State<ScreenLogout> createState() => _ScreenLogoutState();
}

class _ScreenLogoutState extends State<ScreenLogout> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Container(
        color: white249Color,
        padding: const EdgeInsets.only(left: 24, top: 24),
      ),
      //get slide
      const Slide_1Clone(),
      const Padding(
          padding: EdgeInsets.only(
        top: 33,
      )),
      const Slide2(),
      const Padding(
          padding: EdgeInsets.only(
        top: 45,
      )),
      const Slide3()
    ])); //
  }
}
