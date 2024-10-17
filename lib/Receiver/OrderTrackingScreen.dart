import 'package:flutter_delivery/Receiver/OrderTrackingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_delivery/pages/navber.dart';

class OrderTrackingScreen extends StatefulWidget {
  @override
  _OrderTrackingScreenState createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  int _selectedIndex = 0; // ตัวแปรเก็บตำแหน่งของปุ่มที่เลือก

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Tracking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rider: 1',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text('รวย 111'),
                  Text('0822224433'),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Status:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text('ไรเดอร์มารับสินค้าแล้ว กำลังเดินทาง'),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // ย้อนกลับไปยังหน้าก่อนหน้า
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red, // กำหนดสีข้อความเป็นสีขาว
              ),
              child: Text('ย้อนกลับ'),
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
