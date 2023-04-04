// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:food/homepage.dart';
// import 'package:food/user_services.dart';
// import 'package:food/verification.dart';

// class AuthProvider with ChangeNotifier {
//   String smsOtp = "";
//   String verficationId = "";
//   String error = "";
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   UserServices _userServices = UserServices();

//   Future<void> verifyPhone(BuildContext context, String number) async {
//     final verificationCompleted = (PhoneAuthCredential credential) async {
//       await _auth.signInWithCredential(credential);
//     };
//     final PhoneVerificationFailed verificationFailed =
//         (FirebaseAuthException e) {
//       print(e.code);
//     };

//     Future<void> smsOtpDialog(BuildContext context, String number) {
//       return showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: Column(children: [
//                 Text("Verification Code"),
//                 SizedBox(
//                   height: 6,
//                 ),
//                 Text("Enter 6 digit OTP to proceed"),
//               ]),
//               content: Container(
//                 height: 85,
//                 child: TextField(
//                   textAlign: TextAlign.center,
//                   keyboardType: TextInputType.number,
//                   maxLength: 6,
//                   onChanged: (value) {
//                     this.smsOtp = value;
//                   },
//                 ),
//               ),
//               actions: [
//                 ElevatedButton(
//                     onPressed: () async {
//                       try {
//                         PhoneAuthCredential phoneAuthCredential =
//                             PhoneAuthProvider.credential(
//                                 verificationId: verficationId, smsCode: smsOtp);
//                         UserCredential result = (await _auth
//                             .signInWithCredential(phoneAuthCredential));
//                         User? user = result.user;
//                         _createUser(id: user!.uid, number: user.phoneNumber);
//                         if (user != null) {
//                           Navigator.of(context).pop();
//                           Navigator.of(context).pushReplacement(
//                               MaterialPageRoute(
//                                   builder: (Context) => homepage()));
//                         } else {
//                           print("login failed");
//                         }
//                       } catch (e) {
//                         this.error = "Invalid OTP";
//                         print(e.toString());
//                         Navigator.of(context).pop();
//                       }
//                     },
//                     child: Text("DONE"))
//               ],
//             );
//           });
//     }

//     // ignore: prefer_function_declarations_over_variables
//     final PhoneCodeSent smsOtpSend = (String verId, int? resendToken) async {
//       this.verficationId = verId;

//       smsOtpDialog(context, number);
//     };
//     try {
//       _auth.verifyPhoneNumber(
//           phoneNumber: number,
//           verificationCompleted: verificationCompleted,
//           verificationFailed: verificationFailed,
//           codeSent: smsOtpSend,
//           codeAutoRetrievalTimeout: (String verId) {
//             this.verficationId = verId;
//           });
//     } catch (e) {
//       print(e);
//     }
//   }

//   void _createUser({String? id, String? number}) {
//     _userServices.createUserData({
//       'id': id,
//       'number': number,
//     });
//   }

//   late String id;
//   late String xnumber;
//   late double latitudee;
//   late double longitudee;
//   var adress;
//   void updateUserData(String number, double xlongitude, double xlatitude,
//       String address) async {
//     final user = FirebaseAuth.instance.currentUser;
//     await FirebaseFirestore.instance.collection('users').doc(user?.uid).set({
//       'id': id,
//       'number': number,
//       'location': GeoPoint(xlatitude, xlongitude),
//       'address': address,
//     });
//   }
// }
