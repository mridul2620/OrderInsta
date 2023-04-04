import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food/user_model.dart';

//for all firebase related services for user
class UserServices {
  String Collection = 'users';
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //new user
  Future<void> createUserData(Map<String, dynamic> values) async {
    String id = values['id'];
    await _firestore.collection('users').doc(id).set(values);
  }

  //update user data
  Future<void> updateUserData(Map<String, dynamic> values) async {
    String id = values['id'];
    await _firestore.collection('users').doc(id).update(values);
  }

  Future<void> getUserById(String id) async {
    await _firestore.collection("users").doc(id).get().then((doc) {
      if (doc.data() == null) {
        return null;
      }
      return UserModel.fromSnapshot(doc);
    });
  }
}
