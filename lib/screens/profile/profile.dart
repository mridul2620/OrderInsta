import 'package:contactus/contactus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/Login/signin.dart';
import 'package:food/chatbot/bot.dart';
import 'package:food/chatbot/chat_screen.dart';
import 'package:food/diagrams.dart';
import 'package:food/drawer/contactus.dart';
import 'package:food/drawer/privacypolicy.dart';
import 'package:food/flobal_variables.dart';
import 'package:food/fonts/fonts.dart';
import 'package:food/homepage.dart';
import 'package:food/screens/grocery.dart';
import 'package:google_fonts/google_fonts.dart';
import 'edit profile/editprofile.dart';
import 'edit profile/profile_widger.dart';
import 'edit profile/user_model.dart';
import 'edit profile/user_prefs.dart';
import 'package:animate_do/animate_do.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();

    return Scaffold(
      backgroundColor: themecolor,
      body: FadeInDown(
        delay: const Duration(milliseconds: 300),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            //color: themecolor,
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 103, 222, 243),
                Color.fromARGB(255, 118, 39, 134),
                Color.fromARGB(255, 144, 129, 178),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20, right: 8, left: 8),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                ProfileWidget(
                  imagePath: user.imagePath,
                  onClicked: () async {
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => EditProfilePage()),
                    );
                    setState(() {});
                  },
                ),
                const SizedBox(height: 24),
                buildName(user),
                const SizedBox(height: 48),
                Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: BorderSide(color: kmaincolor, width: 1)),
                  color: kmaincolor.withOpacity(0.6),
                  child: Column(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: Center(
                              child: Text(
                            "Your Orders",
                            style: GoogleFonts.secularOne(
                                textStyle: softbold,
                                fontSize: 20,
                                color: maincolor),
                          )),
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          'Food Orders',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        leading: Icon(
                          Icons.fastfood,
                          color: Colors.white,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => homepage()));
                        },
                      ),
                      ListTile(
                        title: const Text(
                          'Grocery Orders',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        leading: Icon(
                          CupertinoIcons.cart_fill,
                          color: Colors.white,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Grocery()));
                        },
                      ),
                      ListTile(
                        title: const Text(
                          'Diagrams',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        leading: Icon(
                          CupertinoIcons.cart_fill,
                          color: Colors.white,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Diagram()));
                        },
                      ),
                      ListTile(
                        title: const Text(
                          'Change Address',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        leading: Icon(
                          CupertinoIcons.location_circle_fill,
                          color: Colors.white,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => homepage()));
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Divider(
                  color: maincolor,
                  thickness: 2,
                ),
                const SizedBox(
                  height: 15,
                ),
                Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: BorderSide(color: kmaincolor, width: 1)),
                  color: kmaincolor.withOpacity(0.6),
                  child: Column(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: Center(
                              child: Text(
                            "More",
                            style: GoogleFonts.secularOne(
                                textStyle: softbold,
                                fontSize: 20,
                                color: maincolor),
                          )),
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          'Contact us',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        leading: Icon(
                          Icons.contact_mail,
                          color: Colors.white,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Contact()));
                        },
                      ),
                      ListTile(
                        title: const Text(
                          'Privacy Policy',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        leading: Icon(
                          Icons.policy_rounded,
                          color: Colors.white,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PrivacyPolicy()));
                        },
                      ),
                      ListTile(
                        title: const Text(
                          'Chat With Us',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        leading: Icon(
                          Icons.message_rounded,
                          color: Colors.white,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatPage()));
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Divider(
                  color: maincolor,
                  thickness: 2,
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: kmaincolor),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PhoneAuthLoginPage()));
                    },
                    child: Text(
                      "LOGOUT",
                      style: GoogleFonts.secularOne(
                          textStyle: softbold, color: maincolor),
                    )),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(user.name, style: GoogleFonts.josefinSans(textStyle: boldstyle)),
          const SizedBox(height: 4),
          Text(user.email,
              style: GoogleFonts.josefinSans(
                  textStyle: softnormal, color: maincolor))
        ],
      );
}
