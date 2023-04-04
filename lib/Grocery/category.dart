import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import '../flobal_variables.dart';
import '../fonts/fonts.dart';

class GroceryCategory extends StatefulWidget {
  const GroceryCategory({super.key});

  @override
  State<GroceryCategory> createState() => _GroceryCategoryState();
}

class _GroceryCategoryState extends State<GroceryCategory> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('grocery_category')
                .snapshots(),
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
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 25,
                      mainAxisExtent: 195,
                      ),
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot product = snapshot.data!.docs[index];
                  return Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Container(               
                              width: 90,             
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(product['image']),
                                        fit: BoxFit.fill))),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Center(
                                child: Text(
                                  product['name'],
                                  style: GoogleFonts.secularOne(
                                      textStyle: softnormal, color: maincolor),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            }));
  }
}
