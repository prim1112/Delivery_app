import 'package:flutter/material.dart';
import 'package:flutter_delivery/Rider/rider_home_screen.dart';
import 'package:flutter_delivery/pages/navber.dart';

class OrderDetailsScreen extends StatefulWidget {
  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  int _selectedIndex = 0; // Initialize selected index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red, // สีพื้นหลังแดงเต็มจอ
      appBar: AppBar(
        title: Text('หน้าหลักไรเดอร์'),
        backgroundColor: Colors.red, // สีแดง AppBar
      ),
      body: SingleChildScrollView( // เปิดใช้งานการเลื่อน
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Rider Information
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rider1',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'รม 111',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '0822224433',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Sender and Receiver Information
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white, // Change background to white
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // Image of the package
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'https://example.com/path-to-image.jpg', // Replace with your image URL
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 16),
                        // Sender and Receiver Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ผู้ส่งสินค้า',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text('Sender1\n0234566543'),
                              SizedBox(height: 8),
                              Text(
                                'ผู้รับสินค้า',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text('User1\n0957654321\n871 pp iinn nnn'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    // Order Status
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ออเดอร์\nไก่ทอด+แฮมเบอ\nโค้กชิลลาซามาชิ',
                          style: TextStyle(fontSize: 16),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red, // Button color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text('รับงาน'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Additional Information (optional)
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white, // Change background to white
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'https://example.com/path-to-image.jpg', // Replace with your image URL
                        width: double.infinity,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
