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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.14,
      width: width,
      decoration: BoxDecoration(
        color: redColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  text: "Sudahkah anda\nDonor Darah?",
                  style: TextStyle(
                    fontSize: width * 0.04,
                    color: white255Color,
                    fontFamily: "plus jakarta sans",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                maxLines: 2,
              ),
            ),
            SizedBox(
              height: height * 0.08,
              width: width * 0.35,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: white249Color,
                ),
                child: Text(
                  'Ajukan Donor',
                  style: CustomStyle2175(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
