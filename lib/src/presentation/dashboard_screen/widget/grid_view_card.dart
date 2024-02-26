import 'package:flutter/material.dart';

import '../../../utils/resources/theme.dart';

class GridViewCard extends StatelessWidget {
  final String title;
  final Widget subtitle;
  const GridViewCard({required this.subtitle, required this.title, super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: AppTheme.textColor,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,style: AppTheme.buttonText),
          SizedBox(height: 10,),
          subtitle
        ],
      ),
    );
  }
}