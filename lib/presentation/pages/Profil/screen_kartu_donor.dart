// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, prefer_typing_uninitialized_variables, avoid_print, must_be_immutable, unused_local_variable

import 'package:donor_darah/custom_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../data/repository/kartu_donor/kartu_donor_repository_impl.dart';
import '../../../utility/commons.dart';
import '../BLOC/kartu_donor/cubit/kartu_donor_cubit.dart';

class ScreenKartuDonor extends StatefulWidget {
  const ScreenKartuDonor({super.key});

  @override
  State<ScreenKartuDonor> createState() => _ScreenKartuDonorState();
}

class _ScreenKartuDonorState extends State<ScreenKartuDonor> {
  late KartuDonorCubit _kartuDonorCubit;

  @override
  void initState() {
    // TODO: implement initState
    _kartuDonorCubit = KartuDonorCubit(
      KartuDonorRemoteRepositoryImpl(),
    );
    super.initState();
  }

  @override
  void dispose() {
    _kartuDonorCubit.close();
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
                          onPressed: () => context.go('/udd'),
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 20,
                            color: black01Color,
                          )),
                      Text(
                        "Kartu Donor Darah",
                        style: CustomStyle04(),
                      ),
                    ],
                  ),
                ),
              ),
            )),
        body: BlocConsumer<KartuDonorCubit, KartuDonorState>(
          listener: (context, kartuDonorState) {
            if (kartuDonorState is KartuDonorIsFailed) {
              Commons().showSnackBarInfo2(context, kartuDonorState.message!);
            }
          },
          builder: (context, kartuDonorState) {
            if (kartuDonorState is KartuDonorIsLoading) {
              return const Center(
                child: LinearProgressIndicator(),
              );
            } else if (kartuDonorState is KartuDonorIsSucces) {}
            {
              return Column(children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(24, 29, 24, 0),
                  child:
                      const Image(image: AssetImage("assets/images/DD42.png")),
                ),
                const SizedBox(
                  height: 39,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(217, 34, 42, 1),
                    padding: const EdgeInsets.fromLTRB(82, 12, 82, 12),
                  ),
                  child: Text(
                    "Unduh Kartu Donor",
                    style: CustomStyle2493(),
                  ),
                )
              ]);
            }
          },
        ));
  }
}
