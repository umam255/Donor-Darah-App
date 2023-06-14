// ignore_for_file: file_names, avoid_unnecessary_containers, sort_child_properties_last, unused_local_variable, prefer_typing_uninitialized_variables, non_constant_identifier_names, unnecessary_string_interpolations, sized_box_for_whitespace, unnecessary_string_escapes

import 'package:donor_darah/custom_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../data/repository/agenda/agenda_repository_impl.dart';
import '../../../utility/commons.dart';
import '../BLOC/agenda/cubit/agenda_cubit.dart';

class DetailAgenda extends StatefulWidget {
  const DetailAgenda({Key? key}) : super(key: key);

  @override
  State<DetailAgenda> createState() => _DetailAgendaState();
}

class _DetailAgendaState extends State<DetailAgenda> {
  late AgendaCubit _agendaCubit;

  @override
  void initState() {
    // TODO: implement initState
    _agendaCubit = AgendaCubit(
      AgendaRemoteRepositoryImpl(),
    );
    super.initState();
  }

  @override
  void dispose() {
    _agendaCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
      body: BlocConsumer<AgendaCubit, AgendaState>(
        listener: (context, agendaState) {
          if (agendaState is AgendaIsFailed) {
            Commons().showSnackBarInfo2(context, agendaState.message!);
          }
        },
        builder: (context, agendaState) {
          if (agendaState is AgendaIsLoading) {
            return const Center(
              child: LinearProgressIndicator(),
            );
          } else if (agendaState is AgendaIsSucces) {}
          {
            return Column(
              children: [
                Container(
                  height: 100,
                  color: const Color.fromRGBO(217, 30, 42, 1),
                  child: Padding(
                      padding: const EdgeInsets.only(left: 38),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top: 35),
                                child: const Text(
                                  "Agenda Donor Darah",
                                  style: TextStyle(
                                      wordSpacing: 2,
                                      fontSize: 16,
                                      fontFamily: "Plus Jakarta Sans",
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Container(
                                  padding:
                                      const EdgeInsets.only(left: 101, top: 38),
                                  child: const Image(
                                    image: AssetImage("assets/images/DD17.png"),
                                    height: 40,
                                    width: 40,
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
                    padding: const EdgeInsets.fromLTRB(14, 16, 0, 0),
                    width: 312,
                    height: 221,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(249, 249, 249, 1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 1,
                            spreadRadius: 0,
                            offset: const Offset(0, 0),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(4)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Kantor Kecamatan Ketapang",
                            style: TextStyle(
                                letterSpacing: 0.5,
                                fontSize: 12,
                                fontFamily: "Plus Jakarta Sans",
                                color: Color.fromRGBO(217, 30, 42, 1),
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 17,
                          ),
                          Container(
                            child: Row(
                              children: [
                                const Image(
                                    image:
                                        AssetImage("assets/images/DD18.png")),
                                Container(
                                    margin:
                                        const EdgeInsets.only(left: 10, top: 4),
                                    child: Text(
                                      "Senin, 23 Januari 2023",
                                      style: CustomStyle262(),
                                    )),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Container(
                            child: Row(
                              children: [
                                const Image(
                                    image:
                                        AssetImage("assets/images/DD19.png")),
                                Container(
                                    margin:
                                        const EdgeInsets.only(left: 10, top: 4),
                                    child: Text(
                                      "08:00 - 10:00 WIB",
                                      style: CustomStyle262(),
                                    )),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      right: 10, bottom: 25),
                                  child: const Image(
                                    image: AssetImage("assets/images/DD20.png"),
                                  ),
                                ),
                                Container(
                                    child: RichText(
                                  text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                      text:
                                          "Jl. Sisingamangaraja No.56a, Sampit,\nDelta Pawan, Kabupaten Ketapang,\nKalimantan Barat 78811, Indonesia",
                                      style: CustomStyle01(),
                                    ),
                                  ]),
                                )),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 150, top: 23),
                            child: ElevatedButton(
                              onPressed: () => context.go('/lihattiketdonor'),
                              child: Text(
                                "Lihat Tiket Donor",
                                style: CustomStyle2492(),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(217, 30, 42, 1),
                              ),
                            ),
                          )
                        ])),
              ],
            );
          }
        },
      ),
    );
  }
}
