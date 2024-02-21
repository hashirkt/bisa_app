import 'package:flutter/material.dart';
import '../../utils/resources/theme.dart';

class UserIdTextField extends StatefulWidget {
  final TextEditingController controller;
   const UserIdTextField({
    super.key,required this.controller});

  @override
  State<UserIdTextField> createState() => _UserIdTextFieldState();
}

class _UserIdTextFieldState extends State<UserIdTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: double.infinity,
      decoration: const BoxDecoration(
        //color: Colors.yellow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Email/Mobile",style: AppTheme.titleText,),
          const SizedBox(height: 5,),
          Container(
            decoration: const BoxDecoration(),
            height: 80,
            child: TextFormField(
              validator: (value){
                if(value!.isEmpty){
                  return "Field is mandatory";
                }
                return null;
              },
              style: AppTheme.fieldText,
              cursorColor: AppTheme.textColor,
              enableInteractiveSelection: false,
              controller: widget.controller,
              decoration: InputDecoration(
                helperText: " ",
                hintText: "Enter here...",
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
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                      color: Colors.red,width: 1,style: BorderStyle.solid),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                      color: Colors.red,width: 1,style: BorderStyle.solid),
                ),


              ),
            ),
          )
        ],
      ),
    );
  }
}