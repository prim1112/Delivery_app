import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_delivery/pages/navber.dart';
import 'package:flutter_delivery/pages/shared/app_data.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class SenderPage extends StatefulWidget {
  const SenderPage({super.key});

  @override
  State<SenderPage> createState() => _SenderPageState();
}

class _SenderPageState extends State<SenderPage> {
  int _selectedIndex = 1;
  TextEditingController nameCtl = TextEditingController();
  TextEditingController phoneCtl = TextEditingController();
  XFile? image;
  String? recipientimage;
  Map<String, dynamic>? recipientData;
  var searchStatus = "ยังไม่ค้นหา";
  List<dynamic> SearchList = []; // Add this line to initialize SearchList
  var Mydata;
  
  

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xffd32f2f),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 70, 0, 0),
                  child: Text(
                    'ค้นหาเบอร์ลูกค้า',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 40,
                  child: TextField(
                    controller: phoneCtl,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: _searchRecipient,
                    child: const Text(
                      'ค้นหา',
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
            
            if (recipientData != null)
              SizedBox(
                width: screenSize.width,
                height: screenSize.height * 0.20,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: screenSize.width * 0.06,
                    right: screenSize.width * 0.05,
                    top: screenSize.height * 0.03,
                  ),
                  child: Card.outlined(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              if (recipientData?['image'] != null)
                                ClipOval(
                                  child: Image.network(
                                    recipientData!['image'],
                                    width: screenSize.width * 0.19,
                                    height: screenSize.height * 0.10,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    recipientData?['name'] ?? 'ไม่พบชื่อ',
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  Text(
                                    recipientData?['phone'] ?? 'ไม่พบเบอร์',
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FilledButton(
                              onPressed: () {
                                // โค้ดที่ใช้เมื่อกดปุ่ม 'รับรายการ'
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all<Color>(
                                        Colors.white),
                                shape: WidgetStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: BorderSide(
                                        color: Colors.red, width: 2.0),
                                  ),
                                ),
                              ),
                              child: Text(
                                'รับรายการ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenSize.width * 0.04,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            // Add this section for displaying search results
            if (SearchList.isEmpty && searchStatus != "เลขมือถือตัวเอง")
              Column(
                children: [
                  SizedBox(height: Get.height / 10),
                  Center(
                      child: Image.asset(
                    context.read<Appdata>().imageUserNotFound,
                    height: Get.height / 5,
                    width: Get.width / 3.5,
                    fit: BoxFit.cover,
                  )),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Get.textTheme.headlineSmall!.fontSize!,
                    ),
                    child: Center(
                      child: Text(
                        'ไม่พบผู้ใช้ที่ค้นหา',
                        style: TextStyle(
                          fontSize: Get.textTheme.headlineSmall!.fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            else
              SingleChildScrollView(
                child: Column(
                  children: SearchList.map((users) {
                    // Check if Mydata and its latLng are not null
                    if (Mydata != null && Mydata['latLng'] != null) {
                      var MyLat = Mydata['latLng']['latitude'];
                      var MyLng = Mydata['latLng']['longitude'];

                      // Check if users and their latLng are not null
                      if (users['latLng'] != null) {
                        var otherLat = users['latLng']['latitude'];
                        var otherLng = users['latLng']['longitude'];

                        // Calculate distance only if all values are available
                        var distanceInKm = calculateDistance(MyLat, MyLng, otherLat, otherLng);
                        var distanceInMiles = distanceInKm * 0.621371;

                        // Check distance and assign distanceText
                        String distanceText;
                        if (distanceInKm >= 9999) {
                          distanceText = "${distanceInMiles.toStringAsFixed(2)} ไมล์";
                        } else if (distanceInKm < 1) {
                          var distanceInMeters = (distanceInKm * 1000).toInt(); // Convert to meters
                          distanceText = "$distanceInMeters เมตร";
                        } else {
                          distanceText = "${distanceInKm.toStringAsFixed(2)} กิโลเมตร";
                        }

                        // Calculate shipping cost
                        var shippingCost = calculateShippingCost(distanceInKm);
                        return buildProfileCard(
                          users["id"],
                          users["image"],
                          users["name"],
                          users["address"],
                          distanceText,
                          "$shippingCost บาท",
                        );
                      }
                    }

                    // Handle case where latLng is missing
                    return SizedBox(); // Or any placeholder you want to display
                  }).toList(),
                ),
              )
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        screenSize: MediaQuery.of(context).size,
      ),
    );
  }

  void _searchRecipient() async {
  String phoneNumber = phoneCtl.text;
  String currentUserPhoneNumber = context.read<Appdata>().phone; // รับเบอร์โทรศัพท์ของผู้ใช้ปัจจุบันจาก Appdata

  if (phoneNumber.isNotEmpty) {
    // ตรวจสอบว่าหมายเลขที่ค้นหาตรงกับหมายเลขของผู้ใช้ปัจจุบันหรือไม่
    if (phoneNumber == currentUserPhoneNumber) {
      setState(() {
        searchStatus = "เลขมือถือตัวเอง";
        recipientData = null;
        SearchList.clear(); // Clear SearchList
        _showOwnPhoneNumberMessage(); // แสดงข้อความแจ้งเตือน
      });
    } else {
      try {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('user') // เปลี่ยนชื่อ collection ตามที่คุณใช้
            .where('phone', isEqualTo: phoneNumber)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          setState(() {
            recipientData = querySnapshot.docs.first.data() as Map<String, dynamic>;
            nameCtl.text = recipientData?['name'] ?? '';
            phoneCtl.text = recipientData?['phone'] ?? '';
            recipientimage = recipientData?['image'];
            SearchList = querySnapshot.docs.map((doc) => doc.data()).toList();
          });
        } else {
          setState(() {
            recipientData = null;
            SearchList.clear(); // Clear SearchList if no data found
            _showNotFoundMessage(); // Show not found message
          });
        }
      } catch (e) {
        print('Error: $e');
      }
    }
  }
}

void _showOwnPhoneNumberMessage() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('ไม่สามารถค้นหาหมายเลขโทรศัพท์ของตัวเองได้'),
        content: const Text('กรุณากรอกหมายเลขโทรศัพท์ของลูกค้าเท่านั้น'),
        actions: <Widget>[
          TextButton(
            child: const Text('ตกลง'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}


  void _showNotFoundMessage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ไม่พบข้อมูล'),
          content: const Text('ไม่พบหมายเลขโทรศัพท์ที่ค้นหาในระบบ'),
          actions: <Widget>[
            TextButton(
              child: const Text('ตกลง'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  Future<String> uploadImage(XFile image) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference ref = storage.ref().child("images/$uniqueFileName.jpg");
    UploadTask uploadTask = ref.putFile(File(image.path));
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  double calculateDistance(double lat1, double lng1, double lat2, double lng2) {
    // Implement your distance calculation logic here
    return 0.0; // Replace with actual calculation
  }

  double calculateShippingCost(double distanceInKm) {
    return distanceInKm * 10; // Example cost calculation
  }

  Widget buildProfileCard(String id, String image, String name, String address,
      String distance, String shippingCost) {
    // Implement your profile card building logic here
    return Card(
      child: ListTile(
        leading: Image.network(image),
        title: Text(name),
        subtitle: Text(
            'Address: $address\nDistance: $distance\nShipping: $shippingCost'),
      ),
    );
  }
}

