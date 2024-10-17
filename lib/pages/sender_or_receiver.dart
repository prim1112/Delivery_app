import 'package:flutter/material.dart';
import 'package:flutter_delivery/Receiver/WaitingForRiderScreen.dart';
import 'dart:developer';

import 'package:flutter_delivery/sender/home_sender.dart';

class Sender_ReceiverPage extends StatefulWidget {
  const Sender_ReceiverPage({super.key});

  @override
  State<Sender_ReceiverPage> createState() => _Sender_ReceiverPageState();
}

class _Sender_ReceiverPageState extends State<Sender_ReceiverPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffd32f2f),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 250, 0, 0),
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: SizedBox(
                  width: double.infinity, // ขยายเต็มความกว้างของหน้าจอ
                  height: screenHeight * 0.7,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    color: const Color(0xfffafafa),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 150, // ความกว้างที่ต้องการ
                                  height: 200, // ความสูงที่ต้องการ
                                  child: ElevatedButton(
                                    onPressed: sender,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 10, 60, 20),
                                          child: Text(
                                            'ผู้ส่ง',
                                            style: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Image.asset(
                                          'assets/images/approval.png',
                                          width: 150,
                                          height: 120,
                                        ),
                                        SizedBox(width: 1),
                                      ],
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor:
                                          const Color.fromARGB(255, 0, 0, 0),
                                      backgroundColor: Color(0xffffCDD2),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 150, // ความกว้างที่ต้องการ
                                  height: 200, // ความสูงที่ต้องการ
                                  child: ElevatedButton(
                                    onPressed: receiver,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 10, 60, 20),
                                          child: Text(
                                            'ผู้รับ',
                                            style: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Image.asset(
                                          'assets/images/parcel.png',
                                          width: 150,
                                          height: 120,
                                        ),
                                        SizedBox(width: 1),
                                      ],
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor:
                                          const Color.fromARGB(255, 0, 0, 0),
                                      backgroundColor: Color(0xffffecb3),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
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

  void sender() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SenderPage(),
        ));
  }

  void receiver() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DeliveryStatusScreen(),
        ));
  }
}
