// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_string_interpolations

import 'package:donor_darah/custom_textStyle.dart';
import 'package:flutter/material.dart';

class Slide3 extends StatefulWidget {
  const Slide3({super.key});

  @override
  State<Slide3> createState() => _Slide3State();
}

class _Slide3State extends State<Slide3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 27),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Info Terkini',
            style: CustomStyle04(),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 12)),
          SizedBox(
            height: 167,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                DetailSlide(
                  image: "assets/images/DD 3.png",
                  text: "Jusuf Kalla Lantik Pengurus PMI Kalbar 2022-2027",
                ),
                DetailSlide(
                  image: "assets/images/DD 2.png",
                  text:
                      "Sambut Hari Bhakti Imigrasi ke-73, Kanim Sanggau Gelar Donor Darah Sukarela",
                ),
                DetailSlide(
                  image: "assets/images/DD 4.png",
                  text:
                      "Peringati HUT Polwan Ke 74, Polwan Polres Ketapang Gelar Bakti Sosial Donor Darah",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DetailSlide extends StatelessWidget {
  final String image;
  final String text;

  const DetailSlide({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Image(
              image: AssetImage(
                image,
              ),
              height: 93,
              width: 140,
              fit: BoxFit.fill),
          const Padding(padding: EdgeInsets.only(top: 12)),
          Text(
            text,
            maxLines: 3,
            style: CustomStyle262(),
          ),
        ],
      ),
    );
  }
}
