import 'package:flutter/material.dart';

import '../../utils/resources/theme.dart';

class PopUpAlertDialogBox extends StatelessWidget {
  final Widget widget;
  final double height;
  const PopUpAlertDialogBox({required this.widget,required this.height,super.key,});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: const EdgeInsets.all(0),
      content: Container(
        padding: const EdgeInsets.only(left: 20,right: 20),
        height: height,
        decoration: BoxDecoration(
          color: AppTheme.textColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child:  widget
      ),
    );
  }
}