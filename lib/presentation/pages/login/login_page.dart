import 'package:donor_darah/data/repository/login/login_repository_impl.dart';
import 'package:donor_darah/data/utilities/commons.dart';
import 'package:donor_darah/domain/model/request/login/login_request.dart';
import 'package:donor_darah/presentation/navigation/routes.dart';
import 'package:donor_darah/presentation/pages/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  void changePasswordVisibility() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  bool validation() {
    if (phoneController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  late LoginCubit _loginCubit;

  @override
  void initState() {
    super.initState();
    _loginCubit = LoginCubit(LoginRepositoryImpl());
  }

  @override
  void dispose() {
    _loginCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, loginState) {
            if (loginState is LoginIsError) {
              ((loginState.message == ""
                  ? Commons().showSnackBarErrorr(
                      context, "No Handone atau Password Salah")
                  : Commons()
                      .showSnackBarErrorr(context, loginState.message!)));
              if (loginState.message == "") {
                Commons().showSnackBarErrorr(
                    context, "No Handone atau Password Salah");
              }
            } else if (loginState is LoginIsSuccess) {
              context.goNamed(Routes.dasboard);
            }
          },
          builder: (context, loginState) {
            return Container(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/Logo.png',
                    ),
                  ),
                  const SizedBox(
                    height: 63,
                  ),
                  const Text(
                    'Selamat Datang',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.02,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    'Silahkan login untuk masuk ke akun anda',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.02,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Nomor Handphone',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFD91E2A)),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color(0xffFCE9EA),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color(0xFFD91E2A),
                            ),
                          ),
                          hintText: 'Masukan No Handphone',
                          suffixIcon: const Icon(
                            Icons.phone_iphone_rounded,
                            color: Color(0xFFD91E2A),
                          ),
                          filled: true,
                          fillColor: const Color(0xffFCE9EA),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Kata Sandi',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFD91E2A)),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextField(
                        controller: passwordController,
                        obscureText: hidePassword,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color(0xffFCE9EA),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color(0xFFD91E2A),
                            ),
                          ),
                          hintText: 'Masukan Kata Sandi',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              changePasswordVisibility();
                            },
                            child: Icon(
                              color: const Color(0xFFD91E2A),
                              (hidePassword)
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          filled: true,
                          fillColor: const Color(0xffFCE9EA),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () =>
                              context.goNamed(Routes.lupaPasswordPage),
                          child: const Text(
                            'Lupa Kata Sandi',
                            style: TextStyle(
                              color: Color(0xFFD91E2A),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 68),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: validation()
                              ? () {
                                  BlocProvider.of<LoginCubit>(context)
                                      .btnlogin(LoginRequest(
                                    phoneController.text,
                                    passwordController.text,
                                  ));
                                }
                              : () {
                                  Commons().showSnackBarErrorr(
                                    context,
                                    'No Handphone & Password Tidak Boleh Kosong',
                                  );
                                },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFD91E2A),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              side: const BorderSide(color: Colors.white),
                              elevation: 0.0),
                          child: BlocBuilder<LoginCubit, LoginState>(
                            builder: (context, loginState) {
                              if (loginState is LoginIsLoading) {
                                return const CircularProgressIndicator(
                                  color: Colors.white,
                                );
                              }
                              return const Text(
                                'Masuk',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Belum Punya Akun?',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              context.goNamed(Routes.regscreen);
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                color: Color(0xFFD91E2A),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ));
  }
}
