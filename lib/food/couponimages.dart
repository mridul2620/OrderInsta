import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food/screens/dining.dart';

import '../flobal_variables.dart';
import 'res_list.dart';

class FoodCoupons extends StatefulWidget {
  const FoodCoupons({super.key});

  @override
  State<FoodCoupons> createState() => _FoodCouponsState();
}

class _FoodCouponsState extends State<FoodCoupons> {
  int currpage = 0;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.81,
      child: Stack(alignment: Alignment.bottomRight, children: [
        StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('coupons').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
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
                           Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Res_list()));
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
        Positioned(
          bottom: defaultPadding,
          right: defaultPadding,
          child: Row(
              children: List.generate(
                  5,
                  (index) => Padding(
                        padding:
                            const EdgeInsets.only(left: defaultPadding / 4),
                        child: IndicatorDot(isActive: index == currpage),
                      ))),
        )
      ]),
    );
  }
}

class IndicatorDot extends StatelessWidget {
  const IndicatorDot({super.key, required this.isActive});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 8,
      decoration: BoxDecoration(color: isActive ? maincolor : Colors.yellow),
    );
  }
}
