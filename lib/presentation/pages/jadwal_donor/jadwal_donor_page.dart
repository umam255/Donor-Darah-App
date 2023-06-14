// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'package:donor_darah/base/widget/BaseColor.dart';
import 'package:donor_darah/data/repository/jadwal_donor/jadwal_donor_repository_impl.dart';
import 'package:donor_darah/data/utilities/commons.dart';
import 'package:donor_darah/domain/repository/jadwal_donor/jadwal_donor_repository.dart';
import 'package:donor_darah/presentation/navigation/routes.dart';
import 'package:donor_darah/presentation/pages/BLOC/unit/cubit/unit_cubit.dart';
import 'package:donor_darah/presentation/pages/jadwal_donor/cubit/jadwal_donor_cubit.dart';
import 'package:donor_darah/presentation/pages/udd/cubit/unit_udd_cubit.dart';

formatTanggal(String tanggal) {
  if (tanggal == "") {
    return "";
  }
  initializeDateFormatting('id', null);
  DateTime parse = DateTime.parse(tanggal).toLocal();
  String date = DateFormat('EEEE, dd MMMM yyyy', 'id').format(parse);

  return date;
}

formatJam(String jam, String date) {
  DateTime parsedTime = DateTime.parse('$date $jam');
  String formattedTime = DateFormat('HH:mm').format(parsedTime);

  return formattedTime;
}

class JadwalDonorPage extends StatefulWidget {
  final int unitId;
  const JadwalDonorPage({
    Key? key,
    required this.unitId,
  }) : super(key: key);

  @override
  State<JadwalDonorPage> createState() => _JadwalDonorPageState();
}

class _JadwalDonorPageState extends State<JadwalDonorPage> {
  int _dropdownValueUnitId = 0;

