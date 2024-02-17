import 'package:flutter/material.dart';
import '../../utils/resources/theme.dart';

class UserIdTextField extends StatelessWidget {
  final TextEditingController controller;
   const UserIdTextField({
    super.key,required this.controller});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      width: double.infinity,
      //color: Colors.yellow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Email/Mobile",style: AppTheme.titleText,),
          const SizedBox(height: 5,),
          Container(
            height: 55,
            child: TextFormField(
              style: AppTheme.fieldText,
              cursorColor: AppTheme.textColor,
              controller: controller,
              decoration: InputDecoration(
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
              ),
            ),
          )
        ],
      ),
    );
  }
}