import 'package:donor_darah/custom_textStyle.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.15,
        elevation: 0,
        backgroundColor: const Color(0xffD91E2A),
        title: Row(
          children: [
            GestureDetector(
              child: Image.asset("assets/images/DD45.png"),
              onTap: () {},
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Annisa Tyas Wijaya',
                  style: TextStyle(
                    fontSize: width * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'ATW1234567891011',
                  style: TextStyle(
                    fontSize: width * 0.02,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              icon: const Icon(Icons.edit_outlined),
              iconSize: width * 0.07,
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
          ),
          Container(
            color: const Color(0XFFD91E2A),
            height: height * 0.05,
          ),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Material(
                        elevation: 4,
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                        child: Container(
                          width: width * 0.25,
                          height: height * 0.12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Total Donor',
                                style: TextStyle(
                                  fontSize: width * 0.03,
                                ),
                              ),
                              SizedBox(height: height * 0.02),
                              Text(
                                '3',
                                style: TextStyle(
                                  fontSize: width * 0.04,
                                  color: redColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: width * 0.02),
                      Expanded(
                        child: Material(
                          elevation: 4,
                          borderRadius: BorderRadius.circular(4),
                          child: SizedBox(
                            height: height * 0.12,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 15,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Terakhir Donor',
                                        style: TextStyle(
                                          fontSize: width * 0.023,
                                        ),
                                      ),
                                      Text(
                                        '23 Januari 2023',
                                        style: TextStyle(
                                          fontSize: width * 0.023,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: height * 0.01,
                                    ),
                                    child: const Divider(
                                      height: 10,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Donor Selanjutnya',
                                        style:
                                            TextStyle(fontSize: width * 0.023),
                                      ),
                                      Text(
                                        '23 Maret 2023',
                                        style: TextStyle(
                                          fontSize: width * 0.023,
                                          fontWeight: FontWeight.bold,
                                          color: redColor,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: height * 0.03),
                  Material(
                    color: Colors.white,
                    elevation: 4,
                    borderRadius: BorderRadius.circular(4),
                    child: SizedBox(
                      height: height * 0.1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/DD10.png',
                              scale: 0.9,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              'Kartu Donor',
                              style: TextStyle(
                                fontSize: width * 0.025,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 18,
                                color: greyColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Material(
                    color: Colors.white,
                    elevation: 4,
                    borderRadius: BorderRadius.circular(4),
                    child: SizedBox(
                      height: height * 0.1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/DD12.png',
                              scale: 0.9,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              'Riwayat Donor',
                              style: TextStyle(
                                fontSize: width * 0.023,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 18,
                                color: greyColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Material(
                    color: Colors.white,
                    elevation: 2,
                    borderRadius: BorderRadius.circular(4),
                    child: SizedBox(
                      height: height * 0.1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/DD13.png',
                              scale: 0.9,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              'Ubah Kata Sandi',
                              style: TextStyle(
                                fontSize: width * 0.023,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 18,
                                color: greyColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Material(
                    color: Colors.white,
                    elevation: 4,
                    borderRadius: BorderRadius.circular(4),
                    child: SizedBox(
                      height: height * 0.1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/DD9.png',
                              scale: 0.9,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              'Keluar',
                              style: TextStyle(
                                fontSize: width * 0.023,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 18,
                                color: greyColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
