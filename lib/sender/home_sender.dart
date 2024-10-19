import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_delivery/pages/navber.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

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
                  // แสดงรูปภาพที่ดึงมาจาก Firestore เป็นวงกลม
                  if (recipientData?['image'] != null)
                    ClipOval(
                      child: Image.network(
                        recipientData!['image'],
                        width: screenSize.width * 0.19,
                        height: screenSize.height * 0.10,
                        fit: BoxFit.cover,
                      ),
                    ),
                  SizedBox(width: 10), // เพิ่มระยะห่างเล็กน้อยระหว่างรูปกับข้อความ
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // แสดงชื่อผู้รับ
                      Text(
                        recipientData?['name'] ?? 'ไม่พบชื่อ',
                        style: const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      // แสดงหมายเลขโทรศัพท์
                      Text(
                        recipientData?['phone'] ?? 'ไม่พบเบอร์',
                        style: const TextStyle(fontSize: 16, color: Colors.black),
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
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: Colors.red, width: 2.0),
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

  if (phoneNumber.isNotEmpty) {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('user') // เปลี่ยนชื่อ collection ตามที่คุณใช้
          .where('phone', isEqualTo: phoneNumber)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        setState(() {
          recipientData = querySnapshot.docs.first.data() as Map<String, dynamic>;
          nameCtl.text = recipientData?['name'] ?? ''; // ใช้ null-aware operator
          phoneCtl.text = recipientData?['phone'] ?? '';
          recipientimage = recipientData?['image'];
        });
      } else {
        setState(() {
          recipientData = null;
          _showNotFoundMessage(); // เพิ่มฟังก์ชันเมื่อไม่พบข้อมูล
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}

// เพิ่มฟังก์ชันแสดงข้อความเมื่อไม่พบข้อมูล
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


  Future<void> _pickImage() async {
    // ฟังก์ชันที่ใช้ในการเลือกภาพ
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
}