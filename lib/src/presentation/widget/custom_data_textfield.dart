
import 'package:flutter/material.dart';

import '../../utils/resources/theme.dart';

class CustomDataTextField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  const CustomDataTextField({ required this.prefixIcon,required this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppTheme.textColor,
      style: AppTheme.titleText,
      decoration:  InputDecoration(
          prefixIcon:  Icon(prefixIcon),
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