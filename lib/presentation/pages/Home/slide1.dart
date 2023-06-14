// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_string_interpolations, sized_box_for_whitespace

import 'package:donor_darah/custom_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Slide1 extends StatefulWidget {
  const Slide1({super.key});

  @override
  State<Slide1> createState() => _Slide1State();
}

class _Slide1State extends State<Slide1> {
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
          padding: const EdgeInsets.fromLTRB(24, 12, 191, 0),
          child: const Text(
            'Annisa Tyas Wijaya',
            style: TextStyle(
                fontSize: 16,
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: "Plus Jakarta Sans",
                fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Row(
            children: [
              Wrap(
                spacing: 21,
                children: [
                  DetailContainer(
                    image: "assets/images/jam.png",
                    text: "Jadwal Donor",
                    onTap: () {
                      print('ini jadwal donor');
                    },
                  ),
                  DetailContainer(
                    image: "assets/images/Blood.png",
                    text: "Stok Darah",
                    onTap: () => context.go('/udd'),
                  ),
                  DetailContainer(
                    image: "assets/images/Globe.png",
                    text: "Info & Berita",
                    onTap: () => context.go('/berita'),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class DetailContainer extends StatelessWidget {
  final String text;
  final String image;

  final void Function()? onTap;
  const DetailContainer({
    Key? key,
    required this.text,
    required this.onTap,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 32),
      height: 119,
      width: 90,
      decoration: BoxDecoration(
        color: white249Color,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
              offset: Offset(1, 1),
              spreadRadius: 0,
              blurRadius: 4,
              color: Color.fromRGBO(0, 0, 0, 0.25))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 60,
            width: 70,
            decoration: BoxDecoration(
                color: white214Color, borderRadius: BorderRadius.circular(4)),
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  decoration: const BoxDecoration(
                      color: yellowColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(4),
                          bottomRight: Radius.circular(4))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 20),
                  child: Image(
                    image: AssetImage(image),
                    height: 35,
                    width: 35,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 18,
          ),
          InkWell(
              onTap: onTap,
              child: Text(
                text,
                style: CustomStyle263(),
              )),
        ],
      ),
    );
  }
}
