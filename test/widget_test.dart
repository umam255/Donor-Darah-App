// ignore_for_file: public_member_api_docs, sort_constructors_first
// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:donor_darah/base/base_config/base_config.dart';
import 'package:donor_darah/data/service/remote/unit_udd/unit_udd_service.dart';
import 'package:http/http.dart';

void main() {
  Client client = Client();

  Future<Response> fetchUnitUdd() async {
    final url = Uri.https(
      BaseConfig.BASE_DOMAIN,
      BaseConfig.BASE_PATH + BaseConfig.UNIT,
    );

    print("URL : ${url.toString()}");

    return client.get(url);
  }
}
