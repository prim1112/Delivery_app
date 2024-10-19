import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_delivery/Rider/rider_home_screen.dart';
import 'package:flutter_delivery/pages/homepage.dart';
import 'package:flutter_delivery/pages/sender_or_receiver.dart';
import 'package:flutter_delivery/pages/shared/app_data.dart';
import 'package:flutter_delivery/pages/user_or_rider.dart';

import 'package:flutter_delivery/sender/home_sender.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GetStorage storage = GetStorage();
  TextEditingController passwordCtl = TextEditingController();
  TextEditingController phoneCtl = TextEditingController();
  TextEditingController confirmPasswordCtl = TextEditingController();

  var db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffd32f2f),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 250, 0, 0),
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: SizedBox(
                  width: double.infinity, // ขยายเต็มความกว้างของหน้าจอ
                  height: screenHeight *
                      0.7, // ปรับความสูงตามความสูงของหน้าจอ (60%)
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // กำหนดมุมโค้ง
                    ),
                    color: const Color(0xfffafafa), // ใส่สีพื้นหลัง
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment
                            .start, // จัดให้ทุกอย่างอยู่ตรงกลางในแนวตั้ง
                        crossAxisAlignment: CrossAxisAlignment
                            .center, // จัดให้อยู่ตรงกลางในแนวนอน
                        children: [
                          const Text(
                            'เข้าสู่ระบบ',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 50, 50, 0),
                                child: Text(
                                  'เบอร์โทร',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                            child: SizedBox(
                              height: 50, // กำหนดความสูงของ TextField
                              child: TextField(
                                controller: phoneCtl,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(30), // ขอบโค้ง
                                    borderSide: const BorderSide(
                                        color: Colors.red,
                                        width: 2), // ขอบสีแดงเมื่อโฟกัส
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(30), // ขอบโค้ง
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(
                                          255, 255, 17, 0), // ขอบสีแดง
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 30, 50, 0),
                                child: Text(
                                  'รหัสผ่าน',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
                            child: SizedBox(
                              height: 50, // กำหนดความสูงของ TextField
                              child: TextField(
                                controller: passwordCtl,
                                obscureText: true,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(30), // ขอบโค้ง
                                    borderSide: const BorderSide(
                                        color: Colors.red,
                                        width: 2), // ขอบสีแดงเมื่อโฟกัส
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(30), // ขอบโค้ง
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(
                                          255, 255, 17, 0), // ขอบสีแดง
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(20),
                                child: ElevatedButton(
                                  onPressed: dialogLogin,
                                  child: Text(
                                    'เข้าสู่ระบบ',
                                    style: TextStyle(
                                      color: Color(0xFFFAFAFA),
                                      fontSize: 20,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor:
                                        const Color.fromARGB(255, 0, 0, 0),
                                    backgroundColor: Color(0xffd32f2f),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'หากไม่มีบัญชี',
                                style: TextStyle(fontSize: 12), // ลดขนาดฟอนต์
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: TextButton(
                                  onPressed: register,
                                  child: const Text(
                                    'สมัครสมาชิก',
                                    style: TextStyle(
                                      fontSize: 14, // ขนาดฟอนต์ของปุ่ม
                                      color: Color.fromARGB(255, 255, 0, 0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  //   void login() {
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => const RegisterPage(),
  //       ));
  // }

  void register() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Homepage(),
        ));
  }

  void dialogLogin() {
    if (phoneCtl.text.isEmpty || passwordCtl.text.isEmpty) {
      // showErrorDialog('ผิดพลาด', 'โปรดใส่หมายเลขโทรศัพท์หรือรหัสผ่าน', context);
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0), // ทำให้มุมโค้งมน
          ),
          title: Text(
            'เลือกประเภท',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFE53935),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // จัดให้อยู่ตรงกลางแนวนอน
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFFE53935),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: Text(
                          'ผู้ใช้',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFFFFFFFF),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          loginUser();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10), // เพิ่มช่องว่างระหว่างปุ่ม
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // จัดให้อยู่ตรงกลางแนวนอน
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xffffd54f),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: Text(
                          'ไรเดอร์',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFFFFFFFF),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          loginRider();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }

  void loginUser() async {
    String phone = phoneCtl.text;
    String password = passwordCtl.text;

    showLoadDialog(context);
    // ดึงข้อมูลผู้ใช้จาก Firestore
    var querySnapshot = await db
        .collection('user')
        .where('phone', isEqualTo: phone)
        .limit(1)
        .get();
    Navigator.of(context).pop();
    // ตรวจสอบว่าพบผู้ใช้หรือไม่
    if (querySnapshot.docs.isEmpty) {
      showErrorDialog(
          'ไม่พบผู้ใช้', 'หมายเลขโทรศัพท์นี้ยังไม่ได้ลงทะเบียน', context);
      return;
    }

    // ได้ข้อมูลผู้ใช้
    var userData = querySnapshot.docs[0].data();
    var storedHash = userData['password'];
    // var statusLogin = userData['StatusLogin'];

    // ตรวจสอบรหัสผ่าน
    if (storedHash == password) {
      // if (statusLogin == "ล็อกอินแล้ว") {
      //   showErrorDialog('แจ้งเตือน',
      //       'ไม่สามารถล็อกอินได้เนื่องจากได้มีการล็อกอินจากอีกที่', context);
      //   return;
      // }
      UserProfile userProfile = UserProfile();
      userProfile.id = userData['id'];
      context.read<Appdata>().user = userProfile;
      storage.write('id', userData['id']);
      storage.write('userStatusType', "User");
      var data = {
        'StatusLogin': "ล็อกอินแล้ว",
      };
      await db.collection('user').doc(userData['id'].toString()).update(data);
      Get.to(() => const Sender_ReceiverPage());
    } else {
      showErrorDialog(
          'รหัสผ่านไม่ถูกต้อง', 'โปรดตรวจสอบรหัสผ่านอีกครั้ง', context);
    }
  }

  void loginRider() async {
    String phone = phoneCtl.text;
    String password = passwordCtl.text;

    showLoadDialog(context);
    // ดึงข้อมูลผู้ใช้จาก Firestore
    var querySnapshot = await db
        .collection('rider')
        .where('phone', isEqualTo: phone)
        .limit(1)
        .get();
    Navigator.of(context).pop();
    // ตรวจสอบว่าพบผู้ใช้หรือไม่
    if (querySnapshot.docs.isEmpty) {
      showErrorDialog(
          'ไม่พบผู้ใช้', 'หมายเลขโทรศัพท์นี้ยังไม่ได้ลงทะเบียน', context);
      return;
    }

    // ได้ข้อมูลผู้ใช้
    var userData = querySnapshot.docs[0].data();
    var storedHash = userData['password'];
    // var statusLogin = userData['StatusLogin'];

    // ตรวจสอบรหัสผ่าน
    if (storedHash == password) {
      // if (statusLogin == "ล็อกอินแล้ว") {
      //   showErrorDialog('แจ้งเตือน',
      //       'ไม่สามารถล็อกอินได้เนื่องจากได้มีการล็อกอินจากอีกที่', context);
      //   return;

      // }
      UserProfile userProfile = UserProfile();
      userProfile.id = userData['id'];
      context.read<Appdata>().user = userProfile;
      storage.write('id', userData['id']);
      storage.write('userStatusType', "Rider");
      var data = {
        'StatusLogin': "ล็อกอินแล้ว",
      };
      await db.collection('rider').doc(userData['id'].toString()).update(data);
      Get.to(() => OrderDetailsScreen());
    } else {
      showErrorDialog(
          'รหัสผ่านไม่ถูกต้อง', 'โปรดตรวจสอบรหัสผ่านอีกครั้ง', context);
    }
  }
}
