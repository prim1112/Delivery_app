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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '#แสดงรูปภาพ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min, // ใช้ขนาดตามเนื้อหา
          children: [
            Text(
              'รายละเอียด',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'กรุณาใส่รายละเอียด',
                border: OutlineInputBorder(), // กรอบรอบช่องกรอก
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              ),
              maxLines: 3, // ความสูงของช่องกรอก
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // ปิด Popup
            },
            child: Text('ยกเลิก'),
          ),
          ElevatedButton(
            onPressed: () {
              // ฟังก์ชันการเพิ่มรูปภาพหรือเนื้อหาที่ต้องการ
              Navigator.of(context).pop(); // ปิด Popup
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, // สีของปุ่ม
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // มุมโค้ง
              ),
            ),
            child: Text('เพิ่มรูปภาพ'),
          ),
        ],
      );
    },
  );
}
