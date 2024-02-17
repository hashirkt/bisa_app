import 'package:flutter/material.dart';
import '../../utils/resources/theme.dart';

class HeadContainer extends StatelessWidget {
  final String headingText;
  final double containerHeight;
  final String smallTitleText;
  final ImageProvider? image;
  const HeadContainer({super.key,required this.headingText,required this.smallTitleText,this.image,required this.containerHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      //color: Colors.red,
      child: Column(mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: containerHeight,
            decoration: BoxDecoration(
            //color: Colors.red,
                image: DecorationImage(
                  image: image! ,
                )
            ),
          ),
          const SizedBox(height: 40,),
          Text(headingText,style: AppTheme.headText,),
          const SizedBox(height: 20,),
          Text(smallTitleText,style: AppTheme.smallHead,textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}