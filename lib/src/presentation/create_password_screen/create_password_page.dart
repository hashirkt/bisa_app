import 'package:bisa_app/src/presentation/home_screen/bottom_nav_bar.dart';
import 'package:bisa_app/src/presentation/widget/button_widget.dart';
import 'package:bisa_app/src/presentation/widget/head_container.dart';
import 'package:bisa_app/src/presentation/widget/pasword_textfield.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:flutter/material.dart';

class CreatePasswordPage extends StatefulWidget {
  const CreatePasswordPage({super.key});

  @override
  State<CreatePasswordPage> createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends State<CreatePasswordPage> {
  final TextEditingController _passController= TextEditingController();
  final TextEditingController _confirmController= TextEditingController();
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
            child: Column(
              children: [
                const SizedBox(height: 30,),
                  const HeadContainer(headingText: "SET YOUR PASSWORD", smallTitleText: "Password will be seven characters",),
                const SizedBox(height: 150,),
                PasswordTextField(passController: _passController),
                const SizedBox(height: 20,),
                PasswordTextField(passController: _confirmController),
                const SizedBox(height: 120,),
               ButtonWidget(buttonTextContent: "GO",onPressed: ()=>Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const BottomNavBarPage()), (route) => false),)
               //  ButtonWidget(buttonTextContent: "GO",onPressed: ()=>Navigator.pushReplacement(context, MaterialPageRou te(builder: (context)=>const HomePage())),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
