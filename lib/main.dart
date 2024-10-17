import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_delivery/Receiver/WaitingForRiderScreen.dart';
import 'package:flutter_delivery/Rider/rider_home_screen.dart';
import 'package:flutter_delivery/firebase_options.dart';
import 'package:flutter_delivery/pages/shared/app_data.dart';
import 'package:flutter_delivery/pages/homepage.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:get_storage/get_storage.dart';


void main() async {
  await GetStorage.init();
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => Appdata(),
      ),
    ],
    child: const MyApp(),
  ));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Delivery Application',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  DeliveryStatusScreen(),  // เปลี่ยนหน้าเริ่มต้นที่นี่
    );
  }
}
