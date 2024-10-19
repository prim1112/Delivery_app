import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void showAddItemDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white, // สีพื้นหลังของ Popup
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // มุมโค้ง
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // จัดชิดซ้ายสำหรับเนื้อหา
            mainAxisSize: MainAxisSize.min, // ใช้ขนาดตามเนื้อหา
            children: [
              // กรอบสำหรับแสดงรูปภาพ
              Container(
                height: 150, // กำหนดความสูงของกรอบแสดงรูปภาพ
                width: double.infinity, // ให้กว้างเต็มที่
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // สีของกรอบ
                    width: 1, // ความหนาของกรอบ
                  ),
                  borderRadius: BorderRadius.circular(20), // มุมโค้งของกรอบ
                ),
                child: Center(
                  child: Text(
                    '#แสดงรูปภาพ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),

              // Row สำหรับปุ่มเพิ่มรูปภาพที่อยู่ทางขวา
              Row(
                mainAxisAlignment: MainAxisAlignment.end, // จัดปุ่มไปทางขวา
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // ฟังก์ชันการเพิ่มรูปภาพหรือเนื้อหาที่ต้องการ
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // สีของปุ่ม
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // มุมโค้ง
                      ),
                    ),
                    child: Text(
                      'เพิ่มรูปภาพ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              // รายละเอียดและกล่องข้อความ
              Text(
                'รายละเอียด',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 5),
              TextField(
                decoration: InputDecoration(
                  hintText: 'กรุณาใส่รายละเอียด',
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(20), // ตั้งมุมโค้งที่ต้องการ
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                ),
                maxLines: 3, // ความสูงของช่องกรอก
              ),

              SizedBox(height: 20),

              // ปุ่มตกลงอยู่ด้านล่างตรงกลาง
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // ปิด Popup
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // สีของปุ่ม
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // มุมโค้ง
                    ),
                  ),
                  child: Text(
                    'ตกลง',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
