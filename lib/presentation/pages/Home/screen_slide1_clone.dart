// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_string_interpolations, camel_case_types

import 'package:donor_darah/custom_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Slide_1Clone extends StatefulWidget {
  const Slide_1Clone({super.key});

  @override
  State<Slide_1Clone> createState() => _Slide_1CloneState();
}

class _Slide_1CloneState extends State<Slide_1Clone> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(24, 24, 244, 0),
          child: Text(
            'Selamat Datang',
            style: CustomStyle02(),
          ),
        ),
        Container(
            padding: EdgeInsets.only(left: 24, top: 36),
            child: Center(
              child: Row(
                children: [
                  Wrap(
                    spacing: 21,
                    runSpacing: 0,
                    children: [
                      SizedBox(
                        height: 119,
                        width: 90,
                        child: Card(
                          color: white249Color,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            children: [
                              const Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0)),
                              SizedBox(
                                height: 60,
                                width: 70,
                                child: Card(
                                  color: white214Color,
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Stack(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(top: 35),
                                        decoration: const BoxDecoration(
                                            color: yellowColor,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(4),
                                                bottomRight:
                                                    Radius.circular(4))),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 16),
                                        child: Image(
                                          image: AssetImage(
                                              "assets/images/jam.png"),
                                          height: 35,
                                          width: 35,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Padding(padding: EdgeInsets.only(top: 20)),
                              Container(
                                child: InkWell(
                                  onTap: () {
                                    print('ini');
                                  },
                                  child: Text(
                                    'Jadwal Donor',
                                    style: CustomStyle263(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 119,
                        width: 90,
                        child: Card(
                          color: white249Color,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            children: [
                              const Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0)),
                              SizedBox(
                                height: 60,
                                width: 70,
                                child: Card(
                                  color: white214Color,
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Stack(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(top: 35),
                                        decoration: const BoxDecoration(
                                            color: yellowColor,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(4),
                                                bottomRight:
                                                    Radius.circular(4))),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 7, left: 16),
                                        child: Image(
                                          image: AssetImage(
                                              "assets/images/Blood.png"),
                                          height: 38,
                                          width: 34,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Padding(padding: EdgeInsets.only(top: 20)),
                              Container(
                                child: InkWell(
                                  onTap: () => context.go('/udd'),
                                  child: Text(
                                    'Stok Darah',
                                    style: CustomStyle263(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 119,
                        width: 90,
                        child: Card(
                          color: white249Color,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            children: [
                              const Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0)),
                              SizedBox(
                                height: 60,
                                width: 70,
                                child: Card(
                                  color: white214Color,
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Stack(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(top: 35),
                                        decoration: const BoxDecoration(
                                            color: yellowColor,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(4),
                                                bottomRight:
                                                    Radius.circular(4))),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 11, left: 15),
                                        child: Image(
                                          image: AssetImage(
                                              "assets/images/Globe.png"),
                                          height: 32,
                                          width: 37,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 20)),
                              GestureDetector(
                                onTap: () => context.go('/detailinfoberita'),
                                child: Text(
                                  'Info & Berita',
                                  style: CustomStyle263(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
