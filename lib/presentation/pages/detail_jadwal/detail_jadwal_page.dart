// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class DetailJadwalPage extends StatefulWidget {
  final String nama;
  final String address;
  final String type;
  final String time;
  final String date;
  const DetailJadwalPage({
    Key? key,
    required this.nama,
    required this.address,
    required this.type,
    required this.time,
    required this.date,
  }) : super(key: key);

  @override
  State<DetailJadwalPage> createState() => _DetailJadwalPageState();
}

class _DetailJadwalPageState extends State<DetailJadwalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {},
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 14),
        child: Column(
          children: [
            Container(
              height: 96,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffE6E6E6),
                ),
              ),
              padding: const EdgeInsets.only(left: 12, top: 14),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/udd_icon.png',
                        height: 32,
                        width: 32,
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Text(
                          widget.nama,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: null,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                          color: Color(0xffCCCCCC),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 8),
                        child: Text(
                          widget.type,
                          style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 28),
            Row(
              children: [
                Image.asset('assets/images/kalender_black_icon.png'),
                const SizedBox(width: 10),
                Text(widget.date),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Image.asset('assets/images/jam_icon.png'),
                const SizedBox(width: 10),
                Text(widget.time),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Image.asset('assets/images/map_icon.png'),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(textAlign: TextAlign.left, widget.address),
                ),
              ],
            ),
            const SizedBox(height: 62),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 48,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
              child: TextButton(
                onPressed: () => context.goNamed('pernyataan'),
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xffD91E2A),
                  elevation: 0,
                ),
                child: const Text(
                  'Ikut Partisipasi',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
