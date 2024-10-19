import 'package:flutter/material.dart';
import 'package:flutter_delivery/pages/login.dart';
import 'package:flutter_delivery/pages/user_or_rider.dart';
import 'dart:developer';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffd32f2f),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 100, 0, 30),
                child: Text(
                  'Food for everyone',
                  style: TextStyle(
                    color: Color(0xFFFAFAFA),
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(0),
                child: SizedBox(
                  width: double.infinity, // ขยายเต็มความกว้างของหน้าจอ
                  height: screenHeight * 0.8, // กำหนดความสูงของ Card
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // กำหนดมุมโค้ง
                    ),
                    color: Color(0xfffafafa), // ใส่สีพื้นหลัง
                    child: Padding(
                      // padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment
                            .start, // จัดให้ทุกอย่างอยู่ตรงกลางในแนวตั้ง
                        crossAxisAlignment: CrossAxisAlignment
                            .center, // จัดให้อยู่ตรงกลางในแนวนอน
                        children: [
                          Text(
                            'Welcome!',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 50, 0, 40),
                            child: SizedBox(
                              width: 200, // ความกว้างที่ต้องการ
                              height: 50, // ความสูงที่ต้องการ
                              child: ElevatedButton(
                                onPressed: login,
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
                            ),
                          ),
                          SizedBox(height: 20), // ระยะห่างระหว่างข้อความและปุ่ม
                          SizedBox(
                            width: 200, // ความกว้างที่ต้องการ
                            height: 50, // ความสูงที่ต้องการ
                            child: ElevatedButton(
                              onPressed: register,
                              child: Text(
                                'สมัครสมาชิก',
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

  void register() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserOrRiderPage(),
        ));
  }

  void login() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ));
  }
}
