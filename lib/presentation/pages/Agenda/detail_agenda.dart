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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: redColor,
        elevation: 0,
        titleSpacing: width * 0.1,
        toolbarHeight: height * 0.15,
        title: Text(
          'Agenda Donor Darah',
          style: TextStyle(
            fontSize: width * 0.045,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: width * 0.1),
            child: Image.asset(
              'assets/images/DD17.png',
              height: height * 0.1,
              width: width * 0.12,
            ),
          ),
        ],
      ),
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
          } else if (agendaState is AgendaIsSucces) {
            return Column(
              children: [
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
                      Container(
                        child: Row(
                          children: [
                            const Image(
                                image: AssetImage("assets/images/DD18.png")),
                            Container(
                                margin: const EdgeInsets.only(left: 10, top: 4),
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
                                image: AssetImage("assets/images/DD19.png")),
                            Container(
                                margin: const EdgeInsets.only(left: 10, top: 4),
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
                              margin:
                                  const EdgeInsets.only(right: 10, bottom: 25),
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
                    ],
                  ),
                ),
              ],
            );
          }
          {
            // return const Center(
            //   child: Text('Anda Tidak Memiliki Agenda'),
            // );
            return Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 30),
              child: IntrinsicHeight(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xffE6E6E6),
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Kantor Kecamatan Ketapang",
                          style: TextStyle(
                            letterSpacing: 0.5,
                            fontSize: 16,
                            fontFamily: "Plus Jakarta Sans",
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        Container(
                          child: Row(
                            children: [
                              const Image(
                                image: AssetImage("assets/images/DD18.png"),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 10, top: 4),
                                child: const Text(
                                  "Senin, 23 Januari 2023",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
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
                                image: AssetImage("assets/images/DD19.png"),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 10, top: 4),
                                child: const Text(
                                  "08:00 - 10:00 WIB",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
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
                                  right: 10,
                                  bottom: 25,
                                ),
                                child: const Image(
                                  image: AssetImage("assets/images/DD20.png"),
                                ),
                              ),
                              const Expanded(
                                child: Text(
                                  'Jl. Sisingamangaraja No.56a, Sampit, Delta Pawan, Kabupaten Ketapang, Kalimantan Barat 78811, Indonesia',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                  softWrap: true,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 50),
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
                            onPressed: () => context.go('/lihattiketdonor'),
                            child: Text(
                              "Lihat Tiket Donor",
                              style: CustomStyle2492(),
                            ),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(width * 0.45, height * 0.06),
                              elevation: 0,
                              backgroundColor: const Color(0xffD91E2A),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
