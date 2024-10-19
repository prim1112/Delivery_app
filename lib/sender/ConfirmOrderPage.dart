import 'package:flutter_delivery/sender/ConfirmOrderPage.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class ConfirmOrderPage extends StatefulWidget {
  const ConfirmOrderPage({super.key});

  @override
  State<ConfirmOrderPage> createState() => _ConfirmOrderPageState();
}

class _ConfirmOrderPageState extends State<ConfirmOrderPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xffd32f2f),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              // Padding ข้างบนสุด
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 100), // ลด padding ข้างบนลง
              ),
              // ส่วนเนื้อหาหลัก
              Padding(
                padding: const EdgeInsets.all(0),
                child: SizedBox(
                  width:
                      screenWidth * 1, // เพิ่มขนาดความกว้างของการ์ดให้ใหญ่ขึ้น
                  height: screenHeight * 1, // เพิ่มความสูงการ์ดให้ใหญ่ขึ้น
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // ความโค้งของมุมการ์ด
                    ),
                    color: const Color(0xfffafafa),
                    child: Padding(
                      padding:
                          const EdgeInsets.all(15), // ลด padding ข้างในการ์ดลง
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ข้อมูลออร์เดอร์
                          Text(
                            'ออร์เดอร์',
                            style: TextStyle(
                              fontSize: 18, // ลดขนาดฟอนต์ลง
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'กุ้งดอง+แซลมอน\nไก่ทอดซอสเกาหลี',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black), // ลดขนาดฟอนต์ลง
                          ),
                          SizedBox(
                              height: 15), // ลดช่องว่างระหว่างส่วนต่าง ๆ ลง

                          // ข้อมูลผู้รับสินค้า
                          Text(
                            'ผู้รับสินค้า',
                            style: TextStyle(
                              fontSize: 18, // ลดขนาดฟอนต์ลง
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'user1\n0987654321\n87/1 pp lim mm',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black), // ลดขนาดฟอนต์ลง
                          ),
                          SizedBox(height: 15), // ลดช่องว่างลง

                          // การอัปโหลดรูปภาพ
                          Center(
                            child: Column(
                              children: [
                                Container(
                                  width: 280, // ลดขนาดกล่องรูปภาพลง
                                  height: 220, // ลดความสูงของกล่องลง
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(20), // ลดความโค้งมุมของกล่องลง
                                  ),
                                  child: Center(
                                    child: Text(
                                      '#แสดงรูปภาพ',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      height: 40,
                                      child: TextField(
                                        // controller: phoneCtl,
                                        keyboardType: TextInputType.phone,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide.none,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: const Text(
                                          'กล้อง',
                                          style: TextStyle(
                                            color: Color(0xFFFAFAFA),
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xffffd54f),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 25), // ลดช่องว่างลง

                          // ปุ่มยืนยันออร์เดอร์
                           Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(20),
                                child: ElevatedButton(
                                  onPressed: (){},
                                  child: Text(
                                    'ยืนยันออร์เดอร์',
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
}
