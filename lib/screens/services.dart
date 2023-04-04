import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:food/screens/services/catering.dart';
import 'package:food/screens/services/chefs.dart';
import 'package:food/screens/services/tiffin.dart';
import 'package:food/screens/services/venue.dart';
import 'package:google_fonts/google_fonts.dart';

import '../flobal_variables.dart';
import '../fonts/fonts.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  TabBar get _tabBar => const TabBar(
          unselectedLabelColor: maincolor,
          labelColor: Colors.yellow,
          indicatorColor: Colors.yellow,
          indicatorWeight: 5,
          tabs: [
            Tab(
              icon: Icon(Icons.breakfast_dining),
              text: "Chef",
            ),
            Tab(
              icon: Icon(Icons.dining_rounded),
              text: "Caters",
            ),
            Tab(
              icon: Icon(Icons.delivery_dining_rounded),
              text: "Tiffin",
            ),
            Tab(
              icon: Icon(Icons.deck_rounded),
              text: "Venue",
            )
          ]);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: themecolor,
        appBar: PreferredSize(
          preferredSize: _tabBar.preferredSize,
          child: Material(color: kmaincolor, child: _tabBar),
        ),
        body: const TabBarView(
            children: [Chefs(), Catering(), Tiffin(), Venue()]),
        // child: Padding(
        //   padding: const EdgeInsets.all(10),
        //   child: Center(
        //     child: FadeInDown(
        //       delay: const Duration(milliseconds: 500),
        //       child: Column(
        //         children: [
        //           const SizedBox(
        //             height: 60,
        //           ),
        //           Text("Select The Service You Want",
        //               style: GoogleFonts.secularOne(
        //                   textStyle: boldstyle, color: maincolor)),
        //           const SizedBox(
        //             height: 40,
        //           ),
        //           SizedBox(
        //             width: 250,
        //             height: 45,
        //             child: ElevatedButton(
        //                 style:
        //                     ElevatedButton.styleFrom(backgroundColor: kmaincolor),
        //                 onPressed: () {
        //                   Navigator.push(
        //                           context,
        //                           MaterialPageRoute(
        //                               builder: (context) =>const Chefs()));
        //                 },
        //                 child: Text("Chefs",
        //                     style: GoogleFonts.secularOne(
        //                         textStyle: softbold, color: maincolor))),
        //           ),
        //           const SizedBox(
        //             height: 40,
        //           ),
        //           SizedBox(
        //             width: 250,
        //             height: 45,
        //             child: ElevatedButton(
        //                 style:
        //                     ElevatedButton.styleFrom(backgroundColor: kmaincolor),
        //                 onPressed: () {Navigator.push(
        //                           context,
        //                           MaterialPageRoute(
        //                               builder: (context) => const Catering()));},
        //                 child: Text("Catering Services",
        //                     style: GoogleFonts.secularOne(
        //                         textStyle: softbold, color: maincolor))),
        //           ),
        //           const SizedBox(
        //             height: 40,
        //           ),
        //           SizedBox(
        //             width: 250,
        //             height: 45,
        //             child: ElevatedButton(
        //                 style:
        //                     ElevatedButton.styleFrom(backgroundColor: kmaincolor
        //                     ),
        //                 onPressed: () {
        //                   Navigator.push(
        //                           context,
        //                           MaterialPageRoute(
        //                               builder: (context) => const Venue()));
        //                 },
        //                 child: Text("Venue Finder",
        //                     style: GoogleFonts.secularOne(
        //                         textStyle: softbold, color: maincolor))),
        //           ),
        //           const SizedBox(
        //             height: 40,
        //           ),
        //           SizedBox(
        //             width: 250,
        //             height: 45,
        //             child: ElevatedButton(
        //                 style:
        //                     ElevatedButton.styleFrom(backgroundColor: kmaincolor),
        //                 onPressed: () {Navigator.push(
        //                           context,
        //                           MaterialPageRoute(
        //                               builder: (context) =>const Tiffin()));},
        //                 child: Text("Tiffin Services",
        //                     style: GoogleFonts.secularOne(
        //                         textStyle: softbold, color: maincolor))),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
