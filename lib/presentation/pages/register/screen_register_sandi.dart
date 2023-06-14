// ignore_for_file: unused_local_variable, sized_box_for_whitespace, avoid_unnecessary_containers, non_constant_identifier_names, body_might_complete_normally_nullable

import 'package:donor_darah/custom_textStyle.dart';
import 'package:donor_darah/presentation/pages/BLOC/register/register_bloc.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/model/request/register/register_request.dart';
import '../../../domain/model/request/update_profil/update_profile-request.dart';
import '../../../utility/commons.dart';
import '../BLOC/register/register_state.dart';

// ignore: must_be_immutable
class ScreenRegisterSandi extends StatelessWidget {
  UpdateProfileRequest? page2;
  ScreenRegisterSandi({super.key, this.page2});

  bool isAgree = false;
  TextEditingController passConfirmController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool hidekonfirmasi = true;
  bool hidePassword = true;

  void changePasswordVisibility() {
    setState(() {
      hidekonfirmasi = !hidekonfirmasi;
    });
  }

  void changePasswordVisibility2() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

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
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 20,
                          color: black01Color,
                        )),
                    Text(
                      "Data Alamat",
                      style: CustomStyle02(),
                    ),
                    const SizedBox(
                      width: 170,
                    ),
                    Text(
                      "2 dari 3",
                      style: CustomStyle1532(),
                    ),
                  ],
                ),
              ),
            ),
          )),
      body: SingleChildScrollView(
        child: BlocListener<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterIsSucces) {
              showFlash(
                  context: context,
                  duration: const Duration(seconds: 2),
                  builder: ((context, controller) {
                    return Flash(
                        controller: controller,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                        backgroundColor: white249Color,
                        margin: const EdgeInsets.only(bottom: 200),
                        child: Container(
                          height: 260,
                          width: 220,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Column(
                              children: const [
                                Image(
                                    image:
                                        AssetImage("assets/images/Notif.png")),
                                SizedBox(
                                  height: 29,
                                ),
                                Text(
                                  "Registrasi Akun Berhasil",
                                  style: TextStyle(
                                      fontFamily: "Plus Jakarta Sans",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(51, 51, 51, 1)),
                                ),
                              ],
                            ),
                          ),
                        ));
                  }));
              context.go('/');
            } else if (state is RegisterIsFailed) {
              Commons().showSnackBarInfo2(context, state.message!);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 14, left: 24),
                child: DetailText("Buat Kata Sandi"),
              ),
              Container(
                height: 52,
                margin: const EdgeInsets.only(left: 24, right: 24),
                child: TextFormField(
                  obscureText: hidePassword,
                  cursorColor: black26Color,
                  controller: passController,
                  decoration: InputDecoration(
                    floatingLabelStyle: const TextStyle(color: redColor),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: redColor),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: white230Color),
                    ),
                    labelText: "Kata Sandi",
                    labelStyle: CustomStyle1532(),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        changePasswordVisibility2();
                      },
                      child: Icon(
                        (hidePassword)
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: 20,
                        color: redColor,
                      ),
                    ),
                  ),
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(left: 24, right: 24),
                child: TextFormField(
                  obscureText: hidekonfirmasi,
                  cursorColor: black26Color,
                  controller: passConfirmController,
                  decoration: InputDecoration(
                    floatingLabelStyle: const TextStyle(color: redColor),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: redColor),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: white230Color),
                    ),
                    labelText: "Konfirmasi Kata Sandi",
                    labelStyle: CustomStyle1532(),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        changePasswordVisibility();
                      },
                      child: Icon(
                        (hidekonfirmasi)
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: 20,
                        color: redColor,
                      ),
                    ),
                  ),
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 410),
                child: ElevatedButton(
                    onPressed: () {
                      RegisterRequest submitRequest = RegisterRequest(
                          page2?.userName,
                          page2?.unitId,
                          page2?.dateOfBirth,
                          page2?.jobId,
                          page2?.subDistrictId,
                          page2?.placeOfBirth,
                          page2?.phone,
                          page2?.urlImage,
                          page2?.postalCode,
                          page2?.villageId,
                          page2?.adrress,
                          page2?.gender,
                          //-------------------------
                          passController.text,
                          passConfirmController.text);
                      BlocProvider.of<RegisterCubit>(context).onSubmitRegister(
                          page2?.userName,
                          page2?.phone,
                          page2?.dateOfBirth,
                          page2?.urlImage,
                          page2?.postalCode,
                          page2?.placeOfBirth,
                          page2?.unitId,
                          page2?.jobId,
                          page2?.gender,
                          page2?.email,
                          page2?.subDistrictId,
                          page2?.villageId,
                          //-------------------------
                          passController.text,
                          passConfirmController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: redColor,
                      minimumSize: const Size(312, 45),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                    ),
                    child: Text(
                      "Daftar",
                      style: CustomStyle2493(),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Text DetailText(String text) {
    return Text(text, style: CustomStyle04());
  }
}
