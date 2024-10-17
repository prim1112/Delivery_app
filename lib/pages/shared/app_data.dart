import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class Appdata with ChangeNotifier {
  String imageDefaltRider = 'assets/images/profile.jpg';
  String imageDefaltUser = 'assets/images/profile1.jpg';
  LatLng latLng = const LatLng(0, 0);
  late UserProfile user;
}

class UserProfile {
  int id = 0;
}

void showLoadDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // ปิดการทำงานของการกดนอก dialog เพื่อปิด
    builder: (BuildContext context) {
      return PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          log('กำลังโหลด');
        },
        child: const Dialog(
          backgroundColor: Colors.transparent, // พื้นหลังโปร่งใส
          child: Center(
            child:
                CircularProgressIndicator(), // แสดงแค่ CircularProgressIndicator
            // Image.asset(
            //   'assets/loading.gif',
            //   width: 100,
            //   height: 100,
            // ),
          ),
        ),
      );
    },
  );
}

void showErrorDialog(String title, String message, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: const Color(0xFFE53935),
        ),
      ),
      content: Text(
        message,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: const Color(0xFFE53935),
        ),
      ),
      actions: [
        FilledButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(const Color(0xFFE53935)),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            )),
          ),
          child: Text(
            'ปิด',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFFFFFFF),
            ),
          ),
        ),
      ],
    ),
  );
}