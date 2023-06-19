// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_string_interpolations, sized_box_for_whitespace

import 'package:donor_darah/custom_textStyle.dart';
import 'package:donor_darah/presentation/navigation/routes.dart';
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            'Selamat Datang',
            style: CustomStyle02(),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          child: const Text(
            'Annisa Tyas Wijaya',
            style: TextStyle(
              fontSize: 16,
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: "Plus Jakarta Sans",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                context.goNamed(Routes.uddPage);
              },
              child: DetailContainer(
                image: "assets/images/jam.png",
                text: "Jadwal Donor",
                onTap: null,
              ),
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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: 32),
      height: height * 0.17,
      width: width * 0.27,
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
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            height: height * 0.1,
            decoration: BoxDecoration(
              color: white214Color,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  decoration: const BoxDecoration(
                    color: yellowColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                    ),
                  ),
                ),
                Center(
                  child: Image(
                    image: AssetImage(image),
                    height: height * 0.07,
                    width: width * 0.9,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          InkWell(
            onTap: onTap,
            child: Text(
              text,
              style: CustomStyle263(),
            ),
          ),
        ],
      ),
    );
  }
}
