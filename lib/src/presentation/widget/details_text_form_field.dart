import 'package:flutter/material.dart';
import '../../utils/resources/theme.dart';

class DetailsTextFormField extends StatelessWidget {
  final String? labelText;
  const DetailsTextFormField({ this.labelText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      style: AppTheme.fieldText,
      cursorColor: AppTheme.textColor,
      decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppTheme.smallText,width: 1,style: BorderStyle.solid)
          ),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppTheme.textColor,width: 1,style: BorderStyle.solid)
          ),
          errorBorder:  const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red,width: 1,style: BorderStyle.solid)
          ),
          labelText: labelText,
          labelStyle: AppTheme.labelText
      ),
    );
  }
}