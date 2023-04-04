import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food/flobal_variables.dart';
import 'package:food/homepage.dart';
import 'package:food/welcomescreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../fonts/fonts.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class PhoneAuthLoginPage extends StatefulWidget {
  @override
  _PhoneAuthLoginPageState createState() => _PhoneAuthLoginPageState();
}

class _PhoneAuthLoginPageState extends State<PhoneAuthLoginPage> {
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _smsCodeController = TextEditingController();
  late String _verificationId;
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController countryController = TextEditingController();
  String number = "";
  String code = "";

  @override
  void initState() {
    countryController.text = "+91";
    initialization();
    super.initState();
  }

  void initialization() async {
    FlutterNativeSplash.remove();
  }

  Future<void> _sendCodeToPhoneNumber() async {
    final PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      await _auth.signInWithCredential(phoneAuthCredential);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => homepage()));
    };

    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      print(
          'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
    };

    codeSent(String verificationId, [int? forceResendingToken]) async {
      _verificationId = verificationId;
    }

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      _verificationId = verificationId;
    };

    try {
      await _auth.verifyPhoneNumber(
          phoneNumber:
              '${countryController.text + _phoneNumberController.text}',
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
          timeout: Duration(seconds: 60));
    } catch (e) {
      print('Error sending code to phone number: $e');
    }
  }

  Future<void> _signInWithPhoneNumberAndSmsCode() async {
    final PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: code,
    );

    try {
      await _auth.signInWithCredential(credential);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: ((context) => WelcomeScreen(number))));
    } catch (e) {
      print('Error signing in with phone number: $e');
    }
  }

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: //GoogleFonts.secularOne(textStyle: normalstyle, color: maincolor),
        TextStyle(fontSize: 20, color: maincolor, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: maincolor),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: themecolor,
        padding: EdgeInsets.all(12),
        //margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/img1.png',
                width: 150,
                height: 150,
              ),
              SizedBox(
                height: 10,
              ),
              Text("You need to login with your phone before getting started!",
                  style: GoogleFonts.robotoMono(
                      textStyle: softbold, color: maincolor),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    SizedBox(
                      width: 40,
                      child: TextField(
                        style: GoogleFonts.secularOne(
                            textStyle: normalstyle, color: maincolor),
                        controller: countryController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Text(
                      "|",
                      style: TextStyle(fontSize: 33, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Form(
                      key: _formKey,
                      child: TextField(
                        style: GoogleFonts.secularOne(
                            textStyle: normalstyle, color: maincolor),
                        controller: _phoneNumberController,
                        onChanged: (value) {
                          number = code + value;
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Phone",
                        ),
                      ),
                    ))
                    // Form(
                    //   key: _formKey,
                    //   child: TextField(
                    //     controller: _phoneNumberController,
                    //     decoration: InputDecoration(
                    //       hintText: 'Enter your Phone Number with your country code',
                    //     ),
                    //     onChanged: (value) {

                    //     },
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: maincolor),
                child: Text(
                  'Send Code',
                  style: GoogleFonts.secularOne(
                      textStyle: normalstyle,
                      color: Color.fromARGB(237, 35, 18, 6)),
                ),
                onPressed: _sendCodeToPhoneNumber,
              ),
              SizedBox(
                height: 15,
              ),
              Pinput(
                defaultPinTheme: defaultPinTheme,
                length: 6,
                showCursor: true,
                onChanged: (value) {
                  code = value;
                },
                onCompleted: (pin) => print(pin),
              ),
              SizedBox(
                height: 20,
              ),

              // Padding(
              //   padding: EdgeInsets.all(16.0),
              //   child: TextField(
              //     controller: _smsCodeController,
              //     decoration: InputDecoration(
              //       hintText: 'SMS Code',
              //     ),
              //   ),
              // ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: maincolor),
                child: Text('Sign In',
                    style: GoogleFonts.secularOne(
                        textStyle: normalstyle,
                        color: Color.fromARGB(237, 35, 18, 6))),
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setString(
                      'phone_number', _phoneNumberController.text);
                  _signInWithPhoneNumberAndSmsCode();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
