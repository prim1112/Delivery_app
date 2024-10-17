import 'package:flutter/material.dart';
import 'package:flutter_delivery/pages/navber.dart';
import 'package:flutter_delivery/sender/home_sender.dart'; 


class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  int _selectedIndex = 0; // ตัวแปรเก็บตำแหน่งของปุ่มที่เลือก

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายการส่งสินค้า'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
        color: Colors.red, // สีพื้นหลังเต็มหน้า
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white, // สีพื้นหลังการ์ด
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)), // มุมโค้งที่ด้านบน
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // แสดงข้อมูลผู้ใช้
                  Text(
                    'user1',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('0987654321'),
                  SizedBox(height: 8),
                  Text('899/1 vbn mkj'),
                  SizedBox(height: 20), // เพิ่มช่องว่าง

                  // ส่วนเพิ่มรายการสินค้า
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // ฟังก์ชันที่ทำงานเมื่อกดปุ่ม
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red, // สีของปุ่ม
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30), // มุมโค้ง
                          ),
                        ),
                        child: Text(
                          '+เพิ่มรายการ',
                          style: TextStyle(fontSize: 10), // ขนาดตัวอักษรสำหรับปุ่ม
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),

                  // รายการอาหาร 1
                  ListTile(
                    leading: Image.asset(
                      'assets/images/food2.png', // เปลี่ยนเป็นรูปจริงในโปรเจคของคุณ
                      width: 50,
                      height: 50,
                    ),
                    title: Text('รายละเอียดสินค้า'),
                    subtitle: Text('กุ้งดองแซลม่อน'),
                  ),
                  Divider(),

                  // รายการอาหาร 2
                  ListTile(
                    leading: Image.asset(
                      'assets/images/food2.png',
                      width: 50,
                      height: 50,
                    ),
                    title: Text('รายละเอียดสินค้า'),
                    subtitle: Text('ไก่ทอดซอสเกาหลี'),
                  ),
                  Divider(),

                  SizedBox(height: 20),

                  // ปุ่มถัดไป
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // กำหนดการทำงานเมื่อกดปุ่ม
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SenderPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text('ถัดไป'),
                    ),
                  ),
                ],
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