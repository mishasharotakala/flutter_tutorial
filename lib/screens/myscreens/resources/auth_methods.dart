import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // sign up user
  Future<String> signUpUser({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required Uint8List file,
  }) async {
    String res = "Some error occured";
    try{
      if(name.isNotEmpty || email.isNotEmpty || password.isNotEmpty || confirmPassword == password || file != null) {
        // register the user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email, 
          password: password,
        );
        print(cred.user!.uid);
        // add user to our database
        _firestore.collection("persons").doc(cred.user!.uid).set({
          "name": name,
          "uid": cred.user!.uid,
          "email": email,
        }); 
      }
    }
    catch(err) {
      res = err.toString();
    }
    return res;
  }
}