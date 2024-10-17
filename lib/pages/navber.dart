import 'package:flutter/material.dart';
import 'package:flutter_delivery/pages/homepage.dart';
import 'package:flutter_delivery/Receiver/WaitingForRiderScreen.dart';
import 'package:flutter_delivery/Receiver/OrderTrackingScreen.dart';
import 'package:flutter_delivery/sender/RiderTrackingScreen.dart';
import 'package:flutter_delivery/sender/Product_list.dart';
import 'package:flutter_delivery/Rider/rider_home_screen.dart';
import 'package:flutter_delivery/Rider/rider_home_screen.dart';

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
      padding: const EdgeInsets.only(
          top: 0), // ลดระยะ padding เพื่อให้แถบมีขนาดเล็กลง
      child: NavigationBarTheme(
        data: NavigationBarThemeData(
          height: 60, // ปรับความสูงของแถบนำทางให้เล็กลง
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(
              color: Colors.white,
              fontSize: screenSize.width * 0.03, // ลดขนาดตัวอักษร
            ),
          ),
          indicatorColor: const Color(0xff303030),
          // indicatorShape: const CircleBorder(
          //   side: BorderSide(color: Colors.blue, width: 1.5), // ปรับขอบ indicator
          // ),
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
                navigatelogoutPage(context);
                break;
            }
          },
          destinations: [
            NavigationDestination(
              icon: Image(
                image: const AssetImage("assets/images/home.png"),
                width: 20, // ลดขนาดไอคอน
              ),
              label: 'หน้าหลัก',
            ),
            NavigationDestination(
              icon: Image(
                image: const AssetImage("assets/images/scooter-delivery.png"),
                width: 25, // ลดขนาดไอคอน
              ),
              label: 'สถานะ',
            ),
            NavigationDestination(
              icon: Image(
                image: const AssetImage("assets/images/logout.png"),
                width: 20, // ลดขนาดไอคอน
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

  void navigatelogoutPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Homepage()),
    );
  }
}
