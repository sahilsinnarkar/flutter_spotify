import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserReq createUserReq);

  Future<Either> signin(SigninUserReq signinUserReq);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinUserReq.email,
        password: signinUserReq.password,
      );
      return const Right("Sign In was Successful");

    } on FirebaseAuthException catch (e) {
      String message = "";

      if(e.code == 'invalid-email') {
        message = "User not found";
      } else if(e.code == 'invalid-credential') {
        message = "Wrong password";
      }

      return Left(message);
    }

  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );

      FirebaseFirestore.instance.collection('Users').add(
        {
          'name': createUserReq.fullName,
          'email': data.user?.email,
        }
      );

      return const Right("Sign Up was Successful");

    } on FirebaseAuthException catch (e) {
      String message = "";

      if(e.code == 'weak-password') {
        message = "The password provided is too weak";
      } else if(e.code == 'email-already-in-use') {
        message = "An account already exists with that email";
      }

      return Left(message);
    }
  }
}
