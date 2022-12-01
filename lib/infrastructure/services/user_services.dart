import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_mart/infrastructure/models/user_model.dart';
import 'package:eco_mart/presentation/elements/flush_bar.dart';
import 'package:eco_mart/presentation/elements/get_user_id.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserServices {
  ///fetch UserData
  ///
  Stream<UserModel> fetchUserData(String uid) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .snapshots()
        .map((event) => UserModel.fromJson(event.data()!));
  }

  Future createUser(BuildContext context,
      {required UserModel model, required String uid}) async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection('users').doc(uid);
    return await docRef.set(model.toJson(uid));
  }

  updateAddress(bool isAvailable) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(getUserID())
        .set({"isAvailable": isAvailable}, SetOptions(merge: true));
  }

  ///Update Profile
  Future<void> updateProfile(
    BuildContext context, {
    required String image,
    required String phone,
    required String address,
    required String name,
  }) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      "image": image,
      "address": address,
      "phoneNumber": phone,
      "name": name,
    }, SetOptions(merge: true)).whenComplete(
            () => {getFlushBar(context, title: 'Profile Update Successfully')});
  }

  ///SignOut
  Future signOut() async {
    return await FirebaseAuth.instance.signOut();
  }
}
