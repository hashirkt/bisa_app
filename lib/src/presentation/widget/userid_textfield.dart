import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/resources/theme.dart';
class UserIdTextField extends StatefulWidget {
  final TextEditingController controller;
  final void Function(String)? onSubmitted;
   const UserIdTextField({
    super.key,required this.controller,this.onSubmitted});

  @override
  State<UserIdTextField> createState() => _UserIdTextFieldState();
}

class _UserIdTextFieldState extends State<UserIdTextField> {
  bool isEmail(String input) =>  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(input);

  bool isPhone(String input) => RegExp(
      r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$'
  ).hasMatch(input);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: const BoxDecoration(
       // color: Colors.yellow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Email/Mobile",style: AppTheme.titleText,),
          const SizedBox(height: 5,),
          Container(
            decoration: const BoxDecoration(),
            height: 75,
            child: TextFormField(
              onFieldSubmitted: widget.onSubmitted,
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r'[+]')),
              ],
              textInputAction: TextInputAction.next,
              validator: (value){
                if (!isEmail(value!) && !isPhone(value)) {
                  return 'Please enter a valid email or phone number.';
                }
                return null;
              },
              style: AppTheme.fieldText,

              cursorColor: AppTheme.textColor,
              enableInteractiveSelection: true,
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