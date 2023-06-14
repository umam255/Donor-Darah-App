// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, unused_local_variable, no_leading_underscores_for_local_identifiers, unused_element, avoid_web_libraries_in_flutter

import 'package:donor_darah/custom_textStyle.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/repository/update_profile/update_profile_repository_impl.dart';
import '../../../utility/commons.dart';
import '../BLOC/update_profile/cubit/update_profile_cubit.dart';

class ScreenEditProfil extends StatefulWidget {
  const ScreenEditProfil({Key? key}) : super(key: key);

  @override
  State<ScreenEditProfil> createState() => _ScreenEditProfilState();
}

bool isAgree = false;
TextEditingController namaController = TextEditingController();
TextEditingController tempatController = TextEditingController();
TextEditingController tanggalController = TextEditingController();
TextEditingController pekerjaanController = TextEditingController();
TextEditingController uddController = TextEditingController();
TextEditingController nohpController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController kecController = TextEditingController();
TextEditingController kelController = TextEditingController();
TextEditingController alamatController = TextEditingController();
TextEditingController posController = TextEditingController();
TextEditingController imageController = TextEditingController();

String? groupValue;
bool isOpen = false;
String pilihUDD = 'Pilih UDD PMI  ';
List<String> UDD = [
  "UDD PMI Ketapang",
  "UDD PMI Pontianak",
];
bool isPush = false;
String pilihPekerjaan = 'Pilih Pekerjaan';
List<String> Pekerjaan = [
  "Pegawai Negeri",
  "Pegawai Swasta",
  "TNI",
  "POLRI",
  "Pengusaha",
  "Wiraswasta"
];

Future getImage() async {
  final ImagePicker _picker = ImagePicker();
  final XFile? imagePicked = await _picker.pickImage(
    source: ImageSource.camera,
  );
}

void _showSelectPhotoOptions(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.17,
        maxChildSize: 0.4,
        minChildSize: 0.17,
        expand: false,
        builder: (context, scrollController) {
          return BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
            builder: (context, updateProfiletate) {
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
                              onTap: () async {
                                await getImage();
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
                              onTap: () {},
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
            },
          );
        }),
  );
}

class _ScreenEditProfilState extends State<ScreenEditProfil> {
  late UpdateProfileCubit _updateProfileCubit;

  @override
  void initState() {
    // TODO: implement initState
    _updateProfileCubit = UpdateProfileCubit(
      UpdateProfileRemoteRepositoryImpl(),
    );
    super.initState();
  }

