import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_delivery/pages/homepage.dart';
import 'package:flutter_delivery/pages/login.dart';
import 'package:flutter_delivery/pages/shared/app_data.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:developer';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class User_registerPage extends StatefulWidget {
  const User_registerPage({super.key});

  @override
  State<User_registerPage> createState() => _User_registerPageState();
}

class _User_registerPageState extends State<User_registerPage> {
  TextEditingController nameCtl = TextEditingController();
  TextEditingController phoneCtl = TextEditingController();
  TextEditingController addressCtl = TextEditingController();
  TextEditingController passwordCtl = TextEditingController();
  TextEditingController confirmPasswordCtl = TextEditingController();
  var db = FirebaseFirestore.instance;
  XFile? image;
  String url = '';

  LatLng latLng = const LatLng(16.246825669508297, 103.25199289277295);
  MapController mapController = MapController();

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    log(latLng.toString());
    latLng = context.read<Appdata>().latLng;
    log(latLng.toString());
    currentMap();
  }

  @override
  Widget build(BuildContext context) {
    // ใช้ MediaQuery เพื่อตรวจสอบความสูงของหน้าจอ
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffd32f2f),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: SizedBox(
                  width: double.infinity, // ขยายเต็มความกว้างของหน้าจอ
                  height:
                      screenHeight * 1, // ปรับความสูงตามความสูงของหน้าจอ (60%)
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // กำหนดมุมโค้ง
                    ),
                    color: const Color(0xfffafafa), // ใส่สีพื้นหลัง
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment
                            .start, // จัดให้ทุกอย่างอยู่ตรงกลางในแนวตั้ง
                        crossAxisAlignment: CrossAxisAlignment
                            .center, // จัดให้อยู่ตรงกลางในแนวนอน
                        children: [
                          const Text(
                            'สมัครสมาชิก',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(0),
                                child: SizedBox(
                                  width: 100, // กำหนดความกว้างที่ต้องการ
                                  height: 100, // กำหนดความสูงที่ต้องการ
                                  child: ClipOval(
                                    child: (image != null)
                                        ? Image.file(
                                            File(image!.path),
                                            fit: BoxFit.cover,
                                          )
                                        : Image.asset(
                                            context
                                                .read<Appdata>()
                                                .imageDefaltUser,
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 50, 0, 0),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    // Navigator.of(context).pop();
                                    final ImagePicker picker = ImagePicker();
                                    image = await picker.pickImage(
                                        source: ImageSource.gallery);
                                    if (image != null) {
                                      log(image!.path);
                                      setState(() {});
                                    }
                                  },
                                  child: Text(
                                    'เพิ่มโปรไฟล์',
                                    style: TextStyle(
                                      color: Color(0xFFFAFAFA),
                                      fontSize: 13,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor:
                                        const Color.fromARGB(255, 0, 0, 0),
                                    backgroundColor: Color(0xffd32f2f),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 20, 50, 0),
                                child: Text(
                                  'ชื่อ นามสกุล',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: SizedBox(
                              height: 30, // กำหนดความสูงของ TextField
                              child: TextField(
                                controller: nameCtl,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(30), // ขอบโค้ง
                                    borderSide: const BorderSide(
                                        color: Colors.red,
                                        width: 2), // ขอบสีแดงเมื่อโฟกัส
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(30), // ขอบโค้ง
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(
                                          255, 255, 17, 0), // ขอบสีแดง
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 10, 50, 0),
                                child: Text(
                                  'เบอร์โทร',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: SizedBox(
                              height: 30, // กำหนดความสูงของ TextField
                              child: TextField(
                                controller: phoneCtl,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(30), // ขอบโค้ง
                                    borderSide: const BorderSide(
                                        color: Colors.red,
                                        width: 2), // ขอบสีแดงเมื่อโฟกัส
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(30), // ขอบโค้ง
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(
                                          255, 255, 17, 0), // ขอบสีแดง
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 10, 50, 0),
                                child: Text(
                                  'รายละเอียดที่อยู่',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: SizedBox(
                              height: 30, // กำหนดความสูงของ TextField
                              child: TextField(
                                controller: addressCtl,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(30), // ขอบโค้ง
                                    borderSide: const BorderSide(
                                        color: Colors.red,
                                        width: 2), // ขอบสีแดงเมื่อโฟกัส
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(30), // ขอบโค้ง
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(
                                          255, 255, 17, 0), // ขอบสีแดง
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return StatefulBuilder(
                                          builder: (BuildContext context,
                                              StateSetter setState) {
                                            return Dialog(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0), // มุมโค้ง
                                              ),
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.8,
                                                padding:
                                                    const EdgeInsets.all(16.0),
                                                child: Column(
                                                  children: [
                                                    Expanded(
                                                      child: FlutterMap(
                                                        mapController:
                                                            mapController,
                                                        options: MapOptions(
                                                          initialCenter:
                                                              latLng, // กำหนดตำแหน่งเริ่มต้น
                                                          initialZoom: 15.0,
                                                          onTap: (tapPosition,point) {
                                                            setState(() {latLng = point;
                                                              log(latLng.toString());
                                                            });
                                                            mapController.move(
                                                                latLng,mapController.camera.zoom);
                                                          },
                                                        ),
                                                        children: [
                                                          TileLayer(
                                                            urlTemplate:
                                                                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                                            userAgentPackageName:
                                                                'com.example.app',
                                                            maxNativeZoom: 19,
                                                          ),
                                                          MarkerLayer(
                                                            markers: [
                                                              Marker(
                                                                point:
                                                                    latLng, // ใช้ตำแหน่งใหม่ที่ถูกอัปเดต
                                                                width: 40,
                                                                height: 40,
                                                                child:
                                                                    const Icon(
                                                                  Icons
                                                                      .motorcycle,
                                                                  size: 30,
                                                                  color: Colors
                                                                      .red,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: setMap,
                                                      child: const Text(
                                                        'ยืนยันตำแหน่ง',
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255), // สีของข้อความในปุ่ม
                                                          fontWeight: FontWeight
                                                              .bold, // ทำให้ข้อความเป็นตัวหนา
                                                        ),
                                                      ),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            const Color(
                                                                0xffd32f2f), // สีพื้นหลังของปุ่ม
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                  child: const Text(
                                    '+ ที่อยู่',
                                    style: TextStyle(
                                      color: Color(0xFFFAFAFA),
                                      fontSize: 16,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor:
                                        const Color.fromARGB(255, 0, 0, 0),
                                    backgroundColor: const Color(0xffd32f2f),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 10, 50, 0),
                                child: Text(
                                  'รหัสผ่าน',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                            child: SizedBox(
                              height: 30, // กำหนดความสูงของ TextField
                              child: TextField(
                                controller: passwordCtl,
                                obscureText: true,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(30), // ขอบโค้ง
                                    borderSide: const BorderSide(
                                        color: Colors.red,
                                        width: 2), // ขอบสีแดงเมื่อโฟกัส
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(30), // ขอบโค้ง
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(
                                          255, 255, 17, 0), // ขอบสีแดง
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 20, 50, 0),
                                child: Text(
                                  'ยืนยันรหัสผ่าน',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                            child: SizedBox(
                              height: 30, // กำหนดความสูงของ TextField
                              child: TextField(
                                controller: confirmPasswordCtl,
                                obscureText: true,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(30), // ขอบโค้ง
                                    borderSide: const BorderSide(
                                        color: Colors.red,
                                        width: 2), // ขอบสีแดงเมื่อโฟกัส
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(30), // ขอบโค้ง
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(
                                          255, 255, 17, 0), // ขอบสีแดง
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(20),
                                child: ElevatedButton(
                                  onPressed: register,
                                  child: Text(
                                    'สมัครสมาชิก',
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'หากมีบัญชีอยู่แล้ว',
                                style: TextStyle(fontSize: 12), // ลดขนาดฟอนต์
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: TextButton(
                                  onPressed: login,
                                  child: const Text(
                                    'เข้าสู่ระบบ',
                                    style: TextStyle(
                                      fontSize: 14, // ขนาดฟอนต์ของปุ่ม
                                      color: Color.fromARGB(255, 255, 0, 0),
                                    ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Homepage(),
        ));
  }

  setMap() async {
    // บันทึกตำแหน่งปัจจุบันที่เลือกและปิด popup
    context.read<Appdata>().latLng = latLng;
    Navigator.of(context).pop();
    setState(() {});
  }

  currentMap() async {
    try {
      var position = await _determinePosition();
      setState(() {
        //อัพเดตตำแหน่งปัจจุบัน
        latLng = LatLng(position.latitude, position.longitude);
        isLoading = false;
        mapController.move(latLng, mapController.camera.zoom);
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      log('Error: $e');
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  // ฟังก์ชันสำหรับสมัครสมาชิก
  Future<void> registerNewUser() async {
    int newUserId = await generateNewUserId();
    String? pathImage;
    if (image != null) {
      pathImage = await uploadImage(image!); // ใช้ await เพื่อรอ URL ของภาพ
    } else {
      pathImage = null; // ใช้ภาพที่มีอยู่แล้วถ้าไม่ได้เปลี่ยน
    }
    var data = {
      'uid': newUserId,
      'name': nameCtl.text,
      'phone': phoneCtl.text,
      'address': addressCtl.text,
      'latLng': {'latitude': latLng.latitude, 'longitude': latLng.longitude},
      'password': passwordCtl.text,
      'image': pathImage,
    };

    await db.collection('user').doc(newUserId.toString()).set(data);
    log('สมัครสมาชิกสำเร็จ, ID: $newUserId');

    // นำทางไปที่ SenderPage หลังจากสมัครสมาชิกสำเร็จ
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  void register() async {
    // ตรวจสอบข้อมูลการลงทะเบียนก่อน
    if (nameCtl.text.isEmpty ||
        phoneCtl.text.isEmpty ||
        passwordCtl.text.isEmpty ||
        addressCtl.text.isEmpty ||
        image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('คุณกรอกข้อมูลไม่ครบ')),
      );
    } else if (phoneCtl.text.length < 10 ||
        !RegExp(r'^[0-9]+$').hasMatch(phoneCtl.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('หมายเลขโทรศัพท์ของคุณไม่ถูกต้อง')),
      );
    } else if (nameCtl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('ชื่อผู้ใช้ของคุณไม่ถูกต้อง')),
      );
    } else if (passwordCtl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('รหัสผ่านไม่ถูกต้อง')),
      );
    } else if (passwordCtl.text != confirmPasswordCtl.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('รหัสผ่านและยืนยันรหัสผ่านไม่ตรงกัน')),
      );
    } else {
      // ตรวจสอบว่าหมายเลขโทรศัพท์ซ้ำในทั้งสองคอลเล็กชัน
      QuerySnapshot userSnapshot = await db
          .collection('user')
          .where('phone', isEqualTo: phoneCtl.text)
          .get();

      QuerySnapshot riderSnapshot = await db
          .collection('rider')
          .where('phone', isEqualTo: phoneCtl.text)
          .get();

      if (userSnapshot.docs.isNotEmpty || riderSnapshot.docs.isNotEmpty) {
        // ถ้าพบหมายเลขโทรศัพท์ซ้ำ
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('หมายเลขโทรศัพท์นี้ถูกใช้ไปแล้ว')),
        );
      } else {
        // ถ้าไม่มีหมายเลขโทรศัพท์ซ้ำ ให้ดำเนินการลงทะเบียน
        await registerNewUser(); // เรียกฟังก์ชันการลงทะเบียนใหม่
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('การลงทะเบียนเสร็จสมบูรณ์')),
        );
      }
    }
  }

  Future<int> generateNewUserId() async {
    QuerySnapshot querySnapshot = await db
        .collection('user')
        .orderBy('uid', descending: true)
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      int lastId = querySnapshot.docs.first['uid'];
      return lastId + 1;
    } else {
      return 1;
    }
  }

  Future<String> uploadImage(XFile image) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

    // ใช้ชื่อไฟล์จาก timestamp ที่ไม่ซ้ำกัน
    Reference ref = storage.ref().child("images/$uniqueFileName.jpg");
    UploadTask uploadTask = ref.putFile(File(image.path));

    // รอให้การอัปโหลดเสร็จสิ้นแล้วดึง URL มา
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
