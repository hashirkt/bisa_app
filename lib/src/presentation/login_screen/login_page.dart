import 'package:bisa_app/src/presentation/register_screen/register_page.dart';
import 'package:bisa_app/src/presentation/widget/pasword_textfield.dart';
import 'package:bisa_app/src/presentation/widget/userid_textfield.dart';
import 'package:bisa_app/src/utils/resources/asset_resources.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
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
   bool isLoading=false;
  final _loginKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _loginIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  void signUserIn()async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _loginIdController.text,
        password: _passwordController.text);
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
                        UserIdTextField(controller: _loginIdController,),
                        PasswordTextField( passController: _passwordController),
                        const SizedBox(height: 10,),
                        Text("Forgot Password?",style: AppTheme.smallHead,),
                        const SizedBox(height: 50,),
                         ButtonWidget(buttonTextContent: 'START',onPressed:() async{
                           if(_loginKey.currentState!.validate()){
                             signUserIn();
                           }
                         } ,),
                        const SizedBox(height:20,),
                        InkWell(
                          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const RegisterPage())),
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