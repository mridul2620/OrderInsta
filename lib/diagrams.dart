import 'package:flutter/material.dart';

class Diagram extends StatefulWidget {
  const Diagram({super.key});

  @override
  State<Diagram> createState() => _DiagramState();
}

class _DiagramState extends State<Diagram> {
  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Diagrams")),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isPressed = true;
                  });
                },
                child: Text("Show Diagrams")),
                if(_isPressed)
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                    width: 100,
                    height: 100,
                    decoration:BoxDecoration(shape: BoxShape.circle, color:Colors.red)
                  ),
                  Container(
                    width: 80,
                    height: 50,
                    decoration:BoxDecoration(shape: BoxShape.rectangle, color:Colors.blue)
                  ),
                  Container(
                    width: 60,
                    height: 40,
                    decoration:BoxDecoration(shape: BoxShape.circle, color:Colors.pink)
                  ),
                  ],
                )
          ],
        )));
  }
}
