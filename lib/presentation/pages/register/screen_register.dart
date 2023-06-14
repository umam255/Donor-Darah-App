// ignore_for_file: unused_local_variable, sized_box_for_whitespace, avoid_unnecessary_containers, non_constant_identifier_names, body_might_complete_normally_nullable, avoid_print

import 'package:donor_darah/custom_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../data/repository/job/job_repository_impl.dart';
import '../../../data/repository/register/register_repository_impl.dart';
import '../../../data/repository/unit/unit_repository_impl.dart';
import '../../../domain/model/request/register/register_request.dart';
import '../../../utility/commons.dart';
import '../../navigation/routes.dart';
import '../BLOC/job/cubit/job_cubit.dart';
import '../BLOC/register/register_bloc.dart';
import '../BLOC/register/register_state.dart';
import '../BLOC/unit/cubit/unit_cubit.dart';

class ScreenRegister extends StatefulWidget {
  const ScreenRegister({super.key});

  @override
  State<ScreenRegister> createState() => _ScreenRegisterState();
}

class _ScreenRegisterState extends State<ScreenRegister> {
  bool isAgree = false;
  TextEditingController namaController = TextEditingController();
  TextEditingController tempatController = TextEditingController();
  TextEditingController tanggalController = TextEditingController();
  TextEditingController pekerjaanController = TextEditingController();
  TextEditingController uddController = TextEditingController();
  TextEditingController nohpController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController pasConfirmController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController subController = TextEditingController();
  TextEditingController villageController = TextEditingController();
  TextEditingController posController = TextEditingController();

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
  late RegisterCubit _registerBloc;
  late JobCubit _jobCubit;
  late UnitCubit _unitCubit;
  @override
  void initState() {
    super.initState();
    _registerBloc = RegisterCubit(RegisterRemoteRepositoryImpl());
    _jobCubit = JobCubit(JobRepositoryImpl());
    _unitCubit = UnitCubit(UnitRepositoryImpl());
  }

  @override
  void dispose() {
    _unitCubit.close();
    _jobCubit.close();
    _registerBloc.close();
    super.dispose();
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
                        onPressed: () => context.go('/'),
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 20,
                          color: black01Color,
                        )),
                    Text(
                      "Data Diri",
                      style: CustomStyle02(),
                    ),
                    const SizedBox(
                      width: 189,
                    ),
                    Text(
                      "1 dari 3",
                      style: CustomStyle1532(),
                    ),
                  ],
                ),
              ),
            ),
          )),
      body: SingleChildScrollView(
        child: BlocListener<RegisterCubit, RegisterState>(
          listener: (context, registerState) {
            if (registerState is RegisterIsFailed) {
              //show snackbar
              Commons().showSnackBarInfo2(context, registerState.message!);
            } else if (registerState is RegisterIsSucces) {
              print("Registrasi Berhasil");
              context.go('/step2');
            }
          },
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 14, left: 24),
                    child: DetailText("Informasi Pribadi"),
                  ),
                  Container(
                    height: 50,
                    margin: const EdgeInsets.only(left: 24, right: 24),
                    child: TextFormField(
                      // The validator receives the text that the user has entered.

                      cursorColor: black26Color,
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
                    height: 50,
                    margin: const EdgeInsets.only(left: 24, right: 24),
                    child: TextFormField(
                      // The validator receives the text that the user has entered.

                      cursorColor: black26Color,
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
                    height: 50,
                    margin: const EdgeInsets.only(left: 24, right: 24),
                    child: TextFormField(
                      cursorColor: black26Color,
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
                          activeColor: redColor,
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
                          activeColor: redColor,
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
                    color: white230Color,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, top: 18),
                    child: DetailText("Informasi Pekerjaan"),
                  ),
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
                          Text(pilihPekerjaan),
                          InkWell(
                            onTap: () {
                              isPush = !isPush;
                              setState(() {});
                            },
                            child: Icon(isPush
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, top: 25),
                    child: DetailText("Informasi PMI"),
                  ),
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
                          Text(pilihUDD),
                          InkWell(
                            onTap: () {
                              isOpen = !isOpen;
                              setState(() {});
                            },
                            child: Icon(isOpen
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, top: 25),
                    child: DetailText("Informasi Kontak"),
                  ),
                  Container(
                    height: 50,
                    margin: const EdgeInsets.only(left: 24, right: 24),
                    child: TextFormField(
                      // The validator receives the text that the user has entered.

                      cursorColor: black26Color,
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
                    height: 50,
                    margin: const EdgeInsets.only(left: 24, right: 24),
                    child: TextFormField(
                      // The validator receives the text that the user has entered.

                      cursorColor: black26Color,
                      controller: emailController,
                      decoration: DetailDecoration("Email"),
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 24, top: 44),
                      child: ElevatedButton(
                          onPressed: () {
                            RegisterRequest page1 = RegisterRequest(
                                emailController.text,
                                1,
                                namaController.text,
                                1,
                                1,
                                groupValue,
                                alamatController.text,
                                passController.text,
                                nohpController.text,
                                1,
                                tempatController.text,
                                tanggalController.text,
                                posController.text,
                                pasConfirmController.text);
                            context.goNamed(Routes.screenRegA, extra: page1);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: redColor,
                            minimumSize: const Size(312, 45),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                          ),
                          child: BlocBuilder<RegisterCubit, RegisterState>(
                              builder: (context, registerState) {
                            if (registerState is RegisterIsLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return Text(
                              "Lanjut",
                              style: CustomStyle2493(),
                            );
                          })))
                ],
              ),
              if (isPush)
                ListView(
                  padding: const EdgeInsets.only(top: 380, left: 24, right: 24),
                  primary: true,
                  shrinkWrap: true,
                  children: Pekerjaan.map((e) => Container(
                        decoration: const BoxDecoration(
                          color: white249Color,
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
                                    color: black45Color),
                              )),
                        ),
                      )).toList(),
                ),
              if (isOpen)
                ListView(
                  padding: const EdgeInsets.only(top: 466, left: 24, right: 24),
                  primary: true,
                  shrinkWrap: true,
                  children: UDD
                      .map((e) => Container(
                            decoration: const BoxDecoration(
                              color: white249Color,
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
                                        color: black45Color),
                                  )),
                            ),
                          ))
                      .toList(),
                )
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration DetailDecoration(String text) {
    return InputDecoration(
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: redColor),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: white230Color),
        ),
        labelText: text,
        labelStyle: CustomStyle1532());
  }

  Text DetailText(String text) {
    return Text(text, style: CustomStyle266());
  }
}
