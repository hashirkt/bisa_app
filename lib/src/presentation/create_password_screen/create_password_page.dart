import 'package:bisa_app/src/presentation/login_screen/login_page.dart';
import 'package:bisa_app/src/presentation/widget/button_widget.dart';
import 'package:bisa_app/src/presentation/widget/head_container.dart';
import 'package:bisa_app/src/presentation/widget/pasword_textfield.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
class CreatePasswordPage extends StatefulWidget {
  final String? phoneNumber;
  final String? emailId;
  const CreatePasswordPage({super.key,this.phoneNumber,this.emailId});
  @override
  State<CreatePasswordPage> createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends State<CreatePasswordPage> {
  final TextEditingController _passController= TextEditingController();
  final TextEditingController _confirmController= TextEditingController();
  void _showSnackBar(String message){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text(message))
    );
  }
  final _passPageKey = GlobalKey<FormState>();
  void createPasswordPhone()async{
    showDialog(context: context, builder: (context){
      return const Center(child: CircularProgressIndicator(
        color: AppTheme.textColor,
      ));
    });
    try{
      await FirebaseFirestore.instance.collection('users').where(
        'phoneNumber',isEqualTo: widget.phoneNumber )
          .get().then((QuerySnapshot querySnapshot){

          if(querySnapshot.docs.isNotEmpty){
            querySnapshot.docs.forEach((doc) {
              doc.reference.update({'password':_passController.text}).then((value) {
                _showSnackBar("Password created");
                Future.delayed(const Duration(seconds: 1),(){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const LoginPage()), (route) => false);
                });
              }).catchError((error){
                _showSnackBar("Error: $error");
              });
            });
          }else{
            _showSnackBar("User not found");
          }
      }).catchError((error){
        _showSnackBar("Error: $error");
      });

    }on FirebaseException catch (e){
      _showSnackBar(e.code);
    }
    Navigator.pop(context);
  }
  void createPasswordEmail()async{
    showDialog(context: context, builder: (context){
      return const Center(child: CircularProgressIndicator(
        color: AppTheme.textColor,
      ));
    });
    try{
      log("email => ${widget.emailId}");
      await FirebaseFirestore.instance.collection('users').where(
        'email',isEqualTo:widget.emailId)
          .get().then((QuerySnapshot querySnapshot){
            log("email => ${widget.emailId}");
          if(querySnapshot.docs.isNotEmpty){
            querySnapshot.docs.forEach((doc) {
              doc.reference.update({'password':_passController.text}).then((value) {
                _showSnackBar("Password created");
                Future.delayed(const Duration(seconds: 1),(){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const LoginPage()), (route) => false);
                });
              }).catchError((error){
                _showSnackBar("Error: $error");
              });
            });
          }else{
            _showSnackBar("User not found");
          }
      }).catchError((error){
        _showSnackBar("Error: $error");
      });

    }on FirebaseException catch (e){
      _showSnackBar(e.code);
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(left: 20,right: 20),
          height: double.infinity,
          width: double.infinity,
          color: AppTheme.backColor,
          child: SingleChildScrollView(
            child: Form(
              key: _passPageKey,
              child: Column(
                children: [
                  const SizedBox(height: 30,),
                    const HeadContainer(headingText: "SET YOUR PASSWORD", smallTitleText: "Password will be six characters",),
                  const SizedBox(height: 150,),
                  PasswordTextField(passController: _passController,textInputAction: TextInputAction.next,),
                  PasswordTextField(passController: _confirmController,textInputAction: TextInputAction.done,),
                  const SizedBox(height: 120,),
                 ButtonWidget(buttonTextContent: "GO",onPressed: (){
                   if(_passPageKey.currentState!.validate()&&
                       _confirmController.text!=_passController.text
                   ){
                     _showSnackBar("Password doesn't match");
                   }
                   else if(
                   _confirmController.text==_passController.text &&
                       widget.phoneNumber!=null
                   ){
                     createPasswordPhone();
                   }
                   else{
                     createPasswordEmail();
                   }
                 })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
