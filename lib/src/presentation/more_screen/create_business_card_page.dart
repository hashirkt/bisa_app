import 'package:bisa_app/src/presentation/widget/button_widget.dart';
import 'package:bisa_app/src/utils/resources/asset_resources.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:flutter/material.dart';
import '../widget/custom_data_textfield.dart';

class CreateBusinessCardPage extends StatelessWidget {
  const CreateBusinessCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
       backgroundColor: AppTheme.backColor,
        titleSpacing:-15,
        leadingWidth: 60,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.keyboard_arrow_left_rounded,color:AppTheme.textColor,size: 30,)),
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
               decoration: const BoxDecoration(
                 // color: Colors.red,
               ),
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
              const CustomDataTextField(prefixIcon: Icon(Icons.apartment_outlined), hintText: 'Company Name',),
             // SizedBox(height: 10,),
              const CustomDataTextField(prefixIcon:Icon( Icons.person_outline_outlined), hintText: "Full Name"),
             // SizedBox(height: 10,),
              const CustomDataTextField(prefixIcon: Icon(Icons.account_balance_outlined), hintText: "Designation"),
              //SizedBox(height: 10,),
              const CustomDataTextField(prefixIcon:Icon( Icons.location_on_outlined,), hintText: "Address"),
             // SizedBox(height: 10,),
              const CustomDataTextField(prefixIcon: Icon(Icons.web_outlined), hintText: "Business Details"),
             // SizedBox(height: 10,),
              const CustomDataTextField(prefixIcon: Icon(Icons.blur_circular_rounded), hintText: "Website"),
              const SizedBox(height: 70,),
              const ButtonWidget(buttonTextContent: "NEXT")
            ],
          ),
        ),

      ),
    );
  }
}

