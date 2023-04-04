import 'package:flutter/material.dart';
import 'package:food/location_provider.dart';
import 'package:food/login.dart';
import 'package:food/map_screen.dart';
//import 'package:food/signup.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  final String phnumber;
  WelcomeScreen(@required this.phnumber);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState(this.phnumber);
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String phnumber = "";
  _WelcomeScreenState(this.phnumber);
  @override
  Widget build(BuildContext context) {

    final locationData = Provider.of<LocationProvider>(context, listen: false);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 75, left: 15,right: 15),
        child: Column(
          children: [
            Expanded(child: LoginPage()),
            Text(
              "Ready to order?",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              child: ElevatedButton(
                  child: locationData.loading
                      ? CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : Text(
                          "Set Delivery Location",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1f1545)),
                  onPressed: () async {
                    setState(() {
                      locationData.loading = true;
                    });
                    await locationData.getCurrentPosition();
                    if (locationData.permissionAllowed == true) {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => MapScreen(phnumber)));
                      setState(() {
                        locationData.loading = false;
                      });
                    } else {
                      print("Permission not allowed");
                      setState(() {
                        locationData.loading = false;
                      });
                    }
                  }),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text(
            //       'Already have an account?',
            //       style: TextStyle(color: Colors.grey.shade700),
            //     ),
            //     SizedBox(
            //       width: 5,
            //     ),
            //     InkWell(
            //       onTap: () {
            //         Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //                 builder: (context) =>
            //                     const RegisterWithPhoneNumber()));
            //       },
            //       child: Text(
            //         'Login',
            //         style: TextStyle(color: Colors.black),
            //       ),
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
