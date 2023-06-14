// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, prefer_typing_uninitialized_variables, avoid_print, must_be_immutable, unused_local_variable

import 'package:donor_darah/custom_textStyle.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenUbahSandi extends StatefulWidget {
  const ScreenUbahSandi({super.key});

  @override
  State<ScreenUbahSandi> createState() => _ScreenUbahSandiState();
}

class _ScreenUbahSandiState extends State<ScreenUbahSandi> {
  bool hidePassword = true;

  bool isAgree = false;

  void changePasswordVisibility() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(249, 249, 249, 1),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                      )
                    ]),
                height: 60,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(7, 17, 0, 0),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_back_outlined),
                        color: const Color.fromRGBO(0, 0, 0, 1),
                        iconSize: 20,
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.fromLTRB(0, 17, 192, 0),
                        child: Text("Ubah Kata Sandi", style: CustomStyle02()))
                  ],
                ),
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(24, 14, 201, 0),
                  child: Text("Buat Kata Sandi Baru", style: CustomStyle05())),
              const SizedBox(
                height: 9,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                child: TextField(
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    hintText: "input text",
                    hintStyle: CustomStyle1532(),
                    labelText: "Kata Sandi Baru",
                    labelStyle: CustomStyle1532(),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        changePasswordVisibility();
                      },
                      child: Icon(
                        (hidePassword)
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: 20,
                      ),
                    ),
                  ),
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.visiblePassword,
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                child: TextField(
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    hintText: "input text",
                    labelText: "Konfirmasi Kata Sandi Baru",
                    hintStyle: CustomStyle1532(),
                    labelStyle: CustomStyle1532(),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        changePasswordVisibility();
                      },
                      child: Icon(
                        (hidePassword)
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: 20,
                      ),
                    ),
                  ),
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.visiblePassword,
                ),
              ),
              const SizedBox(
                height: 385,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    showFlash(
                        context: context,
                        duration: const Duration(seconds: 5),
                        builder: ((context, controller) {
                          return Flash(
                              controller: controller,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(36),
                              ),
                              backgroundColor:
                                  const Color.fromRGBO(230, 230, 230, 1),
                              margin: const EdgeInsets.only(bottom: 50),
                              child: const Padding(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Text(
                                  "Kata Sandi berhasil disimpan",
                                  style: TextStyle(
                                      fontFamily: "Plus Jakarta Sans",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(51, 51, 51, 1)),
                                ),
                              ));
                        }));
                    setState(() {
                      context.go('/akun');
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(217, 34, 42, 1),
                    padding: const EdgeInsets.fromLTRB(126.5, 14, 126.5, 14),
                  ),
                  child: Text(
                    "Simpan",
                    style: CustomStyle2493(),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
