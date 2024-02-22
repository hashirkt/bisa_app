import 'dart:math';

import 'package:bisa_app/src/presentation/create_password_screen/create_password_page.dart';
import 'package:bisa_app/src/presentation/widget/button_widget.dart';
import 'package:bisa_app/src/presentation/widget/head_container.dart';
import 'package:bisa_app/src/presentation/widget/userid_textfield.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../utils/resources/asset_resources.dart';
import '../otp_screen/otp_page.dart';

class RegisterPage extends StatefulWidget {
   const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController loginIdController=TextEditingController();
  final _signUpKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  void _showSnackBar(String message){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text(message))
    );
  }

  void verifyPhoneNumber()async{
    showDialog(context: context, builder: (context){
      return const Center(child: CircularProgressIndicator(
        color: AppTheme.textColor,
      ));
    });
    try{
      await auth.verifyPhoneNumber(
          phoneNumber:"+91${loginIdController.text}",
          verificationCompleted: (PhoneAuthCredential credential){
            _showSnackBar("OTP sent");
          },
          verificationFailed: (FirebaseAuthException e){
            _showSnackBar(e.message.toString());
          },
          codeSent: (String verificationId,int? resendToken){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> OTPPage(phoneNumber: loginIdController.text,verificationId: verificationId,)));
          },
          codeAutoRetrievalTimeout: (String verificationId){
            _showSnackBar("OTP timeout");
          }
);
    }on FirebaseAuthException catch (e){
      _showSnackBar(e.code);
    }
    Navigator.pop(context);
  }

  void addEmail()async{
    showDialog(context: context, builder: (context){
      return const Center(child: CircularProgressIndicator(
        color: AppTheme.textColor,
      ));
    });
    try{
      await FirebaseFirestore.instance.collection('users').add({
        'email':loginIdController.text
      }).then((value) => {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const CreatePasswordPage())),
      });
    }on FirebaseAuthException catch (e){
      _showSnackBar(e.code);
    }
    Navigator.pop(context);
  }
  @override
  void dispose() {
    loginIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body:Container(
          padding:const EdgeInsets.only(left: 20,right: 20),
          height: double.infinity,
          width: double.infinity,
          color: AppTheme.backColor,
          child: SingleChildScrollView(
            child: Form(
              key: _signUpKey,
              child: Column(
                children: [
                  const SizedBox(height: 50,),
                  const HeadContainer(
                      headingText: "REGISTER",
                      smallTitleText: "Register your Account",image: AssetImage(AssetResources.appLogo),containerHeight: 50,),
                  const SizedBox(height: 150,),
                  UserIdTextField(controller: loginIdController,onSubmitted: (value){
                    if(_signUpKey.currentState!.validate()){
                      if(_signUpKey.currentState!.validate()&&
                          loginIdController.text.contains(RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$'))
                      ){
                        verifyPhoneNumber();

                      }else if(_signUpKey.currentState!.validate()&&
                          loginIdController.text.contains(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))
                      ){
                        addEmail();
                      }

                    }
                  },),
                  const SizedBox(height: 150,),
                   ButtonWidget(buttonTextContent: "SUBMIT",onPressed: ()async{
                     if(_signUpKey.currentState!.validate()&&
                     loginIdController.text.contains(RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$'))
                     ){
                       verifyPhoneNumber();

                     }else if(_signUpKey.currentState!.validate()&&
                         loginIdController.text.contains(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))
                     ){
                       addEmail();
                     }
                   },)

                ],

              ),
            ),
          ),
        ),
      ),
    );
  }
}