  @override
  void dispose() {
    _updateProfileCubit.close();
    super.dispose();
  }

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
                padding: const EdgeInsets.only(top: 17.67, left: 14),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () => context.go('/akun'),
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 20,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        )),
                    Text(
                      "Edit Profil",
                      style: CustomStyle04(),
                    ),
                    const SizedBox(
                      width: 164,
                    ),
                    InkWell(
                      onTap: () {
                        BlocProvider.of<UpdateProfileCubit>(context)
                            .submitUpdateProfile(
                          emailController.text,
                          tempatController.text,
                          namaController.text,
                          tanggalController.text,
                          groupValue,
                          1,
                          1,
                          nohpController.text,
                          alamatController.text,
                          1,
                          1,
                          posController.text,
                          imageController.text,
                        );
                        setState(() {
                          {
                            showFlash(
                                context: context,
                                duration: const Duration(seconds: 5),
                                builder: ((context, controller) {
                                  return Flash(
                                      controller: controller,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(36),
                                      ),
                                      backgroundColor: const Color.fromRGBO(
                                          230, 230, 230, 1),
                                      margin: const EdgeInsets.only(bottom: 50),
                                      child: const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(20, 10, 20, 10),
                                        child: Text(
                                          "Data Profil Berhasil Di Simpan",
                                          style: TextStyle(
                                              fontFamily: "Plus Jakarta Sans",
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromRGBO(
                                                  51, 51, 51, 1)),
                                        ),
                                      ));
                                }));
                            context.go('/');
                          }
                        });
                      },
                      child: Text(
                        "Simpan",
                        style: CustomStyle2174(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
      backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
      body: SingleChildScrollView(
        child: BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
          listener: (context, updateProfileState) {
            if (updateProfileState is UpdateProfileIsFailed) {
              Commons().showSnackBarInfo2(context, updateProfileState.message!);
            }
          },
          builder: (context, updateProfileState) {
            if (updateProfileState is UpdateProfileIsLoading) {
              return const Center(
                child: LinearProgressIndicator(),
              );
            } else if (updateProfileState is UpdateProfileIsSucces) {}
            {
              return Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 139),
                        child: Image.asset(
                          "assets/images/DD33.png",
                          height: 80,
                          width: 80,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 24),
                        child: DetailText("Informasi Pribadi"),
                      ),
                      Container(
                        height: 52,
                        margin: const EdgeInsets.only(left: 24, right: 24),
                        child: TextFormField(
                          // The validator receives the text that the user has entered.

                          cursorColor: const Color.fromRGBO(26, 26, 26, 1),
                          controller: namaController,
                          decoration: DetailDecoration("Nama Lengkap"),
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 52,
                        margin: const EdgeInsets.only(left: 24, right: 24),
                        child: TextFormField(
                          // The validator receives the text that the user has entered.

                          cursorColor: const Color.fromRGBO(26, 26, 26, 1),
                          controller: tempatController,
                          decoration: DetailDecoration("Tempat Lahir"),
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 52,
                        margin: const EdgeInsets.only(left: 24, right: 24),
                        child: TextFormField(
                          // The validator receives the text that the user has entered.

                          cursorColor: const Color.fromRGBO(26, 26, 26, 1),
                          controller: tanggalController,
                          decoration: DetailDecoration("Tanggal Lahir"),
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24, top: 24),
                        child: DetailText("Jenis Kelamin"),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile(
                              activeColor: const Color.fromRGBO(217, 30, 42, 1),
                              value: "Laki-Laki",
                              groupValue: groupValue,
                              title: Text(
                                "Laki-Laki",
                                textAlign: TextAlign.start,
                                style: CustomStyle02(),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  groupValue = value;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: RadioListTile(
                              activeColor: const Color.fromRGBO(217, 30, 42, 1),
                              value: "Perempuan",
                              groupValue: groupValue,
                              title: Text(
                                "Perempuan",
                                textAlign: TextAlign.start,
                                style: CustomStyle02(),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  groupValue = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 4,
                        color: Color.fromRGBO(230, 230, 230, 1),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24, top: 18),
                        child: DetailText("Informasi Pekerjaan"),
                      ),
                      InkWell(
                        onTap: () {
                          isPush = !isPush;
                          setState(() {});
                        },
                        child: SizedBox(
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
                                Text(pilihPekerjaan),
                                Icon(isPush
                                    ? Icons.arrow_drop_up
                                    : Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24, top: 25),
                        child: DetailText("Informasi PMI"),
                      ),
                      InkWell(
                        onTap: () {
                          isOpen = !isOpen;
                          setState(() {});
                        },
                        child: SizedBox(
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
                                Text(pilihUDD),
                                Icon(isOpen
                                    ? Icons.arrow_drop_up
                                    : Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24, top: 25),
                        child: DetailText("Informasi Kontak"),
                      ),
                      Container(
                        height: 52,
                        margin: const EdgeInsets.only(left: 24, right: 24),
                        child: TextFormField(
                          // The validator receives the text that the user has entered.

                          cursorColor: const Color.fromRGBO(26, 26, 26, 1),
                          controller: nohpController,
                          decoration: DetailDecoration("Telepon/No. Handphone"),
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      const SizedBox(
                        height: 9.5,
                      ),
                      Container(
                        height: 52,
                        margin: const EdgeInsets.only(left: 24, right: 24),
                        child: TextFormField(
                          // The validator receives the text that the user has entered.

                          cursorColor: const Color.fromRGBO(26, 26, 26, 1),
                          controller: emailController,
                          decoration: DetailDecoration("Email"),
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(
                        thickness: 4,
                        color: Color.fromRGBO(230, 230, 230, 1),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, left: 24),
                        child: DetailText("Informasi Alamat"),
                      ),
                      Container(
                        height: 52,
                        margin: const EdgeInsets.only(left: 24, right: 24),
                        child: TextFormField(
                          // The validator receives the text that the user has entered.

                          cursorColor: const Color.fromRGBO(26, 26, 26, 1),
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
                        height: 52,
                        margin: const EdgeInsets.only(left: 24, right: 24),
                        child: TextFormField(
                          // The validator receives the text that the user has entered.

                          cursorColor: const Color.fromRGBO(26, 26, 26, 1),
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
                        height: 52,
                        margin: const EdgeInsets.only(left: 24, right: 24),
                        child: TextFormField(
                          // The validator receives the text that the user has entered.

                          cursorColor: const Color.fromRGBO(26, 26, 26, 1),
                          controller: kelController,
                          decoration: DetailDecoration("Kelurahan"),
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      Container(
                        height: 52,
                        margin: const EdgeInsets.only(left: 24, right: 24),
                        child: TextFormField(
                          // The validator receives the text that the user has entered.

                          cursorColor: const Color.fromRGBO(26, 26, 26, 1),
                          controller: posController,
                          decoration: DetailDecoration("Kode Pos"),
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                    ],
                  ),
                  if (isPush)
                    BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                      builder: (context, updateProfiletate) {
                        return ListView(
                          padding: const EdgeInsets.only(
                              top: 380, left: 24, right: 24),
                          primary: true,
                          shrinkWrap: true,
                          children: Pekerjaan.map((e) => Container(
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(249, 249, 249, 1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 20,
                                  ),
                                  child: InkWell(
                                      onTap: (() {
                                        pilihPekerjaan = e;
                                        isPush = false;
                                        setState(() {});
                                      }),
                                      child: Text(
                                        e,
                                        style: const TextStyle(
                                            fontFamily: "Plus Jakarta Sans",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Color.fromRGBO(45, 45, 45, 1)),
                                      )),
                                ),
                              )).toList(),
                        );
                      },
                    ),
                  if (isOpen)
                    BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                      builder: (context, updateProfiletate) {
                        return ListView(
                          padding: const EdgeInsets.only(
                              top: 466, left: 24, right: 24),
                          primary: true,
                          shrinkWrap: true,
                          children: UDD
                              .map((e) => Container(
                                    decoration: const BoxDecoration(
                                      color: Color.fromRGBO(249, 249, 249, 1),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 20,
                                      ),
                                      child: InkWell(
                                          onTap: (() {
                                            pilihUDD = e;
                                            isOpen = false;
                                            setState(() {});
                                          }),
                                          child: Text(
                                            e,
                                            style: const TextStyle(
                                                fontFamily: "Plus Jakarta Sans",
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromRGBO(
                                                    45, 45, 45, 1)),
                                          )),
                                    ),
                                  ))
                              .toList(),
                        );
                      },
                    ),
                  BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                    builder: (context, updateProfiletate) {
                      return Positioned(
                          top: 52,
                          left: 170,
                          child: InkWell(
                            onTap: () {
                              _showSelectPhotoOptions(context);
                            },
                            child: Image.asset(
                              "assets/images/DD34.png",
                              height: 16,
                              width: 18,
                            ),
                          ));
                    },
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }

  InputDecoration DetailDecoration(String text) {
    return InputDecoration(
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(217, 30, 42, 1)),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(230, 230, 230, 1)),
        ),
        labelText: text,
        labelStyle: CustomStyle1532());
  }

  Text DetailText(String text) {
    return Text(text, style: CustomStyle266());
  }
}
