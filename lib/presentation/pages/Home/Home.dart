// ignore_for_file: camel_case_types, avoid_unnecessary_containers, non_constant_identifier_names, prefer_typing_uninitialized_variablesimport 'package:donor_darah/Home/slide1.dart';
import 'package:donor_darah/custom_textStyle.dart';
import 'package:donor_darah/presentation/pages/Home/slide1.dart';
import 'package:donor_darah/presentation/pages/Home/slide2.dart';
import 'package:donor_darah/presentation/pages/Home/slide3.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      const Slide1(),
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
