import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food/flobal_variables.dart';
import 'package:food/homepage.dart';
import 'package:food/location_provider.dart';
//import 'package:food/signup.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MapScreen extends StatefulWidget {
  final String phnumber;
  MapScreen(@required this.phnumber);

  @override
  State<MapScreen> createState() => _MapScreenState(this.phnumber);
}

class _MapScreenState extends State<MapScreen> {
  String phnumber = "";
  _MapScreenState(this.phnumber);
  late LatLng currentLocation;
  late GoogleMapController _mapController;
  bool _locating = false;
  bool _loggedIn = false;
  TextEditingController _controller = TextEditingController();
  String address = "";
  CollectionReference _reference =
      FirebaseFirestore.instance.collection('users');
  String adress = "";
  final _formKey = GlobalKey<FormState>();
  Future<void> saveadress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('address', this.address);
  }

  // @override
  // void initState() {
  //   getCurrentUser();
  //   super.initState();
  // }

  // void getCurrentUser() {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user != null) {
  //     setState(() {
  //       _loggedIn = true;
  //       user = FirebaseAuth.instance.currentUser;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final locationData = Provider.of<LocationProvider>(context);
    setState(() {
      currentLocation = LatLng(locationData.latitude, locationData.longitude);
      latitudee = locationData.latitude;
      longitudee = locationData.longitude;
    });

    void onCreated(GoogleMapController controller) {
      setState(() {
        _mapController = controller;
      });
    }

    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          GoogleMap(
            initialCameraPosition:
                CameraPosition(target: currentLocation, zoom: 14),
            zoomControlsEnabled: false,
            minMaxZoomPreference: MinMaxZoomPreference(1.5, 15),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            mapType: MapType.normal,
            mapToolbarEnabled: true,
            onCameraMove: (CameraPosition position) {
              setState(() {
                _locating = true;
              });
              locationData.onCameraMove(position);
            },
            onMapCreated: onCreated,
            onCameraIdle: () {
              setState(() {
                _locating = false;
              });
              locationData.getMoveCamera();
            },
          ),
          Center(
              child: Container(
                  height: 50,
                  margin: EdgeInsets.only(bottom: 40),
                  child: Image.asset("images/marker.png"))),
          // SingleChildScrollView(
            //scrollDirection: Axis.vertical,
            //child: 
            Positioned(
              bottom: 0.0,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  //height: 200,
                  //height: MediaQuery.of(context).size.height*.33,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white70,
                  child: Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 20, top: 10),
                              child: TextButton.icon(
                                  onPressed: (() {}),
                                  icon: Icon(Icons.location_searching),
                                  label: Text(
                                      _locating
                                          ? "Locating..."
                                          : locationData
                                                  .selectedAddress?.featureName ??
                                              "",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: _locating
                                              ? Colors.red
                                              : Color(0xFF1f1545),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)))),
                          //       )),
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 10, right: 20),
                          //   child:
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Text(
                                locationData.selectedAddress?.addressLine ?? ""),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: TextField(
                              controller: _controller,
                              onChanged: (value) {
                                address = value;
                                setState(() async{
                                  saveadress();
                                });
                              },
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Name of the address",
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width - 30,
                              child: AbsorbPointer(
                                absorbing: _locating ? true : false,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: _locating
                                          ? Colors.red
                                          : Color(0xFF1f1545)),
                                  child: Text("Confirm Location",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500)),
                                  onPressed: () async {
                                    locationData.savePrefs();
                                    setState(() {
                                      adress = locationData
                                          .selectedAddress.addressLine;
                                    });
                                    try {
                                      Map<String, String> dataToSend = {
                                        'number': phnumber.toString(),
                                        'location': LatLng(latitudee, longitudee)
                                            .toString(),
                                        'adress': adress
                                      };
                                      _reference.add(dataToSend);
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const homepage()));
                                    } catch (e) {}
                                    //  } else {
                                    //    _auth.updateUserData(
                                    //        xnumber, latitudee, longitudee, adress);
                                    //  Navigator.of(context).push(
                                    //      new MaterialPageRoute(
                                    //          builder: (context) => homepage()));
                                    //}
                                  },
                                ),
                              ),
                            ),
                          )
                          // )
                        ]),
                  ),
                ),
              ),
            ),
          
        ],
      )),
    );
  }
}
