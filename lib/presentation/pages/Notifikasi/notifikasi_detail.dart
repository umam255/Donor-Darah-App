// ignore_for_file: file_names, avoid_unnecessary_containers, sort_child_properties_last, unused_local_variable, prefer_typing_uninitialized_variables, non_constant_identifier_names, unnecessary_string_interpolations, sized_box_for_whitespace, unnecessary_string_escapes

import 'package:donor_darah/custom_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../data/repository/notifikasi/notifikasi_repository_impl.dart';
import '../../../utility/commons.dart';
import '../BLOC/notifikasi/cubit/notifikasi_cubit_dart_cubit.dart';
import '../BLOC/notifikasi/cubit/notifikasi_cubit_dart_state.dart';

class Notifikasidetail extends StatefulWidget {
  const Notifikasidetail({Key? key}) : super(key: key);

  @override
  State<Notifikasidetail> createState() => _NotifikasidetailState();
}

bool isOpen = false;

class _NotifikasidetailState extends State<Notifikasidetail> {
  late NotifikasiCubit notifikasiCubit;

  @override
  void initState() {
    super.initState();
    notifikasiCubit = NotifikasiCubit(NotifikasiRemoteRepositoryImpl());
  }

  @override
  void dispose() {
    notifikasiCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white249Color,
        body: BlocConsumer<NotifikasiCubit, NotifikasiState>(
            listener: (context, notifikasiState) {
          if (notifikasiState is NotifikasiIsFailed) {
            //show snackbar
            Commons().showSnackBarInfo2(context, notifikasiState.message!);
          } else if (notifikasiState is NotifikasiIsSucces) {}
        }, builder: (context, notifikasiState) {
          if (notifikasiState is NotifikasiIsLoading) {
          } else if (notifikasiState is NotifikasiIsSucces) {}
          {
            return Column(
              children: [
                Container(
                  height: 100,
                  color: redColor,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 27),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top: 30),
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
                                  padding:
                                      const EdgeInsets.only(left: 176, top: 35),
                                  child: const Image(
                                    image: AssetImage(
                                      "assets/images/DD16.png",
                                    ),
                                    height: 50,
                                    width: 51,
                                  ))
                            ],
                          )
                        ],
                      )),
                ),
                const SizedBox(
                  height: 18,
                ),
                Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    width: 332,
                    height: 76,
                    decoration: BoxDecoration(
                        color: (isOpen ? white249Color : pinkColor),
                        boxShadow: [
                          BoxShadow(
                            color: (isOpen ? white249Color : pinkColor),
                            blurRadius: 3,
                            spreadRadius: 1,
                            offset: const Offset(0, 0),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(4)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.go('/jadwaldonordarah');
                            },
                            child: Text(
                              "Jadwal Donor Darah",
                              style: CustomStyle2173(),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RichText(
                              text: const TextSpan(children: <TextSpan>[
                            TextSpan(
                              text:
                                  "Anda memiliki jadwal donor darah selanjutnya pada ",
                              style: TextStyle(
                                  wordSpacing: 2,
                                  fontSize: 10,
                                  fontFamily: "Plus Jakarta Sans",
                                  color: greyColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text: "23 Januari 2023. ",
                              style: TextStyle(
                                  wordSpacing: 2,
                                  fontSize: 10,
                                  fontFamily: "Plus Jakarta Sans",
                                  color: redColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text:
                                  "Mohon untuk segera mengajukan donor darah dan ber...",
                              style: TextStyle(
                                  wordSpacing: 2,
                                  fontSize: 10,
                                  fontFamily: "Plus Jakarta Sans",
                                  color: greyColor,
                                  fontWeight: FontWeight.w500),
                            )
                          ]))
                        ])),
              ],
            );
          }
        }));
  }
}
