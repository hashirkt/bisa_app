import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

class UserServices{
  Future <void> emailSignUp(UserModel user)async{
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email:user.email.toString(), password: user.password.toString());
    await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set(
        {
          'id':userCredential.user!.uid,
          'email': user.email,
          'password':user.password,
          'status':1,
          'createdAt':DateTime.now(),
        }).then((value) =>print("success") );
  }
}