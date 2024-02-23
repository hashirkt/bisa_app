import 'package:bisa_app/src/presentation/create_password_screen/create_password_page.dart';
import 'package:bisa_app/src/presentation/widget/button_widget.dart';
import 'package:bisa_app/src/presentation/widget/head_container.dart';
import 'package:bisa_app/src/utils/resources/asset_resources.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OTPPage extends StatefulWidget {
  final String? phoneNumber;
  final String verificationId;
  const OTPPage({super.key,this.phoneNumber,required this.verificationId});

  @override
  State<OTPPage> createState() => _OTPPageState();
}
class _OTPPageState extends State<OTPPage> {
  final TextEditingController _pinController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
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
          child:  SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 80,),
                const HeadContainer(headingText: "ENTER YOUR OTP",
                    smallTitleText: "Otp Will be Send to Your Registered Email \nor Mobile Number",
                    image: AssetImage(AssetResources.otpIcon),containerHeight: 80,),
                const SizedBox(height: 30,),
                Container(
                  height: 200,
                  width: double.infinity,
                  //color: Colors.blue,
                  child: Pinput(
                    controller: _pinController,
                    length: 6,

                  ),
                ),
                const SizedBox(height: 120,),
                ButtonWidget(buttonTextContent: "GO",onPressed: ()async{
                  showDialog(context: context, builder: (context){
                    return const Center(child: CircularProgressIndicator(
                      color: AppTheme.textColor,
                    ));
                  });
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: widget.verificationId,
                      smsCode: _pinController.text);
                  await FirebaseFirestore.instance.collection('users').add(
                      {
                        'phoneNumber':widget.phoneNumber
                      });
                  await auth.signInWithCredential(credential).then((value) {
                    Navigator.push(context, MaterialPageRoute(builder: (
                        context) =>  CreatePasswordPage(phoneNumber: widget.phoneNumber,)));
                  });
                })

              ],
            ),
          ),
        ),
      ),
    );
  }
}
