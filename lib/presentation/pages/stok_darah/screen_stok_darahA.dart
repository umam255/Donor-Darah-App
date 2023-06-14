// ignore_for_file: unused_local_variable

import 'package:donor_darah/custom_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenStokDarahA extends StatefulWidget {
  const ScreenStokDarahA({Key? key}) : super(key: key);

  @override
  State<ScreenStokDarahA> createState() => _ScreenStokDarahAState();
}

String? groupValue;

class _ScreenStokDarahAState extends State<ScreenStokDarahA> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: AppBar(
            shadowColor: const Color.fromRGBO(0, 0, 0, 0.25),
            backgroundColor: white249Color,
            flexibleSpace: Positioned(
              child: Padding(
                padding: const EdgeInsets.only(top: 17.67, left: 14),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () => context.go('/'),
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 20,
                          color: black01Color,
                        )),
                    Text(
                      "Stok Darah",
                      style: CustomStyle04(),
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    const Text("A+",
                        style: TextStyle(
                            color: black01Color,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            fontFamily: "plus jakarta sans"))
                  ],
                ),
              ),
            ),
          )),
      backgroundColor: white249Color,
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              ListDarah("PRC : Sel Darah Merah", "150"),
              ListDarah("Leucodepeted", "150"),
              ListDarah("FFP (Fresh Frozen Plasma)", "50"),
              ListDarah("TC (Trombocyte Concent...)", "10"),
              ListDarah("PRC Pediatrik", "100"),
              ListDarah("WB : Whole Blood", "110"),
              ListDarah("Cryoprecipitate-AHF", "150"),
              listDarah2("FP : Fresh Plasma", "0"),
              listDarah2("Lekosit Aferesis", "0"),
              listDarah2("Leucoreduced", "0"),
              listDarah2("LP AFERESIS", "0"),
              listDarah2("PRC AFERESIS", "0"),
              listDarah2("PRP (Platelet Rich Plasma)", "0"),
              listDarah2("TC Apheresis", "0"),
              listDarah2("WE : Washed Erythrocyte", "0"),
              listDarah2("Leucodepleted Pediatrik", "0"),
              listDarah2("Plasma Konvalesen (PK)", "0"),
              listDarah2("FFP Apheresis", "0"),
            ],
          )
        ],
      ),
    );
  }

  Container listDarah2(String text, String text2) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      width: 312,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: CustomStyle266(),
              ),
              Text(
                text2,
                style: const TextStyle(
                    color: greyColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    fontFamily: "plus jakarta sans"),
              )
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          const Divider(
            thickness: 1,
            color: white230Color,
          ),
        ],
      ),
    );
  }

  Container ListDarah(String text, String text2) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      width: 312,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: CustomStyle266(),
              ),
              Text(
                text2,
                style: const TextStyle(
                    color: redColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    fontFamily: "plus jakarta sans"),
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          const Divider(
            thickness: 1,
            color: white230Color,
          ),
        ],
      ),
    );
  }
}
