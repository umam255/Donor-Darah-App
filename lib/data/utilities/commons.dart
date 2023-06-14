import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Commons {
  final pref = SharedPreferences.getInstance();

  void setUid(String token) async {
    final storage = await pref;
    await storage.setString("token", token);
  }

  Future<String> getUid() async {
    final storage = await pref;
    return storage.getString("token")!;
  }

  Future<bool> removeUid() async {
    final storage = await pref;
    return storage.remove("token");
  }

  void showSnackBarErrorr(BuildContext context, String msg) {
    showTopSnackBar(context, CustomSnackBar.error(message: msg));
  }

  void showSnackBarSuccess(BuildContext context, String msg) {
    showTopSnackBar(context, CustomSnackBar.success(message: msg));
  }
}
