//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:food/main.dart';
import 'package:food/food/categories.dart';
import 'package:food/food/featured.dart';
import 'package:food/food/restaurants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:animate_do/animate_do.dart';
import '../flobal_variables.dart';
import '../fonts/fonts.dart';
import '../food/couponimages.dart';
import '../widgets/searchbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Searchbar(),
              const SizedBox(
                height: 10,
              ),
              FadeInDown(
                  delay: const Duration(milliseconds: 500),
                  child: Container(
                    height: 200,
                    width: 400,
                    child: Lottie.network(
                        "https://assets2.lottiefiles.com/packages/lf20_ovwsvehd.json"),
                  )),
              FadeInDown(
                delay: const Duration(milliseconds: 800),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text("Today's Best Deals",
                          style: GoogleFonts.secularOne(
                              textStyle: bold,
                              fontSize: 24,
                              color: maincolor))),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              FadeInDown(
                delay: const Duration(milliseconds: 800),
                child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: FoodCoupons()),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                color: maincolor,
              ),
              const SizedBox(
                height: 15,
              ),
              FadeInDown(
                delay: const Duration(milliseconds: 1200),
                child: Center(
                    child: Text("Feautured Picks",
                        style: GoogleFonts.secularOne(
                            textStyle: bold, fontSize: 24, color: maincolor))),
              ),
              const SizedBox(
                height: 15,
              ),
              FadeInDown(
                delay: const Duration(milliseconds: 1500),
                child: const Featured(),
              ),
              FadeInDown(
                  delay: const Duration(milliseconds: 1800),
                  child: const Categories()),
              const SizedBox(
                height: 20,
              ),
              //const Divider(color: maincolor, thickness: 2),
              const SizedBox(
                height: 15,
              ),
              FadeInDown(
                delay: const Duration(milliseconds: 2100),
                child: Center(
                    child: Text("Order Now",
                        style: GoogleFonts.secularOne(
                            textStyle: bold, fontSize: 24, color: maincolor))),
              ),
               FadeInDown(
                  delay: const Duration(milliseconds: 2100),
                  child: Container(
                    height: 200,
                    width: 400,
                    child: Lottie.network(
                        "https://assets5.lottiefiles.com/private_files/lf30_1h70d9xc.json"),
                  )),
              
              const SizedBox(
                height: 10,
              ),
              FadeInDown(
                  delay: const Duration(milliseconds: 2100),
                  child: const RestaurantsList()),
            ]),
      ),
    );
  }
}
