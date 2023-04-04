import 'package:flutter/material.dart';
import "package:food/dinning/explore.dart";
import "package:food/dinning/types.dart";
import "package:food/flobal_variables.dart";
import "package:food/widgets/searchbar.dart";
import "package:google_fonts/google_fonts.dart";
import "../fonts/fonts.dart";
import 'package:lottie/lottie.dart';
import 'package:animate_do/animate_do.dart';

class Dining extends StatefulWidget {
  const Dining({super.key});

  @override
  State<Dining> createState() => _DiningState();
}

class _DiningState extends State<Dining> {
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
                  child: Container(
                    height: 200,
                    width: 400,
                    child: Lottie.network(
                        "https://assets2.lottiefiles.com/packages/lf20_bqnjxnmy.json"),
                  )),
              FadeInDown(
                  delay: const Duration(milliseconds: 700),
                  child: Text(
                    "What Are You Looking For?",
                    style: GoogleFonts.secularOne(
                        textStyle: boldstyle, color: maincolor),
                  )),
              const SizedBox(
                height: 20,
              ),
              FadeInDown(
                  delay: const Duration(milliseconds: 700),
                  child: const DinningTypes()),
              const SizedBox(
                height: 5,
              ),
              const Divider(color: maincolor, thickness: 2),
              const SizedBox(
                height: 10,
              ),
              FadeInDown( delay: const Duration(milliseconds: 1000),
                child: Text(
                  "Explore",
                  style: GoogleFonts.secularOne(
                      textStyle: boldstyle, color: maincolor),
                ),
              ),
              const SizedBox(height: 10,),
              FadeInDown(
                  delay: const Duration(milliseconds: 1000),
                  child: Container(
                    height: 200,
                    width: 400,
                    child: Lottie.network(
                        "https://assets2.lottiefiles.com/private_files/lf30_UlXgnV.json"),
                  )),
              const SizedBox(
                height: 20,
              ),
              FadeInDown(delay: const Duration(milliseconds: 1000),child: const Explore()),
              const SizedBox(
                height: 20,
              ),
              //const Divider(color: maincolor, thickness: 2)
            ],
          )),
    );
  }
}
