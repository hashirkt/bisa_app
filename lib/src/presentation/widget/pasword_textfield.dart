import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/resources/theme.dart';

class Password_TextField extends StatefulWidget {
  final TextEditingController passController;
  const Password_TextField({super.key,required this.passController});

  @override
  State<Password_TextField> createState() => _Password_TextFieldState();
}

class _Password_TextFieldState extends State<Password_TextField> {
  bool show=true;

  @override
  Widget build(BuildContext context) {
    return Container(
        //color: Colors.green,
        child: Center(
          child: TextFormField(
            obscureText: show,
            obscuringCharacter: '*',
            style: AppTheme.fieldText,
            cursorColor: AppTheme.textColor,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_outline_rounded,color: AppTheme.textColor,size: 20,),
              suffixIcon: IconButton(  onPressed: () {
                setState(() {
                  show=!show;
                });
              }, icon: show == true ?Icon(Icons.visibility_outlined,color: AppTheme.smallText,size: 22,):Icon(Icons.visibility_off_outlined,color: AppTheme.smallText,size: 22,)),
              hintText: "Enter Password",
              hintStyle: AppTheme.smallHead,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                    color: AppTheme.textColor,width: 1,style: BorderStyle.solid),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                    color: AppTheme.textColor,width: 1,style: BorderStyle.solid),
              ),
            ),
          ),
        )
    );
  }
}