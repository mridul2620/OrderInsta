import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food/flobal_variables.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../fonts/fonts.dart';

class Tifiin_Detail extends StatefulWidget {
  final DocumentSnapshot product;
  const Tifiin_Detail({required this.product});

  @override
  State<Tifiin_Detail> createState() => _Tifiin_DetailState();
}

class _Tifiin_DetailState extends State<Tifiin_Detail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: kmaincolor,
        title: Text("OrderInsta",
            style: GoogleFonts.josefinSans(textStyle: boldstyle)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image(image: NetworkImage(widget.product['image'])),
            ),
            //bottomArrow(context),
            scroll(),
          ],
        ),
      ),
    ));
  }

  scroll() {
    return DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 1.0,
        minChildSize: 0.6,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                  color: Color(0xFFEDECF2),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 5,
                            width: 35,
                            color: kmaincolor,
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(widget.product['name'],
                            style:
                                GoogleFonts.josefinSans(textStyle: boldstyle)),
                       const  SizedBox(
                          width: 110,
                        ),
                       const  Icon(
                          Icons.stars_rounded,
                          size: 24,
                          color: kmaincolor,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(widget.product['rating'],
                            style: GoogleFonts.secularOne(
                                textStyle: softnormal, color: Colors.black)),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Divider(
                        height: 6,
                      ),
                    ),
                    Text("About Us",
                        style: GoogleFonts.josefinSans(
                            textStyle: softbold, fontSize: 21)),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.product['about'],
                          style:
                              GoogleFonts.josefinSans(textStyle: normalstyle)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Divider(
                        height: 4,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text("Contact Me",
                        style: GoogleFonts.josefinSans(
                            textStyle: softbold, fontSize: 21)),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Phone Number: " + widget.product['number'],
                          style:
                              GoogleFonts.josefinSans(textStyle: normalstyle)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Email: " + widget.product['email'],
                          style:
                              GoogleFonts.josefinSans(textStyle: normalstyle)),
                    ),
                    const SizedBox(
                      height: 25,
                    )
                  ]),
            ),
          );
        });
  }
}