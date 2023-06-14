// ignore_for_file: file_names, avoid_unnecessary_containers, sort_child_properties_last, unused_local_variable, prefer_typing_uninitialized_variables, non_constant_identifier_names, unnecessary_string_interpolations, camel_case_types

import 'package:donor_darah/custom_textStyle.dart';
import 'package:flutter/material.dart';

class Slide2 extends StatefulWidget {
  const Slide2({Key? key}) : super(key: key);

  @override
  State<Slide2> createState() => _Slide2State();
}

class _Slide2State extends State<Slide2> {
  int selectedIndex = 0;
  PageController pageController = PageController(initialPage: 0);
  List<Widget> pages = [];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      SizedBox(
          height: 94,
          width: 312,
          child: Card(
            color: redColor,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Container(
              margin: const EdgeInsets.fromLTRB(16, 15, 16, 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: const TextSpan(
                          text: "Sudahkah anda\nDonor Darah?",
                          style: TextStyle(
                              fontSize: 14,
                              color: white255Color,
                              fontFamily: "plus jakarta sans",
                              fontWeight: FontWeight.w600)),
                      maxLines: 2,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.only(
                              top: 11, left: 16, bottom: 11, right: 16),
                          backgroundColor: white249Color),
                      child: Text(
                        'Ajukan Donor',
                        style: CustomStyle2175(),
                      ))
                ],
              ),
            ),
          )),
    ]));
  }
}
