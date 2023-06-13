
import 'package:flutter/material.dart';
import 'package:flutter_phone_number_otp_ui/otp.dart';
import 'package:flutter_phone_number_otp_ui/phone.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'phone',
    routes: {
      'phone': (context) => MyPhone(),
      'otp' : (context)=> MyOTP()
    },
  ));
}

