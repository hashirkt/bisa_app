import 'package:flutter/material.dart';
import '../../../utils/resources/theme.dart';

class ProfilePageTabBox extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function()? onTap;
  const ProfilePageTabBox({ required this.icon,required this.text,this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 55,
          width: 105,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppTheme.backColor,
              boxShadow: const [BoxShadow(
                  color: AppTheme.smallText,
                  blurRadius: 3
              )]
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,color: AppTheme.textColor,),
              const SizedBox(width: 5,),
              Text(text,style: AppTheme.profilePageTab,)
            ],
          )
      ),
    );
  }
}