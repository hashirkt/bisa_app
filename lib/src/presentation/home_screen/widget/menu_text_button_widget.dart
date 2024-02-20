
import 'package:flutter/material.dart';
import '../../../utils/resources/theme.dart';

class MenuTextButtonWidget extends StatelessWidget {
  final String buttonText;
  final ImageProvider buttonImage;
  final void Function()? onTap;

   const MenuTextButtonWidget({required this.buttonText,required this.buttonImage,this.onTap, super.key,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(height: 50,
        decoration:  const BoxDecoration(
          // color: Colors.blue,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: buttonImage,width: 24,height: 24,),
             const SizedBox(width: 10,),
            Text(buttonText,style: AppTheme.menuButtonText,)
          ],
        ),
      ),
    );
  }
}