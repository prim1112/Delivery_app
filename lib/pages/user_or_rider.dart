import 'package:flutter/material.dart';
import 'package:flutter_delivery/pages/rider_register.dart';
import 'package:flutter_delivery/pages/user_register.dart';
import 'package:flutter_delivery/sender/home_sender.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class UserOrRiderPage extends StatefulWidget {
  const UserOrRiderPage({super.key});

  @override
  State<UserOrRiderPage> createState() => _UserOrRiderPageState();
}

class _UserOrRiderPageState extends State<UserOrRiderPage> {
  @override
  Widget build(BuildContext context) {
    // ใช้ MediaQuery เพื่อตรวจสอบความสูงของหน้าจอ
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffd32f2f),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 100, 0, 30),
                child: Text(
                  '',
                  style: const TextStyle(
                    color: Color(0xFFFAFAFA),
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: SizedBox(
                  width: double.infinity, // ขยายเต็มความกว้างของหน้าจอ
                  height: screenHeight *
                      0.8, // ปรับความสูงตามความสูงของหน้าจอ (60%)
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(100, 20, 50, 0),
                                child: Text(
                                  'เลือกที่ต้อง',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                                child: Text(
                                  'การเลือกสมัครสมาชิก',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 50, 0, 40),
                            child: SizedBox(
                              width: 200, // ความกว้างที่ต้องการ
                              height: 50, // ความสูงที่ต้องการ
                              child: ElevatedButton(
                                onPressed: user,
                                child: const Text(
                                  'ผู้ใช้',
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
                            ),
                          ),
                          const SizedBox(
                              height: 20), // ระยะห่างระหว่างข้อความและปุ่ม
                          SizedBox(
                            width: 200, // ความกว้างที่ต้องการ
                            height: 50, // ความสูงที่ต้องการ
                            child: ElevatedButton(
                              onPressed: rider,
                              child: const Text(
                                'ไรเดอร์',
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

  // void user() {
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => User_registerPage(),
  //       ));
  // }

  // void rider() {
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => Rider_registerPage(),
  //       ));
  // }


    void rider() {
    Get.to(() => Rider_registerPage()); // ใช้ Get.to() แทน Navigator.push()
  }

  void user() {
    Get.to(() => User_registerPage()); // ใช้ Get.to() แทน Navigator.push()
  }
}
