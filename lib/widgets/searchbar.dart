import 'package:flutter/material.dart';
import 'package:food/fonts/fonts.dart';
import 'package:google_fonts/google_fonts.dart';

import '../flobal_variables.dart';

class Searchbar extends StatefulWidget {
  const Searchbar({super.key});

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration( 
        filled: true,
        fillColor:kmaincolor,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none),
        hintText: "eg: Pizza",
        hintStyle: GoogleFonts.josefinSans(textStyle: softnormal, color: maincolor, fontSize: 18),
        prefixIcon: Icon(Icons.search),
        prefixIconColor: maincolor,
      ),
    );
  }
}
