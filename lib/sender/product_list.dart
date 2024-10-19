import 'package:flutter/material.dart';
import 'package:flutter_delivery/pages/navber.dart';
import 'package:flutter_delivery/sender/home_sender.dart';
import 'package:flutter_delivery/sender/popup.dart';

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
      backgroundColor: const Color(0xffd32f2f),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 80, 0, 30),
                  child: Text(
                    'รายการส่งสินค้า',
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
                borderRadius: BorderRadius.circular(30), // กำหนดมุมโค้ง
              ),
              color: Color(0xfffafafa), // ใส่สีพื้นหลัง
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // แสดงข้อมูลผู้ใช้
                    Text(
                      'user1',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text('0987654321'),
                    SizedBox(height: 8),
                    Text('899/1 vbn mkj'),
                    SizedBox(height: 20), // เพิ่มช่องว่าง

                    // ส่วนเพิ่มรายการสินค้า
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: ElevatedButton(
                            onPressed: () {
                              showAddItemDialog(
                                  context); // เรียกฟังก์ชันเพื่อแสดง dialog
                            },
                            child: Text(
                              '+เพิ่มรายการ',
                              style: TextStyle(
                                color: Color(0xFFFAFAFA),
                                fontSize: 16,
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
                    SizedBox(height: 8),

                    // รายการอาหาร 1
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15), // มุมโค้งของการ์ด
                      ),
                      elevation: 4, // ความลึกเงาของการ์ด
                      margin: EdgeInsets.symmetric(
                          vertical: 8), // เพิ่มช่องว่างระหว่างการ์ด
                      child: ListTile(
                        leading: Image.asset(
                          'assets/images/food2.png', // เปลี่ยนเป็นรูปจริงในโปรเจคของคุณ
                          width: 50,
                          height: 50,
                        ),
                        title: Text('รายละเอียด'),
                        subtitle: Text('กุ้งดองแซลม่อน'),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'ถัดไป',
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
