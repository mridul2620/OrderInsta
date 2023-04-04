import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../flobal_variables.dart';

class GroceryDeals extends StatefulWidget {
  const GroceryDeals({super.key});

  @override
  State<GroceryDeals> createState() => _GroceryDealsState();
}

class _GroceryDealsState extends State<GroceryDeals> {
  int currpage = 0;
  int length = 0;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.81,
      child: Stack(alignment: Alignment.bottomRight, children: [
        StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('grocery_deals').snapshots(),
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
              return PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currpage = value;
                    });
                  },
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot product = snapshot.data!.docs[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: InkWell(
                        onTap: (){
                          
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          child: Image(
                            image: NetworkImage(product['image']),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  });
            }),
            Padding(
              padding: const EdgeInsets.only(right: 8, bottom: 2),
              child: DotsIndicator(
                      dotsCount: 4,
                      position: currpage.toDouble(),
                      decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              activeColor: maincolor,
                      ),
                    ),
            ),
        // Positioned(
        //   bottom: defaultPadding,
        //   right: defaultPadding,
        //   child: Row(
        //       children: List.generate(
        //           5,
        //           (index) => Padding(
        //                 padding:
        //                     const EdgeInsets.only(left: defaultPadding / 4),
        //                 child: IndicatorDot(isActive: index == currpage),
        //               ))),
        // )
      ]),
    );
  }
}

// class IndicatorDot extends StatelessWidget {
//   const IndicatorDot({super.key, required this.isActive});
//   final bool isActive;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 4,
//       width: 8,
//       decoration: BoxDecoration(color: isActive ? maincolor : Colors.yellow),
//     );
//   }
//}
