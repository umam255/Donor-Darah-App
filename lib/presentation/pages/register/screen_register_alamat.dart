// ignore_for_file: unused_local_variable, sized_box_for_whitespace, avoid_unnecessary_containers, non_constant_identifier_names, body_might_complete_normally_nullable, must_be_immutable

import 'package:donor_darah/custom_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../domain/model/request/register/register_request.dart';
import '../../../domain/model/request/update_profil/update_profile-request.dart';
import '../../navigation/routes.dart';

class ScreenRegisterAlamat extends StatelessWidget {
  UpdateProfileRequest? page1;
  ScreenRegisterAlamat({Key? key, this.page1}) : super(key: key);

  bool isAgree = false;

  TextEditingController kecController = TextEditingController();

  TextEditingController kelController = TextEditingController();

  TextEditingController alamatController = TextEditingController();

  TextEditingController posController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? groupValue;

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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 14, left: 24),
                child: DetailText("Informasi Alamat"),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(left: 24, right: 24),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  cursorColor: black26Color,
                  controller: alamatController,
                  decoration: DetailDecoration("Alamat KTP"),
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  cursorColor: black26Color,
                  controller: kecController,
                  decoration: DetailDecoration("Kecamatan"),
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  cursorColor: black26Color,
                  controller: kelController,
                  decoration: DetailDecoration("Kelurahan"),
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  cursorColor: black26Color,
                  controller: posController,
                  decoration: DetailDecoration("Kode POS"),
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 300),
                child: ElevatedButton(
                    onPressed: () {
                      RegisterRequest page2 = RegisterRequest(
                        //dari constructor
                        page1?.urlImage,
                        page1?.subDistrictId,
                        page1?.placeOfBirth,
                        page1?.unitId,
                        page1?.villageId,
                        page1?.dateOfBirth,
                        page1?.email,
                        page1?.phone,
                        page1?.userName,
                        page1?.jobId,
                        // controller
                        kecController.text,
                        kelController.text,
                        posController.text,
                        alamatController.text,
                      );

                      context.goNamed(Routes.screenRegS, extra: page2);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: redColor,
                      minimumSize: const Size(312, 45),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                    ),
                    child: Text(
                      "Lanjut",
                      style: CustomStyle2493(),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration DetailDecoration(String text) {
    return InputDecoration(
      floatingLabelStyle: const TextStyle(color: redColor),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: redColor),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: white230Color),
      ),
      labelText: text,
      labelStyle: CustomStyle1532(),
    );
  }

  Text DetailText(String text) {
    return Text(text, style: CustomStyle04());
  }
}
