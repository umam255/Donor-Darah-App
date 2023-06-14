// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, prefer_typing_uninitialized_variables, avoid_print, must_be_immutable, unused_local_variable, unused_field

import 'dart:io';

import 'package:donor_darah/custom_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ScreenBuktiDonor extends StatefulWidget {
  const ScreenBuktiDonor({super.key});

  @override
  State<ScreenBuktiDonor> createState() => _ScreenBuktiDonorState();
}

class _ScreenBuktiDonorState extends State<ScreenBuktiDonor> {
  PickedFile? _imageFile;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: AppBar(
            shadowColor: const Color.fromRGBO(0, 0, 0, 0.25),
            backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
            flexibleSpace: Positioned(
              child: Padding(
                padding: const EdgeInsets.only(top: 17.67, left: 10),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () => context.go('/'),
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 20,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        )),
                    Text(
                      "Upload Bukti Donor",
                      style: CustomStyle02(),
                    ),
                  ],
                ),
              ),
            ),
          )),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            Positioned(
              top: 490,
              child: Row(
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(156, 45),
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Color.fromRGBO(217, 30, 42, 1)),
                              borderRadius: BorderRadius.circular(6)),
                          backgroundColor:
                              const Color.fromRGBO(249, 249, 249, 1)),
                      child: Text(
                        "Ambil Ulang",
                        style: CustomStyle2177(),
                      )),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(156, 45),
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Color.fromRGBO(217, 30, 42, 1)),
                              borderRadius: BorderRadius.circular(6)),
                          backgroundColor:
                              const Color.fromRGBO(217, 30, 42, 1)),
                      child: Text(
                        "Upload",
                        style: CustomStyle2493(),
                      )),
                ],
              ),
            ),
            Column(
              children: [
                if (_imageFile == null)
                  Image.asset(
                    "assets/images/DD40.png",
                    height: 450,
                    width: 328,
                  )
                else
                  Image.file(File(_imageFile! as String)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
