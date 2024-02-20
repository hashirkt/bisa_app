import 'package:bisa_app/src/presentation/widget/button_widget.dart';
import 'package:bisa_app/src/utils/resources/asset_resources.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:flutter/material.dart';

import '../widget/custom_data_textfield.dart';

class CreateCardPage extends StatelessWidget {
  const CreateCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       //backgroundColor: Colors.blue,
        titleSpacing:-15,
        leadingWidth: 60,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.keyboard_arrow_left_rounded,size: 30,)),
        title: Text("Create Card",style: AppTheme.pageHead,),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20,right: 20),
        height: double.infinity,
        width: double.infinity,
        color: AppTheme.backColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 150,
               // color: Colors.red,
                child: Center(
                  child: Container(
                    height: 82,
                    width: 82,
                    decoration: BoxDecoration(
                      image: const DecorationImage(image: AssetImage(AssetResources.userDp)),
                      border: Border.all(color: AppTheme.smallText,width: 1),
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                    ),

                  ),
                ),
              ),
              CustomDataTextField(prefixIcon: Icons.apartment_outlined, hintText: 'Company Name',),
             // SizedBox(height: 10,),
              CustomDataTextField(prefixIcon: Icons.person_outline_outlined, hintText: "Full Name"),
             // SizedBox(height: 10,),
              CustomDataTextField(prefixIcon: Icons.account_balance_outlined, hintText: "Designation"),
              //SizedBox(height: 10,),
              CustomDataTextField(prefixIcon: Icons.location_on_outlined, hintText: "Address"),
             // SizedBox(height: 10,),
              CustomDataTextField(prefixIcon: Icons.web_outlined, hintText: "Business Details"),
             // SizedBox(height: 10,),
              CustomDataTextField(prefixIcon: Icons.blur_circular_rounded, hintText: "Website"),
              SizedBox(height: 70,),
              ButtonWidget(buttonTextContent: "NEXT")
            ],
          ),
        ),

      ),
    );
  }
}

