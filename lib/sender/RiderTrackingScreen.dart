import 'package:flutter/material.dart';
import 'package:flutter_delivery/sender/RiderTrackingScreen.dart';
import 'package:flutter_delivery/pages/navber.dart';


class RiderInfoScreen extends StatefulWidget {
  @override
  _RiderInfoScreenState createState() => _RiderInfoScreenState();
}

class _RiderInfoScreenState extends State<RiderInfoScreen> {
  int _selectedIndex = 0; // ตัวแปรเก็บตำแหน่งของปุ่มที่เลือก

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ดูข้อมูลไรเดอร์ ตำแหน่ง'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          // แผนที่ตัวอย่าง (ใช้ Container แทนชั่วคราว)
          Container(
            height: 200,
            color: Colors.grey[300],
            child: Center(
              child: Icon(
                Icons.map,
                size: 100,
                color: Colors.red,
              ),
            ),
          ),
          SizedBox(height: 10),

          // การ์ดข้อมูลไรเดอร์
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                width: double.infinity, // กำหนดให้การ์ดมีความกว้างเต็มที่
                padding: const EdgeInsets.all(7.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rider1',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text('รวย 111'),
                    SizedBox(height: 5),
                    Text('08222244433'),
                  ],
                ),
              ),
            ),
          ),

          // ข้อความสถานะ
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'สถานะ :',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text('ไรเดอร์รับสินค้าแล้ว กำลังเดินทาง'),
              ],
            ),
          ),

          Spacer(),

          // ปุ่มย้อนกลับ
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft, // จัดตำแหน่งไปทางซ้าย
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // ย้อนกลับไปยังหน้าก่อนหน้า
                },
                child: Text('ย้อนกลับ'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: Size(100, 40), // ปรับขนาดของปุ่มให้เล็กลง
                ),
              ),
            ),
          ),
        ],
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