import 'package:bisa_app/src/presentation/widget/button_widget.dart';
import 'package:bisa_app/src/presentation/widget/head_container.dart';
import 'package:bisa_app/src/presentation/widget/userid_textfield.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _loginIdController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        padding:const EdgeInsets.only(left: 20,right: 20),
        height: double.infinity,
        width: double.infinity,
        color: AppTheme.backColor,
        child: Column(
          children: [
            const SizedBox(height: 50,),
            const HeadContainer(
                headingText: "REGISTER",
                smallTitleText: "Register your Account"),
            const SizedBox(height: 150,),
            Container(
              //color: Colors.blue,
              child: UserIdTextField(controller: _loginIdController),
            ),
            const SizedBox(height: 150,),
            const ButtonWidget(buttonTextContent: "SUBMIT")

          ],

        ),
      ),
    );
  }
}
