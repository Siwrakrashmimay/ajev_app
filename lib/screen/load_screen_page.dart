import 'dart:async';
import 'package:flutter/material.dart';

class LoadPage extends StatelessWidget {
  final Widget nextPage;
  // final UserData userData;

  const LoadPage({
    super.key,
    @required required this.nextPage,
    // required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    // print('wtf${userData.firstname}');
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => nextPage,
        // settings: RouteSettings(
        //   arguments: userData, // ส่ง userData ผ่าน arguments
        // ),
      ));
    });

    return const Scaffold(
      body: Center(
        child:
            CircularProgressIndicator(), // แสดง circular progress indicator ขณะรอ
      ),
    );
  }
}
