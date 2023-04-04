import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food/pagetextstyle.dart';
//import 'package:food/signup.dart';
import 'package:dots_indicator/dots_indicator.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

final _controller = PageController(
  initialPage: 0,
);
int _currentPage = 0;
List<Widget> _pages = [
  Column(
    children: [
      Expanded(child: Image.asset("images/foodorder.png")),
      Text(
        "Order online from your favourite store",
        style: pagetextstyle,
      )
    ],
  ),
  Column(
    children: [
      Expanded(child: Image.asset("images/enteraddress.png")),
      Text(
        "Set your Delivery Location",
        style: pagetextstyle,
      ),
    ],
  )
];

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: _controller,
            children: _pages,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
        ),
        DotsIndicator(
          dotsCount: _pages.length,
          position: _currentPage.toDouble(),
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            activeColor: Color(0xFF1f1545),
          ),
        ),
        SizedBox(
          height: 50,
        )
      ],
    );
  }
}
