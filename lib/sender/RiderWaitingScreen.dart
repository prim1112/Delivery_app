import 'package:flutter/material.dart';
import 'package:flutter_delivery/pages/navber.dart';

class DeliveryStatusScreen_ extends StatefulWidget {
  @override
  _DeliveryStatusScreen_State createState() => _DeliveryStatusScreen_State();
}

class _DeliveryStatusScreen_State extends State<DeliveryStatusScreen_> {
  int _selectedIndex = 0; // ตัวแปรเก็บตำแหน่งของปุ่มที่เลือก

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffd32f2f),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 80, 0, 30),
                  child: Text(
                    'เช็คสถานะการจัดส่ง',
                    style: TextStyle(
                      color: Color(0xFFFAFAFA),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // มุมโค้งของการ์ดหลัก
              ),
              color: Colors.white, // พื้นหลังการ์ดหลักสีขาว
              elevation: 5, // เงาของการ์ดหลัก
              child: Padding(
                padding: const EdgeInsets.all(16.0), // Padding ภายในการ์ดหลัก
                child: Column(
                  children: [
                    SizedBox(height: 20), // ระยะห่าง

                    // การ์ดย่อยใบที่ 1
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // มุมโค้งของการ์ดย่อย
                        side: BorderSide(
                            color: Colors.black, width: 2), // เส้นขอบสีดำ
                      ),
                      color: Colors.white, // พื้นหลังการ์ดย่อย
                      elevation: 0, // ไม่มีเงา
                      child: Padding(
                        padding: const EdgeInsets.all(
                            16.0), // Padding ภายในการ์ดย่อย
                        child: Column(
                          // ใช้ Column เพื่อจัดแนว
                          crossAxisAlignment:
                              CrossAxisAlignment.start, // จัดให้แนวซ้าย
                          children: [
                            // เพิ่มข้อความที่ต้องการแสดงก่อนรูป
                            Text(
                              'sender1',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '0234566543',
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(
                                height: 10), // ระยะห่างระหว่างข้อความกับรูปภาพ
                            Image.asset(
                              'assets/images/food2.png', // เปลี่ยนเป็น path ของภาพที่คุณต้องการ
                              width: 60, // กำหนดความกว้างของรูปภาพ
                              height: 60, // กำหนดความสูงของรูปภาพ
                              fit: BoxFit.cover, // ปรับขนาดให้เต็มพื้นที่
                            ),
                            SizedBox(height: 5),
                            Text(
                              'กุ้งดอง+แซลมอน',
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(
                                height: 10), // ระยะห่างระหว่างข้อความและปุ่ม

                            // ปุ่มเช็คสถานะ
                            Align(
                              alignment:
                                  Alignment.centerRight, // จัดให้อยู่ทางขวา
                              child: ElevatedButton(
                                onPressed: () {
                                  // ใส่ฟังก์ชันที่ต้องการทำเมื่อกดปุ่ม
                                  print("Check status for sender1");
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.red, // สีพื้นหลังของปุ่ม
                                ),
                                child: Text('เช็คสถานะ',
                                    style: TextStyle(
                                        color: Colors.white)), // ข้อความในปุ่ม
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _selectedIndex, // ตัวแปรเก็บตำแหน่งของปุ่มที่เลือก
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index; // อัปเดตตำแหน่งของปุ่มที่เลือก
          });
        },
        screenSize: MediaQuery.of(context).size, // ขนาดหน้าจอปัจจุบัน
      ),
    );
  }
}
