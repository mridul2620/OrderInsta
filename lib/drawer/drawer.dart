import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food/Login/signin.dart';
import 'package:food/drawer/contactus.dart';
import 'package:food/drawer/privacypolicy.dart';
import 'package:food/flobal_variables.dart';
import 'package:food/fonts/fonts.dart';
import 'package:food/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

class Drawer extends StatefulWidget {
  const Drawer({super.key});

  @override
  State<Drawer> createState() => _DrawerState();
}

class _DrawerState extends State<Drawer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: maincolor
          ),
          width: double.infinity,
          padding: EdgeInsets.all(20),
          color: maincolor,
          child: Center(
              child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage("url"), fit: BoxFit.fill)),
              ),
              Text(
                "Mridul Srivastava",
                style: GoogleFonts.robotoMono(
                    textStyle: softbold, color: Colors.white),
              )
            ],
          )),
        ),
               ListTile(
          leading: Icon(
            Icons.home,
          ),
          title:  Text('Home', style: GoogleFonts.josefinSans(textStyle: softbold)),
          onTap: () {
            setState(() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => homepage()));
            });
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.policy_rounded,
          ),
          title:  Text('Privacy Policy',style: GoogleFonts.josefinSans(textStyle: softbold)),
          onTap: () {
            setState(() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PrivacyPolicy()));
            });
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.add_call,
          ),
          title:  Text('Contact Us', style: GoogleFonts.josefinSans(textStyle: softbold)),
          onTap: () {
            setState(() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Contact()));
            });
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.logout_rounded,
          ),
          title:  Text('Logout', style: GoogleFonts.josefinSans(textStyle: softbold)),
          onTap: () {
            setState(() {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => PhoneAuthLoginPage()));
            });
          },
        ),
      ],
    );
  }
}
