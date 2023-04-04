import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food/fonts/fonts.dart';
import 'package:google_fonts/google_fonts.dart';

import '../flobal_variables.dart';

class Featured extends StatefulWidget {
  const Featured({super.key});

  @override
  State<Featured> createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 430,
      height: 355,
      child: Stack(
        children: [
          StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('featured').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      DocumentSnapshot product = snapshot.data!.docs[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kmaincolor,
                          ),
                          
                          child: InkWell(
                            onTap: () {},
                              child: Column(
                                children: [
                                  Container(
                                    height: 255,
                                    width: 200,
                                    child: Image(
                                      image: NetworkImage(product['image']),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  //SizedBox(height: ,),
                                  Text(
                                    product['name'],
                                    style: GoogleFonts.secularOne(
                                        textStyle: boldstyle, color:maincolor),
                                        // Color.fromARGB(255, 196, 192, 211)),
                                  ),
                                  SizedBox(height: 3,),
                                  Container(
                                    width: 200,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,  
                                      children: [
                                        Flexible(
                                          fit: FlexFit.loose,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left:8),
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: defaultPadding / 2,
                                                  vertical: defaultPadding / 8),
                                              decoration: BoxDecoration(
                                                  color:themecolor, 
                                                  //Color.fromARGB(255, 196, 192, 211),
                                                  borderRadius:
                                                      BorderRadius.all(Radius.circular(6))),
                                              child: Text(
                                                product['rating'],style: GoogleFonts.secularOne(textStyle: softnormal, color: maincolor),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 45),
                                        CircleAvatar(
                                          radius: 4,
                                          backgroundColor: maincolor, 
                                        ),
                                        SizedBox(width: 5,),
                                        Flexible(
                                          fit: FlexFit.loose,
                                          child: Text(
                                            product['time'],style: GoogleFonts.secularOne(textStyle: softnormal,fontSize: 15,  color:maincolor),
                                            //Color.fromARGB(255, 196, 192, 211))
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                                           
                        ),
                      );
                    });
              })
        ],
      ),
    );
  }
}
