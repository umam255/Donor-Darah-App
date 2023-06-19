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
      padding: const EdgeInsets.only(left: 24, right: 24, top: 56),
      child: Column(
        children: const [
          //get slide
          Slide1(),
          Padding(
            padding: EdgeInsets.only(
              top: 33,
            ),
          ),
          Slide2(),
          Padding(
            padding: EdgeInsets.only(
              top: 33,
            ),
          ),
          Slide3()
        ],
      ),
    ); //
  }
}