  @override
  void initState() {
    super.initState();
    _dropdownValueUnitId = widget.unitId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
            onPressed: () => context.goNamed('udd'),
          ),
          title: const Text(
            'Jadwal Donor',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 14, left: 24, right: 24),
          child: SafeArea(
            child: Column(
              children: [
                BlocBuilder<UnitUddCubit, UnitUddState>(
                  builder: (context, unitState) {
                    if (unitState is UnitUddIsSuccess) {
                      return Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1.0,
                              color: Color(0xffD4D4D4),
                            ),
                          ),
                        ),
                        child: DropdownButtonFormField(
                          value: _dropdownValueUnitId,
                          decoration: InputDecoration(
                            prefixIcon: Image.asset(
                              'assets/images/udd_icon.png',
                              alignment: Alignment.centerLeft,
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          items: unitState.data.map((data) {
                            return DropdownMenuItem(
                              value: data.id,
                              child: Text(data.name),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _dropdownValueUnitId = value!;
                              context.read<JadwalDonorCubit>().fetchSchedule(
                                    accesToken: "accesToken",
                                    unitId: widget.unitId,
                                  );
                            });
                          },
                        ),
                      );
                    }
                    return Container();
                  },
                ),
                const SizedBox(height: 14),
                BlocBuilder<JadwalDonorCubit, JadwalDonorState>(
                  builder: (context, state) {
                    if (state is JadwalDonorIsLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: BaseColor.red,
                        ),
                      );
                    } else if (state is JadwalDonorIsError) {
                      Commons().showSnackBarErrorr(context, state.message!);
                    } else if (state is JadwalDonorIsSuccess) {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: state.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            var date = state.data![index];
                            return Column(
                              children: [
                                Container(
                                  height: 36,
                                  color: const Color(0xffFCE9EA),
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 20),
                                      Image.asset(
                                          'assets/images/kalender_icon.png'),
                                      const SizedBox(width: 12),
                                      Text(
                                        formatTanggal(date.date),
                                        style: const TextStyle(
                                          color: Color(0xffD91E2A),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 18),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: state.data![index].schedule.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var schedule =
                                        state.data![index].schedule[index];
                                    return Column(
                                      children: [
                                        ListTile(
                                          dense: true,
                                          contentPadding: EdgeInsets.zero,
                                          minLeadingWidth: 0,
                                          leading: Image.asset(
                                            'assets/images/udd_icon.png',
                                            scale: 1.1,
                                          ),
                                          title: Text(schedule.name),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(height: 8),
                                              Text(schedule.address),
                                              const SizedBox(height: 8),
                                              Text(
                                                "${formatJam(schedule.timeStart, date.date)} - ${formatJam(schedule.timeEnd, date.date)} WIB",
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          trailing: SizedBox(
                                            height: 24,
                                            child: ElevatedButton(
                                              onPressed: (schedule.type ==
                                                      'umum')
                                                  ? () {
                                                      context.goNamed(
                                                        Routes.detailJadwalPage,
                                                        extra: {
                                                          "nama": schedule.name,
                                                          "type": schedule.type,
                                                          "address":
                                                              schedule.address,
                                                          "time":
                                                              '${formatJam(schedule.timeStart, date.date)} - ${formatJam(schedule.timeEnd, date.date)} WIB',
                                                          "date": formatTanggal(
                                                            date.date,
                                                          ),
                                                        },
                                                      );
                                                    }
                                                  : () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color(0xffCCCCCC),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                elevation: 0,
                                              ),
                                              child: Text(
                                                schedule.type,
                                                style: const TextStyle(
                                                  fontSize: 8,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 18),
                                      ],
                                    );
                                  },
                                ),
                                const SizedBox(height: 18),
                              ],
                            );
                          },
                        ),
                      );
                    }
                    return Container();
                  },
                )
              ],
            ),
          ),
        ));
  }
}


  // BlocConsumer<JadwalDonorCubit, JadwalDonorState>(
  //       listener: (context, state) {
  //         if (state is JadwalDonorIsError) {
  //           Commons().showSnackBarErrorr(context, state.message!);
  //         }
  //       },
  //       builder: (context, state) {
  //         if (state is JadwalDonorIsLoading) {
  //           return const Center(
  //             child: CircularProgressIndicator(
  //               color: BaseColor.red,
  //             ),
  //           );
  //         } else if (state is JadwalDonorIsSuccess) {
  //           return 
           
  // Container(
  //   padding: const EdgeInsets.only(top: 14, left: 24, right: 24),
  //   child: Column(
  //     children: [
  //       Container(
  //         decoration: const BoxDecoration(
  //           border: Border(
  //             bottom: BorderSide(
  //               width: 1.0,
  //               color: Color(0xffD4D4D4),
  //             ),
  //           ),
  //         ),
  //         child: DropdownButtonFormField(
  //           value: dropdownvalue,
  //           decoration: InputDecoration(
  //             prefixIcon: Image.asset(
  //               'assets/images/udd_icon.png',
  //               alignment: Alignment.centerLeft,
  //             ),
  //             enabledBorder: InputBorder.none,
  //             focusedBorder: InputBorder.none,
  //           ),
  //           items: list.map((String value) {
  //             return DropdownMenuItem(
  //               value: value,
  //               child: Row(
  //                 children: [
  //                   const SizedBox(width: 10),
  //                   Text(value),
  //                 ],
  //               ),
  //             );
  //           }).toList(),
  //           onChanged: (String? value) {
  //             setState(() {
  //               dropdownvalue = value!;
  //             });
  //           },
  //         ),
  //       ),
  //       const SizedBox(height: 14),
  //       Expanded(
  //         child: ListView.builder(
  //           itemCount: state.data!.length,
  //           itemBuilder: (BuildContext context, int index) {
  //             var date = state.data![index];
  //             return Column(
  //               children: [
  //                 Container(
  //                   height: 36,
  //                   color: const Color(0xffFCE9EA),
  //                   child: Row(
  //                     children: [
  //                       const SizedBox(width: 20),
  //                       Image.asset(
  //                           'assets/images/kalender_icon.png'),
  //                       const SizedBox(width: 12),
  //                       Text(
  //                         formatTanggal(date.date),
  //                         style: const TextStyle(
  //                           color: Color(0xffD91E2A),
  //                           fontSize: 12,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 const SizedBox(height: 18),
  //                 ListView.builder(
  //                   shrinkWrap: true,
  //                   physics: const NeverScrollableScrollPhysics(),
  //                   itemCount: state.data![index].schedule.length,
  //                   itemBuilder: (BuildContext context, int index) {
  //                     var schedule =
  //                         state.data![index].schedule[index];
  //                     return Column(
  //                       children: [
  //                         ListTile(
  //                           dense: true,
  //                           contentPadding: EdgeInsets.zero,
  //                           minLeadingWidth: 0,
  //                           leading: Image.asset(
  //                             'assets/images/udd_icon.png',
  //                             scale: 1.1,
  //                           ),
  //                           title: Text(schedule.name),
  //                           subtitle: Column(
  //                             crossAxisAlignment:
  //                                 CrossAxisAlignment.start,
  //                             children: [
  //                               const SizedBox(height: 8),
  //                               Text(schedule.address),
  //                               const SizedBox(height: 8),
  //                               Text(
  //                                 "${formatJam(schedule.timeStart, date.date)} - ${formatJam(schedule.timeEnd, date.date)} WIB",
  //                                 style: const TextStyle(
  //                                   color: Colors.black,
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                           trailing: SizedBox(
  //                             height: 24,
  //                             child: Expanded(
  //                               child: ElevatedButton(
  //                                 onPressed: (schedule.type == 'umum')
  //                                     ? () {
  //                                         context.goNamed(
  //                                           Routes.detailJadwalPage,
  //                                           extra: schedule.name,
  //                                         );
  //                                       }
  //                                     : () {},
  //                                 style: ElevatedButton.styleFrom(
  //                                   backgroundColor:
  //                                       const Color(0xffCCCCCC),
  //                                   shape: RoundedRectangleBorder(
  //                                     borderRadius:
  //                                         BorderRadius.circular(4),
  //                                   ),
  //                                   elevation: 0,
  //                                 ),
  //                                 child: Text(
  //                                   schedule.type,
  //                                   style: const TextStyle(
  //                                     fontSize: 8,
  //                                     color: Colors.black,
  //                                     fontWeight: FontWeight.bold,
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                         const SizedBox(height: 18),
  //                       ],
  //                     );
  //                   },
  //                 ),
  //                 const SizedBox(height: 18),
  //               ],
  //             );
  //                     },
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           );
     
  //         }
  //         return Container();
  //       },
  //     ),
    