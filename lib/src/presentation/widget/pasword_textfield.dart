import 'package:flutter/material.dart';
import '../../utils/resources/theme.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController passController;
  const PasswordTextField({super.key,required this.passController});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool show=true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
     // color: Colors.blue,
      child: Center(
        child: TextFormField(
          obscureText: show,
          obscuringCharacter: '*',
          style: AppTheme.fieldText,
          cursorColor: AppTheme.textColor,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock_outline_rounded,color: AppTheme.textColor,size: 20,),
            suffixIcon: IconButton(  onPressed: () {
              setState(() {
                show=!show;
              });
            }, icon: show == true ?const Icon(Icons.visibility_outlined,color: AppTheme.smallText,size: 22,):const Icon(Icons.visibility_off_outlined,color: AppTheme.smallText,size: 22,)),
            hintText: "Enter Password",
            hintStyle: AppTheme.smallHead,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                  color: AppTheme.smallText,width: 1,style: BorderStyle.solid),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                  color: AppTheme.textColor,width: 1,style: BorderStyle.solid),
            ),
          ),
        ),
      ),
    );
  }
}