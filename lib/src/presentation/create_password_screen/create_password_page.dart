import 'package:bisa_app/src/presentation/widget/button_widget.dart';
import 'package:bisa_app/src/presentation/widget/head_container.dart';
import 'package:bisa_app/src/presentation/widget/pasword_textfield.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CreatePasswordPage extends StatefulWidget {
  final String? phoneNumber;
  const CreatePasswordPage({super.key,this.phoneNumber});

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
  // void createPassword()async{
  //   showDialog(context: context, builder: (context){
  //     return const Center(child: CircularProgressIndicator(
  //       color: AppTheme.textColor,
  //     ));
  //   });
  //   try{
  //     await FirebaseFirestore.instance.collection('users').where(
  //       'phoneNumber',isEqualTo: widget.phoneNumber).get().then((value) => null)
  //     )
  //   }
  // }

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
                    const HeadContainer(headingText: "SET YOUR PASSWORD", smallTitleText: "Password will be seven characters",),
                  const SizedBox(height: 150,),
                  PasswordTextField(passController: _passController),
                  const SizedBox(height: 20,),
                  PasswordTextField(passController: _confirmController),
                  const SizedBox(height: 120,),
                 ButtonWidget(buttonTextContent: "GO",onPressed: (){
                   if(_passPageKey.currentState!.validate()&&
                   _confirmController.text==_passController.text
                   ){
                     _showSnackBar("Password created successfully");

                   }
                 })
                 //  ButtonWidget(buttonTextContent: "GO",onPressed: ()=>Navigator.pushReplacement(context, MaterialPageRou te(builder: (context)=>const HomePage())),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
