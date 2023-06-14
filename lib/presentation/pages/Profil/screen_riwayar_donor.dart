// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, prefer_typing_uninitialized_variables, avoid_print, must_be_immutable, unused_local_variable, unused_field, no_leading_underscores_for_local_identifiers

import 'dart:io';
import 'package:donor_darah/custom_textStyle.dart';
import 'package:donor_darah/utility/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/repository/riwayat_donor/riwayat_donor_repository_impl.dart';
import '../BLOC/riwayat_donor/cubit/riwayat_donor_cubit.dart';

class ScreenRiwayatDonor extends StatefulWidget {
  const ScreenRiwayatDonor({super.key});

  @override
  State<ScreenRiwayatDonor> createState() => _ScreenRiwayatDonorState();
}

class _ScreenRiwayatDonorState extends State<ScreenRiwayatDonor> {
  PickedFile? _imageFile;

  var image;
  late RiwayatDonorCubit _riwayatDonorCubit;

  @override
  void initState() {
    // TODO: implement initState
    _riwayatDonorCubit = RiwayatDonorCubit(
      RiwayatDonorRemoteRepositoryImpl(),
    );
    super.initState();
  }

  @override
  void dispose() {
    _riwayatDonorCubit.close();
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
                          onPressed: () => context.go('/riwayatdonork'),
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 20,
                            color: Color.fromRGBO(0, 0, 0, 1),
                          )),
                      Text(
                        "Riwayat Donor",
                        style: CustomStyle04(),
                      ),
                    ],
                  ),
                ),
              ),
            )),
        backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
        body: BlocConsumer<RiwayatDonorCubit, RiwayatDonorState>(
          listener: (context, riwayatDonorState) {
            if (riwayatDonorState is RiwayatDonorIsFailed) {
              Commons().showSnackBarInfo2(context, riwayatDonorState.message!);
            }
          },
          builder: (context, riwayatDonorState) {
            if (riwayatDonorState is RiwayatDonorIsLoading) {
              return const Center(
                child: LinearProgressIndicator(),
              );
            } else if (riwayatDonorState is RiwayatDonorIsSucces) {}
            {
              return Padding(
                padding: const EdgeInsets.only(top: 18, left: 24, right: 24),
                child: Column(children: [
                  DetailRiwayatDonor(
                      text1: "Kantor Kecamatan Ketapang",
                      text2: "Senin, 22 Januari 2023",
                      text3: "Upload Bukti Donor",
                      text4: "Umum",
                      onTap: () {
                        Commons().showSelectPhotoOptions(context);
                        setState(() {
                          context.go('/buktidonor');
                        });
                      }),
                  const SizedBox(
                    height: 12,
                  ),
                  DetailRiwayatDonor(
                      text1: "Kantor PMI Ketapang",
                      text2: "Senin, 22 November 2023",
                      text3: "Lihat Bukti Donor",
                      text4: "Tertutup",
                      onTap: () => context.go('/buktidonor')),
                  const SizedBox(
                    height: 12,
                  ),
                  DetailRiwayatDonor(
                    text1: "Kantor PMI Ketapang",
                    text2: "Senin, 22 Agustus 2023",
                    text3: "Lihat Bukti Donor",
                    text4: "Umum",
                    onTap: () => context.go('/buktidonor'),
                  ),
                ]),
              );
            }
          },
        ));
  }
}

class DetailRiwayatDonor extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final String text4;

  void Function()? onTap;

  DetailRiwayatDonor({
    Key? key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RiwayatDonorCubit, RiwayatDonorState>(
      builder: (context, riwayatDonorState) {
        return Container(
          padding: const EdgeInsets.all(9),
          height: 100,
          width: 312,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(249, 249, 249, 1),
              borderRadius: BorderRadius.circular(4),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 1,
                  color: Color.fromRGBO(230, 230, 230, 1),
                )
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(text1, style: CustomStyle03()),
                    const Padding(padding: EdgeInsets.only(top: 5)),
                    Text(text2, style: CustomStyle1531()),
                    const SizedBox(
                      height: 31,
                    ),
                    InkWell(
                      onTap: onTap,
                      child: Text(text3,
                          style: const TextStyle(
                              fontFamily: "Plus Jakarta Sans",
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(217, 30, 42, 1))),
                    ),
                  ],
                ),
              ),
              Container(
                height: 25,
                width: 55,
                padding: const EdgeInsets.only(top: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: const Color.fromRGBO(204, 204, 204, 1),
                ),
                child: Text(text4,
                    textAlign: TextAlign.center, style: CustomStyle262()),
              ),
            ],
          ),
        );
      },
    );
  }
}
