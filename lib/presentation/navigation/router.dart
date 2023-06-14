import 'package:donor_darah/domain/model/request/update_profil/update_profile-request.dart';
import 'package:donor_darah/presentation/navigation/routes.dart';
import 'package:donor_darah/presentation/pages/Agenda/detail_agenda.dart';
import 'package:donor_darah/presentation/pages/Agenda/detail_info_agenda.dart';
import 'package:donor_darah/presentation/pages/BLOC/register/screen_register.dart';
import 'package:donor_darah/presentation/pages/Home/dasboard.dart';
import 'package:donor_darah/presentation/pages/Home/screen_log.dart';
import 'package:donor_darah/presentation/pages/Notifikasi/notifikasi_detail.dart';
import 'package:donor_darah/presentation/pages/Notifikasi/notifikasi_kosong.dart';
import 'package:donor_darah/presentation/pages/Notifikasi/response_notif.dart';
import 'package:donor_darah/presentation/pages/Profil/screen_akun.dart';
import 'package:donor_darah/presentation/pages/Profil/screen_bukti_donor.dart';
import 'package:donor_darah/presentation/pages/Profil/screen_edit_profil.dart';
import 'package:donor_darah/presentation/pages/Profil/screen_kartu_donor.dart';
import 'package:donor_darah/presentation/pages/Profil/screen_riwayar_donor.dart';
import 'package:donor_darah/presentation/pages/Profil/screen_riwayat_donor_kosong.dart';
import 'package:donor_darah/presentation/pages/Profil/screen_ubah_sandi.dart';
import 'package:donor_darah/presentation/pages/detail_jadwal/detail_jadwal_page.dart';
import 'package:donor_darah/presentation/pages/info_berita/detail_info_berita.dart';
import 'package:donor_darah/presentation/pages/jadwal_donor/cubit/jadwal_donor_cubit.dart';
import 'package:donor_darah/presentation/pages/jadwal_donor/jadwal_donor_page.dart';
import 'package:donor_darah/presentation/pages/login/login_page.dart';
import 'package:donor_darah/presentation/pages/lupa_password/lupa_password_page.dart';
import 'package:donor_darah/presentation/pages/pernyataan/pernyataan_page.dart';
import 'package:donor_darah/presentation/pages/questionaire/questionaire_page.dart';
import 'package:donor_darah/presentation/pages/register/screen_register.dart';
import 'package:donor_darah/presentation/pages/register/screen_register_alamat.dart';
import 'package:donor_darah/presentation/pages/register/screen_register_sandi.dart';
import 'package:donor_darah/presentation/pages/splash_screen/splash_screen.dart';
import 'package:donor_darah/presentation/pages/stok_darah/screen_stok_darah.dart';
import 'package:donor_darah/presentation/pages/stok_darah/screen_stok_darahA.dart';
import 'package:donor_darah/presentation/pages/udd/cubit/unit_udd_cubit.dart';
import 'package:donor_darah/presentation/pages/udd/udd_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: Routes.splashScreen,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/dashboard',
      name: Routes.dasboard,
      builder: (context, state) => const dasboard(),
    ),
    GoRoute(
        path: "/akun",
        name: Routes.screenakun,
        builder: (context, state) => const ScreenAkun()),
    GoRoute(
        path: "/detailagenda",
        name: Routes.detailagenda,
        builder: (context, state) => const DetailAgenda()),
    GoRoute(
        path: "/notifikasidetail",
        name: Routes.notifikasidetail,
        builder: (context, state) => const Notifikasidetail()),
    GoRoute(
        path: "/lihattiketdonor",
        name: Routes.detailinfoagenda,
        builder: (context, state) => const DetailInfoAGenda()),
    GoRoute(
        path: "/jadwaldonordarah",
        name: Routes.responsenotif,
        builder: (context, state) => const ResponseNotif()),
    GoRoute(
        path: "/ubahsandi",
        name: Routes.screenubahsandi,
        builder: (context, state) => const ScreenUbahSandi()),
    GoRoute(
        path: "/notifkosong",
        name: Routes.notifikasik,
        builder: (context, state) => const NotifikasiKosong()),
    GoRoute(
        path: "/kartudonor",
        name: Routes.screenkartudonor,
        builder: (context, state) => const ScreenKartuDonor()),
    GoRoute(
        path: "/riwayatdonor",
        name: Routes.screenriwayatdonor,
        builder: (context, state) => const ScreenRiwayatDonor()),
    GoRoute(
        path: "/riwayatdonork",
        name: Routes.screenriwayatdonork,
        builder: (context, state) => const ScreenRiwayatDonorK()),
    GoRoute(
        path: "/buktidonor",
        name: Routes.screenbuktidonor,
        builder: (context, state) => const ScreenBuktiDonor()),
    GoRoute(
        path: "/editprofil",
        name: Routes.screeneditprofil,
        builder: (context, state) => const ScreenEditProfil()),
    GoRoute(
        path: "/stokdarah",
        name: Routes.screenstokdarah,
        builder: (context, state) => const ScreenStokDarah()),
    GoRoute(
        path: "/stokdarahA",
        name: Routes.screenstokdarahA,
        builder: (context, state) => const ScreenStokDarahA()),
    GoRoute(
        path: "/logout",
        name: Routes.screenLog,
        builder: (context, state) => const ScreenLog()),
    GoRoute(
        path: "/register",
        name: Routes.screenReg,
        builder: (context, state) => const ScreenRegister(),
        routes: [
          GoRoute(
              path: "step2",
              name: Routes.screenRegA,
              routes: [
                GoRoute(
                  path: "step3",
                  name: Routes.screenRegS,
                  builder: (context, state) {
                    UpdateProfileRequest page2 =
                        state.extra as UpdateProfileRequest;
                    return ScreenRegisterSandi(
                      page2: page2,
                    );
                  },
                )
              ],
              builder: (context, state) {
                UpdateProfileRequest page1 =
                    state.extra as UpdateProfileRequest;
                return ScreenRegisterAlamat(
                  page1: page1,
                );
              })
        ]),
    GoRoute(
      path: "/berita",
      name: Routes.detailinfoberita,
      builder: (context, state) => const DetailInfoBerita(),
    ),
    GoRoute(
      path: "/regscreen",
      name: Routes.regscreen,
      builder: (context, state) => const RegScreen(),
    ),
    GoRoute(
      path: '/login',
      name: Routes.loginPage,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/lupa-password',
      name: Routes.lupaPasswordPage,
      builder: (context, state) => const LupaPasswordPage(),
    ),
    GoRoute(
      path: '/pernyataan',
      name: Routes.pernyataanPage,
      builder: (context, state) => const PernyataanPage(),
    ),
    GoRoute(
      path: '/questionaire',
      name: Routes.questionerPage,
      builder: (context, state) => const QuestionairePage(),
    ),
    GoRoute(
      path: '/udd',
      name: Routes.uddPage,
      builder: (context, state) {
        BlocProvider.of<UnitUddCubit>(context)
            .fetchUnitUdd(accesToken: "accesToken");
        return const UddPage();
      },
    ),
    GoRoute(
      path: '/jadwal-donor',
      name: Routes.jadwalDonorPage,
      builder: (context, state) {
        int unitId = state.extra as int;
        BlocProvider.of<JadwalDonorCubit>(context).fetchSchedule(
          accesToken: "accesToken",
          unitId: unitId,
        );
        BlocProvider.of<UnitUddCubit>(context).fetchUnitUdd(
          accesToken: "accesToken",
        );
        return JadwalDonorPage(
          unitId: unitId,
        );
      },
    ),
    GoRoute(
      path: '/detail-jadwal-donor',
      name: Routes.detailJadwalPage,
      builder: (context, state) {
        Map<String, dynamic> data = state.extra as Map<String, dynamic>;
        return DetailJadwalPage(
          nama: data['nama'],
          address: data['address'],
          type: data['type'],
          time: data['time'],
          date: data['date'],
        );
      },
    ),
  ],
);
