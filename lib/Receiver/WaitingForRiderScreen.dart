import 'package:flutter/material.dart';
import 'package:flutter_delivery/pages/navber.dart';

class DeliveryStatusScreen extends StatefulWidget {
  @override
  _DeliveryStatusScreenState createState() => _DeliveryStatusScreenState();
}

class _DeliveryStatusScreenState extends State<DeliveryStatusScreen> {
  int _selectedIndex = 0; // ตัวแปรเก็บตำแหน่งของปุ่มที่เลือก

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red, // พื้นหลังสีแดง
      appBar: AppBar(
        title: Text('สถานะการจัดส่ง'),
        backgroundColor: Colors.red, // AppBar สีแดง
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 1, // กว้าง 100% ของหน้าจอ
          height: MediaQuery.of(context).size.height * 0.9, // สูง 90% ของหน้าจอ
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // มุมโค้งของการ์ดหลัก
            ),
            color: Colors.white, // พื้นหลังการ์ดหลักสีขาว
            elevation: 5, // เงาของการ์ดหลัก
            child: Padding(
              padding: const EdgeInsets.all(16.0), // Padding ภายในการ์ดหลัก
              child: SingleChildScrollView( // ใช้เพื่อทำให้เลื่อนดูได้
                child: Column(
                  children: [
                    SizedBox(height: 20), // ระยะห่าง

                    // การ์ดย่อยใบที่ 1
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9, // ตั้งค่าความกว้างของการ์ด (90% ของหน้าจอ)
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // มุมโค้งของการ์ดย่อย
                          side: BorderSide(color: Colors.black, width: 2), // เส้นขอบสีดำ
                        ),
                        color: Colors.white, // พื้นหลังการ์ดย่อย
                        elevation: 0, // ไม่มีเงา
                        child: Padding(
                          padding: const EdgeInsets.all(16.0), // Padding ภายในการ์ดย่อย
                          child: Column( // ใช้ Column เพื่อจัดแนว
                            crossAxisAlignment: CrossAxisAlignment.start, // จัดให้แนวซ้าย
                            children: [
                              // เพิ่มข้อความที่ต้องการแสดงก่อนรูป
                              Text(
                                'sender1',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '0234566543',
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(height: 10), // ระยะห่างระหว่างข้อความกับรูปภาพ
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
                              SizedBox(height: 10), // ระยะห่างระหว่างข้อความและปุ่ม
                              
                              // ปุ่มเช็คสถานะ
                              Align(
                                alignment: Alignment.centerRight, // จัดให้อยู่ทางขวา
                                child: ElevatedButton(
                                  onPressed: () {
                                    // ใส่ฟังก์ชันที่ต้องการทำเมื่อกดปุ่ม
                                    print("Check status for sender1");
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red, // สีพื้นหลังของปุ่ม
                                  ),
                                  child: Text('เช็คสถานะ', style: TextStyle(color: Colors.white)), // ข้อความในปุ่ม
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 40), // ระยะห่างระหว่างการ์ดย่อย

                    // การ์ดย่อยใบที่ 2
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9, // ตั้งค่าความกว้างของการ์ด (90% ของหน้าจอ)
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // มุมโค้งของการ์ดย่อย
                          side: BorderSide(color: Colors.black, width: 2), // เส้นขอบสีดำ
                        ),
                        color: Colors.white, // พื้นหลังการ์ดย่อย
                        elevation: 0, // ไม่มีเงา
                        child: Padding(
                          padding: const EdgeInsets.all(16.0), // Padding ภายในการ์ดย่อย
                          child: Column( // ใช้ Column เพื่อจัดแนว
                            crossAxisAlignment: CrossAxisAlignment.start, // จัดให้แนวซ้าย
                            children: [
                              // เพิ่มข้อความที่ต้องการแสดงก่อนรูป
                              Text(
                                'Sender2',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '0111123456',
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(height: 10), // ระยะห่างระหว่างข้อความกับรูปภาพ
                              Image.asset(
                                'assets/images/Breeze.png', // เปลี่ยนเป็น path ของภาพที่คุณต้องการ
                                width: 60, // กำหนดความกว้างของรูปภาพ
                                height: 60, // กำหนดความสูงของรูปภาพ
                                fit: BoxFit.cover, // ปรับขนาดให้เต็มพื้นที่
                              ),
                              SizedBox(height: 5),
                              Text(
                                'น้ํายาปรับผ้านุ่ม',
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(height: 10), // ระยะห่างระหว่างข้อความและปุ่ม
                              
                              // ปุ่มเช็คสถานะ
                              Align(
                                alignment: Alignment.centerRight, // จัดให้อยู่ทางขวา
                                child: ElevatedButton(
                                  onPressed: () {
                                    // ใส่ฟังก์ชันที่ต้องการทำเมื่อกดปุ่ม
                                    print("Check status for Sender2");
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red, // สีพื้นหลังของปุ่ม
                                  ),
                                  child: Text('เช็คสถานะ', style: TextStyle(color: Colors.white)), // ข้อความในปุ่ม
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 10), // ระยะห่างระหว่างการ์ดย่อย
                  ],
                ),
              ),
            ),
          ),
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