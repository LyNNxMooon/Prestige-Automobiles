// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:prestige_automobile/data/car_vo.dart';

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

  Future firebaseSignUp(
      String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
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

  Future saveCar(CarVO carVO) => _firebaseFirestore
      .collection("cars")
      .doc(carVO.id.toString())
      .set(carVO.toJson());

  Future deleteCar(int id) =>
      _firebaseFirestore.collection("cars").doc(id.toString()).delete();

  Stream<List<CarVO>> getCarsStream() =>
      _firebaseFirestore.collection("cars").snapshots().map((event) {
        return event.docs.map((document) {
          return CarVO.fromJson(document.data());
        }).toList();
      });

  Future<List<CarVO>> getSearchCarsStream() async {
    var data =
        await _firebaseFirestore.collection('cars').orderBy('name').get();
    return data.docs.map((document) {
      return CarVO.fromJson(document.data());
    }).toList();
  }

  //firebase storage

  static final _firebaseStorage = FirebaseStorage.instance;

  static Future<String> uploadToFirebaseStorage(
      File file, String path, String contentType) {
    var metadata = SettableMetadata(contentType: contentType);
    return _firebaseStorage
        .ref(path)
        .child(DateTime.now().millisecondsSinceEpoch.toString())
        .putFile(file, metadata)
        .then((takeSnapShot) {
      return takeSnapShot.ref.getDownloadURL().then((value) {
        return value;
      });
    });
  }
}
