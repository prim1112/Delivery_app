import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_delivery/pages/homepage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class Appdata with ChangeNotifier {
  String imageDefaltRider = 'assets/images/profile.png';
  String imageDefaltUser = 'assets/images/profile1.png';
  String imageUserNotFound = 'assets/images/profile1.png';
  StreamSubscription? checkDocUser;
  StreamSubscription? listener;
  StreamSubscription? listener2;
  StreamSubscription? listener3;
  StreamSubscription? time;

  LatLng latLng = const LatLng(0, 0);
  late UserProfile user;

  String _phone = ""; // เก็บเบอร์โทรศัพท์ของผู้ใช้

  // Getter สำหรับเบอร์โทรศัพท์
  String get phone => _phone;

    // Setter สำหรับอัปเดตเบอร์โทรศัพท์
  void setPhone(String phoneNumber) {
    _phone = phoneNumber;
  }

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
            backgroundColor: MaterialStateProperty.all(const Color(0xFFE53935)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
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


void showLogoutDialog(BuildContext context) {
  var db = FirebaseFirestore.instance;
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0), // ทำให้มุมโค้งมน
      ),
      title: Text(
        'ออกจากระบบ',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: Get.textTheme.headlineMedium!.fontSize,
          fontWeight: FontWeight.bold,
          color: const Color(0xFFE53935),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: Get.textTheme.titleLarge!.fontSize!),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size(
                      Get.textTheme.displaySmall!.fontSize! * 3,
                      Get.textTheme.titleLarge!.fontSize! * 2.5
                  ),
                  backgroundColor: const Color(0xFFFF7622),
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'ยกเลิก',
                  style: TextStyle(
                    fontSize: Get.textTheme.titleLarge!.fontSize,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size(
                      Get.textTheme.displaySmall!.fontSize! * 3,
                      Get.textTheme.titleLarge!.fontSize! * 2.5
                  ),
                  backgroundColor: const Color(0xFFE53935),
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'ยืนยัน',
                  style: TextStyle(
                    fontSize: Get.textTheme.titleLarge!.fontSize,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
                onPressed: () async {
                  var appData = context.read<Appdata>();

                  // ยกเลิกการฟัง Listener ต่างๆ
                  if (appData.listener != null) {
                    await appData.listener!.cancel();
                    appData.listener = null;
                    log('Stop listener');
                  }
                  if (appData.listener2 != null) {
                    await appData.listener2!.cancel();
                    appData.listener2 = null;
                    log('Stop listener2');
                  }
                  if (appData.listener3 != null) {
                    await appData.listener3!.cancel();
                    appData.listener3 = null;
                    log('Stop listener3');
                  }
                  if (appData.time != null) {
                    await appData.time!.cancel();
                    appData.time = null;
                    log('Stop time');
                  }
                  if (appData.checkDocUser != null) {
                    await appData.checkDocUser!.cancel();
                    appData.checkDocUser = null;
                    log('Stop checkDocUser');
                  }

                  // อัปเดตสถานะการล็อกอินใน Firestore
                  UserProfile userProfile = appData.user; // ต้องแน่ใจว่า userProfile มีค่าและถูกต้อง
                  if (userProfile.id != 0) { // ตรวจสอบว่า id ไม่เป็นค่าเริ่มต้น
                    var data = {'StatusLogin': "ยังไม่ล็อกอิน"};
                    GetStorage storage = GetStorage();
                    var type = storage.read('StatusLogin');

                    try {
                      if (type == "user") {
                        await db.collection('user').doc(userProfile.id.toString()).update(data);
                      } else if (type == "rider") {
                        await db.collection('rider').doc(userProfile.id.toString()).update(data);
                      }
                    } catch (e) {
                      log('Error updating StatusLogin: $e'); // แสดงข้อผิดพลาดที่เกิดขึ้น
                    }
                  } else {
                    log('UserProfile ID is invalid: ${userProfile.id}'); // แสดงข้อความหาก ID ไม่ถูกต้อง
                  }

                  // ล้างข้อมูลจาก GetStorage และนำผู้ใช้กลับไปหน้าแรก
                  GetStorage storage = GetStorage();
                  storage.erase();
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
