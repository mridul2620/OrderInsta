import 'package:flutter/material.dart';
import 'package:contactus/contactus.dart';
import 'package:food/flobal_variables.dart';
import 'package:food/homepage.dart';


class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: kmaincolor,
        body: Padding(
          padding: const EdgeInsets.only(left:15.0, right: 15, top:120),
          child: ContactUs(
            textColor: Colors.teal,
            companyColor: Colors.white,
            cardColor: Colors.white,
            taglineColor: Colors.white,
            logo: AssetImage('images/logo.jpeg'),
            email: 'mridulsrivastava6969@gmail.com',
            companyName: 'OderInsta',
            phoneNumberText: '+91 9793711706',
            phoneNumber: '+919793711706',
            dividerThickness: 2,
            //website: 'https://deft-klepon-fbee7c.netlify.app/',
            tagLine: 'Developers',
          ),
        ),
      ),
    );
  }
}
