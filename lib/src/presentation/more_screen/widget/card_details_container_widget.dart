import 'package:flutter/material.dart';
import '../../../utils/resources/theme.dart';

class CardDetailsContainer extends StatelessWidget {
  final double? height;
  final String cardHead;
  final Widget widget;
  const CardDetailsContainer({ this.height,required this.cardHead,required this.widget,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(15),
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white ,
          borderRadius: BorderRadius.circular(8),
          // boxShadow: [BoxShadow(
          //   color: AppTheme.smallText,blurRadius: 0.5
          // )]
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(cardHead,style: AppTheme.profilePageTab,),
                const Icon(Icons.add_circle,color: Colors.green,)
              ],
            ),
            widget
          ],
        ),
      ),
    );
  }
}

