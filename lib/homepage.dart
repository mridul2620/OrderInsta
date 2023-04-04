import 'package:flutter/material.dart';
import 'package:food/Login/signin.dart';
import 'package:food/screens/dining.dart';
import 'package:food/screens/grocery.dart';
import 'package:food/screens/profile/profile.dart';
import 'package:food/screens/services.dart';
import 'package:food/widgets/searchbar.dart';
import 'package:food/food/couponimages.dart';
import 'package:food/flobal_variables.dart';
import 'package:food/fonts/fonts.dart';
import 'package:food/map_screen.dart';
import 'package:food/food/featured.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'screens/home.dart';

// ignore: camel_case_types
class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

// ignore: camel_case_types
class _homepageState extends State<homepage> {
  String _location = "";
  String _adress = "";
  @override
  void initState() {
    getPrefs();
    initialization();
    super.initState();
  }

  int ind = 0;
  void _onItemTapped(int index) {
    setState(() {
      ind = index;
    });
  }

  void initialization() async {
    FlutterNativeSplash.remove();
  }

  getPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? location = prefs.getString("address");
    String? address = prefs.getString("adress");
    setState(() {
      _location = location!;
      _adress = address!;
    });
  }

  int currpage = 0;
  String number = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themecolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kmaincolor,
        elevation: 10,
        //centerTitle: true,
        title: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MapScreen(number)));
          },
          child: Row(
            children: [
              Icon(
                Icons.location_on_rounded,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      _location == null
                          ? "Adress Not Found"
                          : _location.toUpperCase(),
                      style: GoogleFonts.secularOne(
                          textStyle: softbold,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      _adress == null
                          ? "Adress Not Found"
                          : _adress.toUpperCase().toUpperCase(),
                      style: GoogleFonts.secularOne(
                          textStyle: softnormal,
                          color: Colors.white,
                          fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              child: const Icon(
                Icons.account_circle_outlined,
                color: Colors.white,
                size: 24,
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        color: kmaincolor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GNav(
            haptic: true, // haptic feedback
            tabBorderRadius: 45,
            backgroundColor: kmaincolor,
            activeColor: Colors.white,
            color: maincolor,
            tabBackgroundColor: kmaincolor,
            // Color.fromARGB(40, 215, 212, 212),
            gap: 4,
            onTabChange: (index) {
              _onItemTapped(index);
            },
            tabs: [
              GButton(icon: Icons.fastfood, text: "Food"),
              GButton(icon: Icons.restaurant, text: "Dining"),
              GButton(icon: Icons.local_grocery_store, text: "Grocery"),
              GButton(icon: Icons.person_add_alt, text: "Services"),
              //GButton(icon: Icons.subscriptions, text:"Tiffin"),
            ],
          ),
        ),
      ),

      // drawer: const Drawer(
      //   child: Drawer(),
      // ),
      body: getSelectedWidget(ind),
    );
  }

  Widget getSelectedWidget(int index) {
    Widget widget = Home();
    switch (index) {
      case 0:
        widget = Home();
        break;

      case 1:
        widget = Dining();
        break;

      case 2:
        widget = Grocery();
        break;

      default:
        widget = Services();
        break;
    }
    return widget;
  }
}
