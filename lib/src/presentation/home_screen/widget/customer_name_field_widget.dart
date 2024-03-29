import 'package:flutter/material.dart';

import '../../../utils/resources/theme.dart';

class CustomerNameField extends StatelessWidget {
  final String nameText;
  final String companyNameText;
  final IconData? checkedIcon;
  final ImageProvider profileImage;
  const CustomerNameField({required this.nameText, required this.companyNameText,this.checkedIcon ,required this.profileImage,super.key,
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
      child: Column(
        children: [
          SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(image: profileImage,fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: AppTheme.smallText,width: 1)
                ),
              ),
              const SizedBox(width: 20,),
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
                    const SizedBox(height: 5,),
                    Text(companyNameText,style: AppTheme.smallHead,)
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}