// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, prefer_typing_uninitialized_variables, avoid_print, must_be_immutable, unused_local_variable

import 'package:donor_darah/custom_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenStokDarah extends StatefulWidget {
  const ScreenStokDarah({super.key});

  @override
  State<ScreenStokDarah> createState() => _ScreenStokDarahState();
}

class _ScreenStokDarahState extends State<ScreenStokDarah> {
  bool isOpen = false;

  String UDDPMIKetapang = 'UDD PMI Ketapang';
  List<String> UDD = [
    "UDD PMI Ketapang",
    "UDD PMI Ketapang 2",
    "UDD PMI Ketapang 3",
    "UDD PMI Ketapang 4",
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: white249Color,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: AppBar(
              shadowColor: const Color.fromRGBO(0, 0, 0, 0.25),
              backgroundColor: white249Color,
              flexibleSpace: Positioned(
                child: Padding(
                  padding: const EdgeInsets.only(top: 17.67, left: 10),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () => context.go('/udd'),
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 20,
                            color: black01Color,
                          )),
                      Text(
                        "Stok Darah",
                        style: CustomStyle04(),
                      ),
                    ],
                  ),
                ),
              ),
            )),
        body: Stack(
          children: [
            Column(children: [
              SizedBox(
                height: 45,
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Color.fromRGBO(212, 212, 212, 1))),
                  ),
                  width: 312,
                  margin: const EdgeInsets.fromLTRB(24, 14, 24, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Image(
                              image: AssetImage("assets/images/DD38.png")),
                          const SizedBox(
                            width: 14,
                          ),
                          Text(UDDPMIKetapang, style: CustomStyle267()),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isOpen = !isOpen;
                          });
                        },
                        child: Icon(isOpen
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              DetailListDarah(
                text: "A+",
                onTap: () => context.go('/stokdarahA'),
              ),
              const SizedBox(
                height: 12,
              ),
              DetailListDarah(
                text: "B+",
                onTap: () {},
              ),
              const SizedBox(
                height: 12,
              ),
              DetailListDarah(
                text: "O+",
                onTap: () {},
              ),
              const SizedBox(
                height: 12,
              ),
              DetailListDarah(
                text: "AB+",
                onTap: () {},
              ),
              const SizedBox(
                height: 12,
              ),
              DetailListDarah(
                text: "A-",
                onTap: () {},
              ),
              const SizedBox(
                height: 12,
              ),
              DetailListDarah(
                text: "B-",
                onTap: () {},
              ),
              const SizedBox(
                height: 12,
              ),
              DetailListDarah(
                text: "O-",
                onTap: () {},
              ),
              const SizedBox(
                height: 12,
              ),
              DetailListDarah(
                text: "AB-",
                onTap: () {},
              ),
            ]),
            if (isOpen)
              ListUDD(
                shrinkWrap: true,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: UDD
                        .map((e) => Padding(
                              padding: const EdgeInsets.only(bottom: 22),
                              child: InkWell(
                                  onTap: (() {
                                    UDDPMIKetapang = e;
                                    isOpen = false;
                                    setState(() {});
                                  }),
                                  child: Text(
                                    e,
                                    style: const TextStyle(
                                        fontFamily: "Plus Jakarta Sans",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(45, 45, 45, 1)),
                                  )),
                            ))
                        .toList()),
              )
          ],
        ));
  }
}

class DetailListDarah extends StatelessWidget {
  final String text;

  final void Function()? onTap;
  const DetailListDarah({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 312,
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
          offset: Offset.zero,
          blurRadius: 1,
          color: Color.fromRGBO(0, 0, 0, 0.25),
        )
      ], color: white249Color, borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: [
                  Text(
                    "Golongan Darah",
                    style: CustomStyle267(),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    text,
                    style: const TextStyle(
                        fontSize: 19,
                        fontFamily: "Plus Jakarta Sans",
                        color: black01Color,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: onTap,
                icon: const Icon(Icons.arrow_forward_ios_rounded,
                    size: 16, color: greyColor))
          ],
        ),
      ),
    );
  }
}

class ListUDD extends StatelessWidget {
  final bool shrinkWrap;
  final Widget child;

  ListUDD({Key? key, required this.shrinkWrap, required this.child})
      : super(key: key);

  String UDDPMIKetapang = 'UDD PMI Ketapang';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25, left: 16),
      margin: const EdgeInsets.only(top: 50, left: 24, right: 24),
      height: 180,
      width: 312,
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(blurRadius: 5, color: Color.fromRGBO(0, 0, 0, 0.25))
      ], color: white255Color, borderRadius: BorderRadius.circular(4)),
      child: child,
    );
  }
}
