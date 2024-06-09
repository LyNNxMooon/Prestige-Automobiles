// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class FirebaseServices {
  FirebaseServices._();
  static final FirebaseServices _singleton = FirebaseServices._();
  factory FirebaseServices() => _singleton;

  //Auth
  Future firebaseSignIn(
      String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  //CLoud Firestore

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<List> getBannerListStream() =>
      _firebaseFirestore.collection("banner").snapshots().map((event) {
        return event.docs.map((document) {
          return document.data()['home_banner'];
        }).toList();
      });
}
