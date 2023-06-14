import 'package:donor_darah/base/widget/BaseColor.dart';
import 'package:donor_darah/presentation/navigation/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/Logo.png',
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const SizedBox(
            height: 90,
          ),
          SizedBox(
            width: 312,
            height: 52,
            child: ElevatedButton(
              onPressed: () {
                context.goNamed(Routes.loginPage);
              },
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                backgroundColor: BaseColor.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  color: BaseColor.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          SizedBox(
            width: 312,
            height: 52,
            child: ElevatedButton(
              onPressed: () {
                context.goNamed(Routes.regscreen);
              },
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                backgroundColor: const Color(0xFFD91E2A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                side: const BorderSide(color: Colors.white),
              ),
              child: const Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
