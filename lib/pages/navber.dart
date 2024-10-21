import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_delivery/pages/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_delivery/pages/sender_or_receiver.dart';
import 'package:flutter_delivery/pages/shared/app_data.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onDestinationSelected;
  final Size screenSize;
  

  const CustomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.screenSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: NavigationBarTheme(
        data: NavigationBarThemeData(
          height: 60,
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(
              color: Colors.white,
              fontSize: screenSize.width * 0.03,
            ),
          ),
          indicatorColor: const Color(0xff303030),
        ),
        child: NavigationBar(
          backgroundColor: const Color(0xff303030),
          selectedIndex: selectedIndex,
          onDestinationSelected: (int index) {
            onDestinationSelected(index);
            switch (index) {
              case 0:
                navigateHomePage(context);
                break;
              case 1:
                navigatestatusPage(context);
                break;
              case 2:
                confirmLogout(context); // Changed function name here
                break;
            }
          },
          destinations: [
            NavigationDestination(
              icon: Image(
                image: const AssetImage("assets/images/home.png"),
                width: 20,
              ),
              label: 'หน้าหลัก',
            ),
            NavigationDestination(
              icon: Image(
                image: const AssetImage("assets/images/scooter-delivery.png"),
                width: 25,
              ),
              label: 'สถานะ',
            ),
            NavigationDestination(
              icon: Image(
                image: const AssetImage("assets/images/logout.png"),
                width: 20,
              ),
              label: 'ออกจากระบบ',
            ),
          ],
        ),
      ),
    );
  }

  void navigateHomePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Homepage()),
    );
  }

  void navigatestatusPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Homepage()),
    );
  }



// void confirmLogout(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text('ออกจากระบบ'),
//         content: const Text('คุณต้องการออกจากระบบหรือไม่?'),
//         actions: <Widget>[
//           TextButton(
//             child: const Text('ยกเลิก'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           TextButton(
//             child: const Text('ยืนยัน'),
//             onPressed: () async {
//               final appData = Provider.of<Appdata>(context, listen: false); // ใช้ Provider เพื่อเข้าถึง Appdata
//               await appData.showLogoutDialog(false); // อัปเดตสถานะล็อกอินเป็น false

//               await FirebaseAuth.instance.signOut(); // ล็อกเอาต์จาก Firebase
              
//               // ใช้ GetX เพื่อไปยัง Homepage
//               Get.to(() => const Homepage());
//             },
//           ),
//         ],
//       );
//     },
//   );
// }

void confirmLogout(BuildContext context) {
  showLogoutDialog(context); // เรียกใช้ showLogoutDialog โดยตรง
}









}
