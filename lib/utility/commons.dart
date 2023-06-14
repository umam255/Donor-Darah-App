// ignore_for_file: unused_field, non_constant_identifier_names

import 'dart:ffi';

import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../custom_textStyle.dart';

class Commons {
  final prefs = SharedPreferences.getInstance();

  void setUid(String token) async {
    final storage = await prefs;
    await storage.setString("token", token);
  }

  Future<String?> getUid() async {
    final storage = await prefs;
    return storage.getString("token");
  }

  Future<bool> removeUid() async {
    final storage = await prefs;
    return storage.remove("token");
  }

  void showSnackBarInfo2(BuildContext context, String controller) {
    showFlash(
        context: context,
        duration: const Duration(seconds: 5),
        builder: ((context, controller) {
          return Flash(
              controller: controller,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              backgroundColor: Colors.amber,
              margin: const EdgeInsets.only(bottom: 50),
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text("Email Not Found"),
              ));
        }));
  }

  PickedFile? _imageFile;
  final ImagePicker _picker = ImagePicker();
  void ChoiceImage(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }

  void showSelectPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.17,
          maxChildSize: 0.4,
          minChildSize: 0.17,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
                controller: scrollController,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pilih Foto',
                        style: CustomStyle03(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.camera_alt_outlined),
                          const SizedBox(
                            width: 12,
                          ),
                          InkWell(
                            onTap: () {
                              ChoiceImage(ImageSource.camera);
                            },
                            child: Text(
                              "Ambil Foto",
                              style: CustomStyle02(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/DD43.png",
                            height: 23,
                            width: 23,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          InkWell(
                            onTap: () {
                              ChoiceImage(ImageSource.gallery);
                            },
                            child: Text(
                              "Unggah dari galeri",
                              style: CustomStyle02(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ));
          }),
    );
  }

  void saveImage(String val) async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString('path', val);
    loadImage();
  }

  void loadImage() async {
    final sharedPref = await SharedPreferences.getInstance();
    setState(() {
      _imageFile = sharedPref.getString('path') as PickedFile?;
    });
  }

  void deleteImage() async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.remove('path');
    loadImage();
  }
}

void setState(Null Function() param0) {}
