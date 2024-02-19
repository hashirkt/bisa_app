import 'package:flutter/material.dart';

import '../../../utils/resources/theme.dart';

class CustomerNameField extends StatelessWidget {
  final String nameText;
  final String companyNameText;
  final IconData? checkedIcon;
  const CustomerNameField({required this.nameText, required this.companyNameText,this.checkedIcon ,super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: const BoxDecoration(
        //color: Colors.blue,
          border: Border(bottom: BorderSide(
              color: AppTheme.smallText,width: 1
          ))
      ),
      width: double.infinity,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: AppTheme.smallText,width: 1)
            ),
            child: const Icon(Icons.person_outlined,size: 40,color: AppTheme.smallText,),
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(nameText,style: AppTheme.tabText,),
                     Icon(checkedIcon,color: Colors.green,)
                  ],
                ),
                Text(companyNameText,style: AppTheme.smallHead,)
              ],
            ),
          )
        ],
      ),
    );
  }
}