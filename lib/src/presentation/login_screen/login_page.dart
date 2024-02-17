import 'package:bisa_app/src/presentation/widget/pasword_textfield.dart';
import 'package:bisa_app/src/presentation/widget/userid_textfield.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:flutter/material.dart';
import '../widget/head_container.dart';

class Login_Page extends StatelessWidget {
  Login_Page({super.key});

  final TextEditingController _loginIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
   bool show=true;
  final _loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        padding:const EdgeInsets.only(left: 20,right: 20),
        color: AppTheme.backColor,
        height: double.infinity,
        width: double.infinity,
        child:   Column(
          children: [
            const Expanded(
                flex: 5,
                child: Head_Container(
              headingText: 'LOGIN',
              smallTitleText: 'Login to your Account',)),

            Expanded(
              flex: 7,
              child: Container(
                width: double.infinity,
               color: Colors.transparent,
                child: Form(
                  key: _loginKey,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(height: 85,),
                      UserId_TextField(controller: _loginIdController,),
                      const SizedBox(height: 20,),
                      Password_TextField( passController: _passwordController),
                      const SizedBox(height: 10,),
                      Text("Forgot Password?",style: AppTheme.smallHead,),
                      const SizedBox(height: 50,),
                      Container(
                        color: Colors.transparent,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: (){},
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  AppTheme.textColor,
                                )),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15, bottom: 15),
                              child: Text("START",style: AppTheme.buttonText,),
                            )),
                      ),
                      const SizedBox(height: 20,),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
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
                      )

                    ],
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}






