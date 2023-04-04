import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food/flobal_variables.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../fonts/fonts.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.pink,
      appBar: AppBar(
        backgroundColor: kmaincolor,
        title: Text("OrderInsta",
            style: GoogleFonts.josefinSans(textStyle: boldstyle)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: kmaincolor,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
                Text("Add Items To Cart",
                    style: GoogleFonts.secularOne(
                      textStyle: boldstyle,color: maincolor
                    )),
                SizedBox(
                  height: 15,
                ),
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('res_menu')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 248.0),
                            child: SpinKitFadingCircle(
                              color: kmaincolor,
                              size: 50.0,
                            ),
                          ),
                        );
                      }
                      return ListView.builder(
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            DocumentSnapshot product =
                                snapshot.data!.docs[index];
                            return Container(
                              color: Colors.white,
                              child: InkWell(
                                onTap: () {}, //navigateToDetail(doc[index]),
                                child: Column(
                                  children: [
                                    ListTile(
                                      
                                      title: Text(product['name'],
                                          style: GoogleFonts.secularOne(
                                            textStyle: normalstyle,
                                          )),
                                      subtitle: Text(
                                          "₹ " + (product['price']).toString(),
                                          style: GoogleFonts.secularOne(
                                            textStyle: softnormal,
                                          )),
                                      trailing: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: kmaincolor),
                                          onPressed: () {},
                                          child: Text(
                                            "Add To cart",
                                            style: GoogleFonts.secularOne(
                                                textStyle: softnormal,
                                                color: maincolor),
                                          )),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
