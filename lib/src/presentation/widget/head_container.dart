
import 'package:flutter/material.dart';
import '../../utils/resources/theme.dart';

class Head_Container extends StatelessWidget {
  final String headingText;
  final String smallTitleText;
  const Head_Container({super.key,required this.headingText,required this.smallTitleText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      color: Colors.transparent,
      child: Column(mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            decoration:const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bisa_logo.png"),
                )
            ),
          ),
          const SizedBox(height: 40,),
          Text(headingText,style: AppTheme.headText,),
          const SizedBox(height: 20,),
          Text(smallTitleText,style: AppTheme.smallHead,),
        ],
      ),
    );
  }
}