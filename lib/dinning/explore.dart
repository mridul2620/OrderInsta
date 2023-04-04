import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import '../flobal_variables.dart';
import '../fonts/fonts.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('dining_list').snapshots(),
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
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  DocumentSnapshot product = snapshot.data!.docs[index];
                  return InkWell(
                      onTap: () {}, //navigateToDetail(doc[index]),
                      child: Container(
                          height: 285,
                          //padding: const EdgeInsets.only(left: 5, right: 5),
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          decoration: BoxDecoration(
                            // Color.fromARGB(255, 196, 192, 211),
                            borderRadius: BorderRadius.circular(20),
                            // boxShadow: [
                            //   BoxShadow(
                            //       blurRadius: 2,
                            //       offset: Offset(0, 0),
                            //       color: Colors.grey.withOpacity(0.2))
                            // ]
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Column(children: [
                              Container(
                                height: 175,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(product['image']),
                                        fit: BoxFit.fill)),
                              ),
                              Container(
                                  decoration: const BoxDecoration(
                                    //borderRadius: BorderRadius.circular(10),
                                    color: kmaincolor,
                                  ),
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    children: [
                                      Text(
                                        product['name'],
                                        style: GoogleFonts.secularOne(
                                            textStyle: boldstyle,
                                            color: maincolor),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            product['cat'],
                                            style: GoogleFonts.secularOne(
                                                textStyle: softnormal,
                                                color: maincolor),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.stars_rounded,
                                                  size: 24,
                                                  color: maincolor,
                                                ),
                                                SizedBox(
                                                  width: 2,
                                                ),
                                                Text(product['rating'],
                                                    style:
                                                        GoogleFonts.secularOne(
                                                            textStyle:
                                                                softnormal,
                                                            color: maincolor)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            product['area'],
                                            style: GoogleFonts.secularOne(
                                                textStyle: softnormal,
                                                color: maincolor),
                                          ),
                                          Text(
                                            product['cost'],
                                            style: GoogleFonts.secularOne(
                                                textStyle: softnormal,
                                                color: maincolor),
                                          ),
                                        ],
                                      )
                                    ],
                                  )),
                            ]),
                          )));
                });
          }),
    );
  }
}
