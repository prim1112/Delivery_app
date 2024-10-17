import 'package:flutter/material.dart';
import 'package:flutter_delivery/Rider/order_delivery_status_screen.dart';

class OrderDeliveryStatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รับออเดอร์เสร็จแล้ว กำลังจัดส่ง'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Map section
            Container(
              height: 250,
              child: Image.network(
                'https://example.com/path-to-map-image.jpg', // Replace with your map image URL
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Update status 1
                  _buildStatusUpdateSection(
                    'ทำข้อมูลประกอบสถานะ : ไรเดอร์รับรับสินค้าครบแล้ว กำลังเดินทาง',
                  ),
                  SizedBox(height: 16),
                  // Update status 2
                  _buildStatusUpdateSection(
                    'ทำข้อมูลประกอบสถานะ : ไรเดอร์ส่งสินค้าแล้ว',
                  ),
                  SizedBox(height: 13),
                  // Cancel button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Add action for cancel button
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      ),
                      child: Text(
                        'เสร็จสิ้น',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method for status update section
  Widget _buildStatusUpdateSection(String statusText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          statusText,
          style: TextStyle(fontSize: 14), // ลดขนาดตัวอักษรลง
        ),
        SizedBox(height: 8),
        Row(
          children: [
            // Plus button styled as an oval shape with a "+" inside
            Container(
              height: 50, // ความสูงของช่อง
              width: 200, // กำหนดความกว้างของช่องให้มากขึ้น
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), // ให้มีขอบโค้งมน
                border: Border.all(color: Colors.black), // ขอบสีดำ
              ),
              child: Center(
                child: Text(
                  '+', // ใช้เครื่องหมาย + แทนไอคอน
                  style: TextStyle(
                    fontSize: 20, // ปรับขนาดตัวอักษรของ +
                    fontWeight: FontWeight.normal, // ทำให้ไม่หนา
                  ),
                ),
              ),
            ),
            SizedBox(width: 16),
            // Confirm button
            ElevatedButton(
              onPressed: () {
                // Add action for confirmation
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber, // Confirm button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text('ยืนยัน'),
            ),
          ],
        ),
      ],
    );
  }
}