import "package:flutter/material.dart";
import "package:food/Grocery/topfeatured.dart";
import "package:food/widgets/searchbar.dart";
import "package:google_fonts/google_fonts.dart";
import "../Grocery/category.dart";
import "../Grocery/deals.dart";
import "../flobal_variables.dart";
import 'package:lottie/lottie.dart';
import "../fonts/fonts.dart";
import 'package:animate_do/animate_do.dart';

class Grocery extends StatefulWidget {
  const Grocery({super.key});

  @override
  State<Grocery> createState() => _GroceryState();
}

class _GroceryState extends State<Grocery> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Searchbar(),
            const SizedBox(
              height: 10,
            ),
            
            FadeInDown(
              delay: const Duration(milliseconds: 500),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("Grocery Mart",
                        style: GoogleFonts.secularOne(
                            textStyle: bold, fontSize: 24, color: maincolor)),
                    const SizedBox(
                      width: 85,
                    ),
                    Column(
                      children: [
                        Text("Delivering In",
                            style: GoogleFonts.secularOne(
                                textStyle: softnormal,
                                fontSize: 12,
                                color: Colors.grey)),
                        Text("5-10 mins",
                            style: GoogleFonts.secularOne(
                                textStyle: softbold,
                                fontSize: 16,
                                color: maincolor)),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
                      height: 15
                    ),
                    FadeInDown(
                delay: const Duration(milliseconds: 800),
                child: SizedBox(
                  height: 150,
                  width: 400,
                  child: Lottie.network(
                      "https://assets4.lottiefiles.com/private_files/lf30_vb7v5ca0.json"),
                      
                )),
            const SizedBox(
              height: 12,
            ),
            FadeInDown(
              delay:const  Duration(milliseconds: 1000),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text("Today's Best Deals",
                        style: GoogleFonts.secularOne(
                            textStyle: bold, fontSize: 24, color: maincolor))),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            FadeInDown(
              delay: const Duration(milliseconds: 1300),
              child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  child: GroceryDeals()),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(color: maincolor, thickness: 2),
            const SizedBox(
              height: 15,
            ),
            FadeInDown(
              delay: const Duration(milliseconds: 1600),
              child: Center(
                  child: Text("Categories",
                      style: GoogleFonts.secularOne(
                          textStyle: bold, fontSize: 24, color: maincolor))),
            ),
            const SizedBox(
              height: 15,
            ),
            FadeInDown(
              delay: const Duration(milliseconds: 1600),
              child: const GroceryCategory()),
            const SizedBox(
              height: 10,
            ),
            const Divider(color: maincolor, thickness: 2),
            const SizedBox(
              height: 25,
            ),
            FadeInDown(
              delay: const Duration(milliseconds: 1900),
              child: Center(
                  child: Text("Top Featured Today",
                      style: GoogleFonts.secularOne(
                          textStyle: bold, fontSize: 24, color: maincolor))),
            ),
            const SizedBox(
              height: 25,
            ),
            FadeInDown(
              delay: const Duration(milliseconds: 1900),
              child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  child: TopFeatured()),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
