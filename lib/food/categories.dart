import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food/screens/dining.dart';
import 'package:google_fonts/google_fonts.dart';
import '../flobal_variables.dart';
import '../fonts/fonts.dart';
import 'res_list.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Divider(
            color: maincolor,
          ),
          SizedBox(
            height: 20,
          ),
          Text("Categories",
              style: GoogleFonts.secularOne(
                  textStyle: bold, fontSize: 24, color: maincolor)),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 120,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('categories')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        DocumentSnapshot product = snapshot.data!.docs[index];
                        return InkWell(
                          hoverColor: Colors.amber,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Res_list()));
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  width: 90,
                                  padding: EdgeInsets.all(5),
                                  margin: EdgeInsets.only(left: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Image(
                                    image: NetworkImage(product['image']),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Text(
                                    product['name'],
                                    style: GoogleFonts.secularOne(
                                      textStyle: softbold,
                                      fontWeight: FontWeight.w600,
                                      color: maincolor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                }),
          )
        ],
      ),
    );
  }
}
