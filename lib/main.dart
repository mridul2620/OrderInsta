import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:food/homepage.dart';
import 'package:food/location_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food/map_screen.dart';
import 'package:food/screens/profile/edit%20profile/user_prefs.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Login/signin.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized(); 
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await UserPreferences.init();
  await dotenv.load(fileName: "assets/.env");
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? mobileNumber = prefs.getString('phone_number');
  runApp(MaterialApp( 
    home: MultiProvider(
      providers: [
        ChangeNotifierProvider<LocationProvider>(
            create: (context) => LocationProvider()),
      ],
      child: MyApp(mobileNumber: mobileNumber),
    ),
  ));
}

class MyApp extends StatelessWidget {
  final String? mobileNumber;

  MyApp({required this.mobileNumber});

  @override
  Widget build(BuildContext context) {
     if (mobileNumber == null) {
      return MaterialApp(home: PhoneAuthLoginPage(),);
    } else {
      return MaterialApp(home: homepage());
    }
  }
    }
