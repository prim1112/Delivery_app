import 'package:flutter/material.dart';
import 'package:flutter_delivery/sender/RiderWaitingScreen.dart';

class DeliveryStatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เช็คสถานะการจัดส่ง'),
        backgroundColor: Colors.red, // สีแดงตามภาพ
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DeliveryCard(
              username: 'user1',
              phone: '0987654321',
              address: 'จัดส่งในเขต\nใกล้คลองสาน',
              imageUrl: 'https://via.placeholder.com/150', // ใส่ URL รูปจริงที่ต้องการ
            ),
            SizedBox(height: 10),
            DeliveryCard(
              username: 'user2',
              phone: '1234567890',
              address: '#ชอบมาก',
              imageUrl: 'https://via.placeholder.com/150', // ใส่ URL รูปจริงที่ต้องการ
            ),
          ],
        ),
      ),
    );
  }
}

class DeliveryCard extends StatelessWidget {
  final String username;
  final String phone;
  final String address;
  final String imageUrl;

  DeliveryCard({
    required this.username,
    required this.phone,
    required this.address,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // ลดขนาดฟอนต์
                  ),
                  SizedBox(height: 5),
                  Text(
                    phone,
                    style: TextStyle(fontSize: 14), // ลดขนาดฟอนต์
                  ),
                  SizedBox(height: 5),
                  Text(
                    address,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]), // ลดขนาดฟอนต์
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // ปุ่มสีแดง
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'เช็คสถานะ',
                style: TextStyle(color: Colors.white, fontSize: 12), // ลดขนาดฟอนต์ปุ่ม
              ),
            ),
          ],
        ),
      ),
    );
  }
}
