import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

late String id;
late String xnumber;
late double latitudee;
late double longitudee;
var adress;
Future addUserData(String id, int number, double xlongitude, double xlatitude,
    String address) async {
  CollectionReference _reference =
      FirebaseFirestore.instance.collection('users');
  // final user = FirebaseAuth.instance.currentUser;
  // await FirebaseFirestore.instance.collection('users').doc(user?.uid).set({
  //   'id': id,
  //   'number': number,
  //   'location': GeoPoint(xlatitude, xlongitude),
  //   'address': address,
  // });
  Map<String, String> dataToSend = {
    'id': id,
    'number': number.toString(),
    'location': GeoPoint(xlatitude, xlongitude).toString(),
    'adress': adress
  };
  _reference.add(dataToSend);
}

const maincolor = Color.fromARGB(255, 249, 249, 249);
const kmaincolor = Color(0xff444654);
const color =Color(0xFF1f1545);
const double defaultPadding = 16.0;
const themecolor = Color(0xff343541);
//Color.fromARGB(237, 35, 18, 6);

const backgroundColor = Color(0xff343541);
const botBackgroundColor = Color(0xff444654);

const apiSecretKey = "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";
