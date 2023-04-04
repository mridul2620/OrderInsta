import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food/flobal_variables.dart';
import 'package:food/screens/services/tiffin_detail.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../fonts/fonts.dart';

class Tiffin extends StatefulWidget {
  const Tiffin({super.key});

  @override
  State<Tiffin> createState() => _TiffinState();
}

class _TiffinState extends State<Tiffin> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(
        decelerationRate: ScrollDecelerationRate.normal
      ),
      child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('tiffin').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  DocumentSnapshot product = snapshot.data!.docs[index];
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Tifiin_Detail(product: product)));
                      }, //navigateToDetail(doc[index]),
                      child: Container(
                        height: 175,
                        child: Container(
                          height: 175,
                          //padding: const EdgeInsets.only(left: 5, right: 5),
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          decoration: BoxDecoration(
                            color: themecolor,
                            // Color.fromARGB(255, 196, 192, 211),
                            borderRadius: BorderRadius.circular(20),
                            // boxShadow: [
                            //   BoxShadow(
                            //       blurRadius: 2,
                            //       offset: Offset(0, 0),
                            //       color: Colors.grey.withOpacity(0.2))
                            // ]
                          ),
                          child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Row(children: [
                                Container(
                                  width: 127,
                                  height: 130,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: NetworkImage(product['image']),
                                          fit: BoxFit.fill)),
                                ),
                                const SizedBox(
                                  width: 13,
                                ),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(top: 55),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child: Text(
                                          product['name'],
                                          style: GoogleFonts.secularOne(
                                              textStyle: softbold,
                                              color: maincolor),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.stars_rounded,
                                            size: 24,
                                            color: maincolor,
                                          ),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Text(product['rating'],
                                              style: GoogleFonts.secularOne(
                                                  textStyle: softnormal,
                                                  color: maincolor)),
                                        ],
                                      )
                                    ]),
                              ])),
                        ),
                      ));
                });
          }),
    );
  }
}
