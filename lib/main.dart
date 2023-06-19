import 'package:donor_darah/data/repository/forgot_password/forgot_pass_repository_impl.dart';
import 'package:donor_darah/data/repository/jadwal_donor/jadwal_donor_repository_impl.dart';
import 'package:donor_darah/data/repository/login/login_repository_impl.dart';
import 'package:donor_darah/data/repository/questionaire/questionaire_repository_impl.dart';
import 'package:donor_darah/data/repository/register/register_repository_impl.dart';
import 'package:donor_darah/data/repository/unit_udd/unit_udd_repository_impl.dart';
import 'package:donor_darah/presentation/pages/BLOC/notifikasi/cubit/notifikasi_cubit_dart_cubit.dart';
import 'package:donor_darah/presentation/pages/BLOC/register/register_bloc.dart';
import 'package:donor_darah/presentation/pages/jadwal_donor/cubit/jadwal_donor_cubit.dart';
import 'package:donor_darah/presentation/pages/login/cubit/login_cubit.dart';
import 'package:donor_darah/presentation/pages/lupa_password/cubit/forgot_pass_cubit.dart';
import 'package:donor_darah/presentation/pages/questionaire/cubit/questionaire_cubit.dart';
import 'package:donor_darah/presentation/pages/udd/cubit/unit_udd_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:donor_darah/presentation/navigation/router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data/repository/agenda/agenda_repository_impl.dart';
import 'data/repository/district/district_repository_impl.dart';
import 'data/repository/job/job_repository_impl.dart';
import 'data/repository/kartu_donor/kartu_donor_repository_impl.dart';
import 'data/repository/notifikasi/notifikasi_repository_impl.dart';
import 'data/repository/profile/profile_repository_impl.dart';
import 'data/repository/riwayat_donor/riwayat_donor_repository_impl.dart';
import 'data/repository/unit/unit_repository_impl.dart';
import 'data/repository/update_profile/update_profile_repository_impl.dart';
import 'data/repository/village/village_repository_impl.dart';
import 'presentation/pages/BLOC/agenda/cubit/agenda_cubit.dart';
import 'presentation/pages/BLOC/agenda/cubit/agenda_detail_cubit.dart';
import 'presentation/pages/BLOC/district/cubit/district_cubit.dart';
import 'presentation/pages/BLOC/job/cubit/job_cubit.dart';
import 'presentation/pages/BLOC/kartu_donor/cubit/kartu_donor_cubit.dart';
import 'presentation/pages/BLOC/notifikasi/cubit/notifikasi_detail_cubit.dart';
import 'presentation/pages/BLOC/profile/cubit/profile_cubit.dart';
import 'presentation/pages/BLOC/riwayat_donor/cubit/riwayat_donor_cubit.dart';
import 'presentation/pages/BLOC/unit/cubit/unit_cubit.dart';
import 'presentation/pages/BLOC/update_profile/cubit/update_profile_cubit.dart';
import 'presentation/pages/BLOC/village/cubit/village_cubit.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFD91E2A),
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(LoginRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => ForgotPassCubit(ForgotPassRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => QuestionaireCubit(QuestionaireRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => UnitUddCubit(UnitUddRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => JadwalDonorCubit(JadwalDonorRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(RegisterRemoteRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) =>
              NotifikasiCubit(NotifikasiRemoteRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => JobCubit(JobRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => UnitCubit(UnitRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => VillageCubit(VillageRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) =>
              RiwayatDonorCubit(RiwayatDonorRemoteRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) =>
              KartuDonorCubit(KartuDonorRemoteRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) =>
              NotifikasiCubit(NotifikasiRemoteRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) =>
              NotifikasiDetailCubit(NotifikasiRemoteRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => AgendaCubit(AgendaRemoteRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => AgendaDetailCubit(AgendaRemoteRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => AgendaDetailCubit(AgendaRemoteRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(ProfileRemoteRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) =>
              UpdateProfileCubit(UpdateProfileRemoteRepositoryImpl()),
        ),
        BlocProvider(
          create: (context) => DistrictCubit(DistrictRepositoryImpl()),
        ),
      ],
      child: MaterialApp.router(
        title: 'Donor Darah',
        theme: ThemeData(
          textTheme: GoogleFonts.plusJakartaSansTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        // ? Device Preview
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
      ),
    );
  }
}
