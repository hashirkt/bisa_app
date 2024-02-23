import 'dart:developer';
import 'package:bisa_app/src/domain/models/user_model.dart';
import 'package:bisa_app/src/presentation/forgot_password_screen/forgot_password_page.dart';
import 'package:bisa_app/src/presentation/home_screen/bottom_nav_bar.dart';
import 'package:bisa_app/src/presentation/register_screen/register_page.dart';
import 'package:bisa_app/src/presentation/widget/pasword_textfield.dart';
import 'package:bisa_app/src/presentation/widget/userid_textfield.dart';
import 'package:bisa_app/src/utils/resources/asset_resources.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widget/button_widget.dart';
import '../widget/head_container.dart';
class LoginPage extends StatefulWidget {
 const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _loginIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _loginKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserModel user = UserModel();
  @override
  void dispose() {
    _loginIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  void signUserIn()async{
    showDialog(context: context, builder: (context){
      return const Center(child: CircularProgressIndicator(
        color: AppTheme.textColor,
      ));
    });
    try{
      _auth.signInAnonymously();
      if(_loginIdController.text.contains(RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$'))){
        final userSnapshot = await FirebaseFirestore.instance.collection('users').where('phonecontroller',isEqualTo: _loginIdController.text.trim()).where('password',isEqualTo: _passwordController.text.trim()).get();
        if(userSnapshot.docs.isNotEmpty){
          _showSnackBar("Login Successful");
          Future.delayed(Duration(seconds: 1),(){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const BottomNavBarPage()), (route) => false);
          });
        }else{
          _showSnackBar("No user found");
        }
      }else{
        final userSnapshot = await FirebaseFirestore.instance.collection('users').where('email',isEqualTo: _loginIdController.text.trim()).where('password',isEqualTo: _passwordController.text.trim()).get();
        if(userSnapshot.docs.isNotEmpty){
          _showSnackBar("Login Successful");
          Future.delayed(Duration(seconds: 1),(){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const BottomNavBarPage()), (route) => false);
          });
        }else{
          _showSnackBar("No user found");
        }
      }

      // await FirebaseAuth.instance.signInWithEmailAndPassword(
      //     email: _loginIdController.text,
      //     password: _passwordController.text);
    } on FirebaseAuthException catch (e) {
      log("firebase auth exception => ${e.code}");
      if(e.code == 'invalid-credential'){
        _showSnackBar("Incorrect Login credential");
      }
    }catch (e){
      print(e);
      _showSnackBar("Failed to login");
    }
    Navigator.pop(context);
  }
  void _showSnackBar(String message){
    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
           behavior: SnackBarBehavior.floating,
           content: Text(message))
    );
  }

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          padding:const EdgeInsets.only(left: 20,right: 20),
         // color: Colors.red,
          height: double.infinity,
          width: double.infinity,
          child:   SingleChildScrollView(
            child: Column(
              children: [
               const SizedBox(height: 50,),
                const HeadContainer(
                  headingText: 'LOGIN',
                  smallTitleText: 'Login to your Account', image: AssetImage(AssetResources.appLogo),containerHeight: 50,),
                const SizedBox(height: 100,),
                Container(
                  width: double.infinity,
                // color: Colors.blue,
                  child: Form(
                    key: _loginKey,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                       // const SizedBox(height: 20,),
                        UserIdTextField(controller: _loginIdController,textInputAction: TextInputAction.next,),
                        PasswordTextField(textInputAction: TextInputAction.done, passController: _passwordController,onSubmitted: (value){
                          if(_loginKey.currentState!.validate()){
                            signUserIn();
                          }
                        },),
                        InkWell(
                            onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasswordPage())),
                            child: Text("Forgot Password?",style: AppTheme.smallHead,)),
                        const SizedBox(height: 50,),
                         ButtonWidget(buttonTextContent: 'START',onPressed:() async{
                           if(_loginKey.currentState!.validate()){
                             signUserIn();
                           }
                         } ,),
                        const SizedBox(height:30,),
                        InkWell(
                          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const RegisterPage())),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              //color: Colors.red
                            ),
                            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RichText(text: TextSpan(
                                  text: "You don't have an Account? ",style: AppTheme.smallHead,
                                  children: [
                                    TextSpan(
                                      text: "Register",style: AppTheme.fieldText
                                    )
                                  ]
                                )),
                              ],
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}