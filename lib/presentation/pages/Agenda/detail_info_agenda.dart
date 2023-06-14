// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, prefer_typing_uninitialized_variables, avoid_print, unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:donor_darah/custom_textStyle.dart';
import 'package:donor_darah/presentation/pages/BLOC/agenda/cubit/agenda_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../data/repository/agenda/agenda_repository_impl.dart';
import '../../../utility/commons.dart';

class DetailInfoAGenda extends StatefulWidget {
  const DetailInfoAGenda({super.key});

  @override
  State<DetailInfoAGenda> createState() => _DetailInfoAGendaState();
}

class _DetailInfoAGendaState extends State<DetailInfoAGenda> {
  var mainColor;
  late AgendaDetailCubit _agendaDetailCubit;

  @override
  void initState() {
    // TODO: implement initState
    _agendaDetailCubit = AgendaDetailCubit(
      AgendaRemoteRepositoryImpl(),
    );
    super.initState();
  }

  @override
  void dispose() {
    _agendaDetailCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    AlertDialog _alertDialog = AlertDialog(
      title: BlocBuilder<AgendaDetailCubit, AgendaDetailState>(
        builder: (context, agendaDetailState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Atur Ulang Jadwal",
                    style: CustomStyle452(),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Icon(
                      Icons.close,
                      size: 15,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 17,
              ),
              Text(
                "Apakah kamu yakin ingin mengatur ulang\njadwal donor",
                style: CustomStyle45(),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
                      ),
                      child: Text(
                        "Kembali",
                        style: CustomStyle2175(),
                      )),
                  const SizedBox(
                    width: 12,
                  ),
                  ElevatedButton(
                      onPressed: () => context.go('/'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(217, 30, 42, 1),
                      ),
                      child: Text(
                        "Ya",
                        style: CustomStyle2492(),
                      )),
                ],
              ),
            ],
          );
        },
      ),
    );
    AlertDialog _alertDialog2 = AlertDialog(
      title: BlocBuilder<AgendaDetailCubit, AgendaDetailState>(
        builder: (context, agendaDetailState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Batalkan Donor",
                    style: CustomStyle452(),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Icon(
                      Icons.close,
                      size: 15,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 17,
              ),
              Text(
                "Apakah kamu yakin ingin membatalkan\nagenda donor darah ?",
                style: CustomStyle45(),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
                      ),
                      child: Text(
                        "Kembali",
                        style: CustomStyle2175(),
                      )),
                  const SizedBox(
                    width: 12,
                  ),
                  ElevatedButton(
                      onPressed: () => context.go('/'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(217, 30, 42, 1),
                      ),
                      child: Text(
                        "Ya",
                        style: CustomStyle2492(),
                      )),
                ],
              ),
            ],
          );
        },
      ),
    );
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: AppBar(
              shadowColor: const Color.fromRGBO(0, 0, 0, 0.25),
              backgroundColor: const Color.fromRGBO(217, 30, 42, 1),
              flexibleSpace: Positioned(
                child: Padding(
                  padding: const EdgeInsets.only(top: 17.67, left: 14),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () => context.go('/'),
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 20,
                            color: Color.fromRGBO(249, 249, 249, 1),
                          )),
                      Text(
                        "Bukti Pengajuan Donor",
                        style: CustomStyle2491(),
                      ),
                    ],
                  ),
                ),
              ),
            )),
        backgroundColor: const Color.fromRGBO(252, 233, 234, 1),
        body: BlocConsumer<AgendaDetailCubit, AgendaDetailState>(
          listener: (context, agendaDetailState) {
            if (agendaDetailState is AgendaDetailIsFailed) {
              Commons().showSnackBarInfo2(context, agendaDetailState.message!);
            }
          },
          builder: (context, agendaDetailState) {
            if (agendaDetailState is AgendaDetailIsLoading) {
              return const Center(
                child: LinearProgressIndicator(),
              );
            } else if (agendaDetailState is AgendaDetailIsSucces) {}
            {
              return Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 141),
                              child: const Text("Donor Darah",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "Plus Jakarta Sans",
                                      color: Color.fromRGBO(217, 30, 42, 1),
                                      fontWeight: FontWeight.w600)),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 105, top: 6),
                              child: const Text("UDD PMI Ketapang",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "Plus Jakarta Sans",
                                      color: Color.fromRGBO(217, 30, 42, 1),
                                      fontWeight: FontWeight.w700)),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 46, right: 46),
                        height: 350,
                        width: 268,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color.fromRGBO(253, 253, 253, 1),
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(left: 24, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                  left: 30,
                                ),
                                child: const Text("Bukti Pengajuan Donor",
                                    style: TextStyle(
                                        wordSpacing: 1,
                                        fontSize: 14,
                                        fontFamily: "Plus Jakarta Sans",
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontWeight: FontWeight.w700)),
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              Text("ID Donor", style: CustomStyle1531()),
                              const SizedBox(
                                height: 4,
                              ),
                              Text("1234567891011", style: CustomStyle03()),
                              const SizedBox(
                                height: 14,
                              ),
                              Text("Nama Pendonor", style: CustomStyle1531()),
                              const SizedBox(
                                height: 4,
                              ),
                              Text("Annisa Tyas Wijaya",
                                  style: CustomStyle03()),
                              const SizedBox(
                                height: 14,
                              ),
                              Text("Jadwal Donor", style: CustomStyle1531()),
                              const SizedBox(
                                height: 4,
                              ),
                              Text("Senin, 23 Januari 2023",
                                  style: CustomStyle03()),
                              const SizedBox(
                                height: 14,
                              ),
                              Text("Jam", style: CustomStyle1531()),
                              const SizedBox(
                                height: 4,
                              ),
                              Text("08:00 - 10:00", style: CustomStyle03()),
                              const SizedBox(
                                height: 14,
                              ),
                              Text("Lokasi", style: CustomStyle1531()),
                              const SizedBox(
                                height: 4,
                              ),
                              Text("Kantor Kecamatan Ketapang",
                                  style: CustomStyle03()),
                              const SizedBox(
                                height: 50,
                              ),
                              const Text(
                                  "Tunjukan Bukti Pengajuan Donor ini kepada petugas PMI",
                                  style: TextStyle(
                                      wordSpacing: 1,
                                      fontSize: 8,
                                      fontFamily: "Plus Jakarta Sans",
                                      color: Color.fromRGBO(217, 30, 42, 1),
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 24, top: 35),
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return _alertDialog;
                                    });
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromRGBO(217, 30, 40, 1),
                                  padding: const EdgeInsets.fromLTRB(
                                      88, 12, 88, 12)),
                              child: const Text("Atur Ulang Jadwal",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "Plus Jakarta Sans",
                                      color: Color.fromRGBO(249, 249, 249, 1),
                                      fontWeight: FontWeight.w600)),
                            ),
                            const Padding(padding: EdgeInsets.only(top: 10)),
                            ElevatedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return _alertDialog2;
                                    });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(252, 233, 234, 1),
                                padding:
                                    const EdgeInsets.fromLTRB(121, 12, 121, 12),
                                side: const BorderSide(
                                    color: Color.fromRGBO(217, 30, 40, 1),
                                    width: 1),
                              ),
                              child: const Text("Batalkan",
                                  style: TextStyle(
                                      wordSpacing: 1,
                                      fontSize: 16,
                                      fontFamily: "Plus Jakarta Sans",
                                      color: Color.fromRGBO(217, 30, 42, 1),
                                      fontWeight: FontWeight.w600)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              );
            }
          },
        ));
  }
}
