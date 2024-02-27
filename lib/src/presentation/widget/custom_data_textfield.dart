import 'package:flutter/material.dart';
import '../../utils/resources/theme.dart';

class CustomDataTextField extends StatelessWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final String? initialValue;
  final Function()? onTap;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final BoxConstraints? prefixIconConstraints;
  const CustomDataTextField({ this.prefixIconConstraints,this.prefixIcon,this.hintText, this.controller,this.initialValue,this.textInputType,this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      initialValue: initialValue,
      controller: controller,
      cursorColor: AppTheme.textColor,
      style: AppTheme.titleText,
      decoration:  InputDecoration(

          prefixIcon: prefixIcon,
         prefixIconConstraints: prefixIconConstraints,
         // prefixIconConstraints: const BoxConstraints(maxHeight: 15,minWidth: 40),
        suffix: IconButton(onPressed: (){}, icon: const Icon(Icons.clear,color: AppTheme.textColor,size: 20,)),
          hintText: hintText,
          hintStyle: AppTheme.smallHead,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.smallText,width: 1),
          ),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppTheme.textColor,width: 1)
          )
      ),
    );
  }
}