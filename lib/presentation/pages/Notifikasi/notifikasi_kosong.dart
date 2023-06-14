// ignore_for_file: file_names, avoid_unnecessary_containers, sort_child_properties_last, unused_local_variable, prefer_typing_uninitialized_variables, non_constant_identifier_names, unnecessary_string_interpolations, sized_box_for_whitespace, unnecessary_string_escapes

import 'package:donor_darah/custom_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotifikasiKosong extends StatefulWidget {
  const NotifikasiKosong({Key? key}) : super(key: key);

  @override
  State<NotifikasiKosong> createState() => _NotifikasiKosongState();
}

class _NotifikasiKosongState extends State<NotifikasiKosong> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white249Color,
      body: Column(
        children: [
          Container(
            height: 100,
            color: redColor,
            child: Padding(
                padding: const EdgeInsets.only(left: 27),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 20),
                      child: const Text(
                        "Notifikasi",
                        style: TextStyle(
                            letterSpacing: 1,
                            wordSpacing: 2,
                            fontSize: 16,
                            fontFamily: "Plus Jakarta Sans",
                            color: white255Color,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 176, top: 25),
                        child: const Image(
                          image: AssetImage(
                            "assets/images/DD16.png",
                          ),
                          height: 50,
                          width: 51,
                        ))
                  ],
                )),
          ),
          const SizedBox(
            height: 148,
          ),
          Column(
            children: [
              const Image(
                image: AssetImage(
                  "assets/images/DD41.png",
                ),
                height: 80,
                width: 85,
              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () => context.go('/'),
                child: const Text(
                  "Belum ada notifikasi",
                  style: TextStyle(
                      fontFamily: "Plus Jakarta Sans",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: white204Color),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
