import 'package:bisa_app/src/presentation/profile_screen/widget/profile_page_tab_box.dart';
import 'package:bisa_app/src/utils/resources/asset_resources.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:flutter/material.dart';

import '../widget/details_text_form_field.dart';
import '../widget/pop_up_alert_dialog_box_widget.dart';
import '../widget/pop_up_text_field.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xffF6F6F6),
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: InkWell(
              onTap: ()=>Navigator.pop(context),
              child: Row(
                children: [
                  const Icon(Icons.keyboard_arrow_left_rounded,color: AppTheme.textColor,),
                  Text("Profile",style: AppTheme.pageHead,),
                ],
              ),
            ),
          ),
          bottom: PreferredSize(preferredSize: const Size.square(170), child: Column(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    border: Border.all(color: AppTheme.smallText,width: 1),
                  image: const DecorationImage(image: AssetImage(AssetResources.user1Dp),fit: BoxFit.cover),
                 // color: Colors.blue,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              const SizedBox(height: 10,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Full Name",style: AppTheme.tabText,),
                  const SizedBox(width: 5,),
                  const Icon(Icons.check_circle,color: Colors.green,size: 15,)
                ],
              ),
               const SizedBox(height: 5,),
               Text("Sales Officer Designation",style: AppTheme.smallHead,),
              const SizedBox(height:25,),

            ],
          )),
          leadingWidth: 200,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20,top: 15),
              child: Text("Verified",style: AppTheme.smallHeadGreen,),
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 20,right: 20),
          height: double.infinity,
          width: double.infinity,
          child:  SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
                 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProfilePageTabBox(icon: Icons.phone_outlined, text: 'MOBILE',
                      onTap: ()=>showDialog(context: context, builder: (context){
                      return const PopUpAlertDialogBox(widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PopUpTextField(initialValue: '1234567890', image: AssetImage(AssetResources.callIcon)),
                          SizedBox(height: 10,),
                          PopUpTextField(initialValue: '1234567890', image: AssetImage(AssetResources.callIcon)),
                          SizedBox(height: 10,),
                          PopUpTextField(initialValue: '1234567890', image: AssetImage(AssetResources.callIcon)),
                          SizedBox(height: 10,),
                        ],
                      ), height: 240, color: AppTheme.textColor,);
                    }),),
                    ProfilePageTabBox(icon: Icons.mail_outline_rounded, text: 'EMAIL',
                    onTap: ()=>showDialog(context: context, builder: (context){
                      return const PopUpAlertDialogBox(widget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PopUpTextField(initialValue: 'codignus@gmail.com', image: AssetImage(AssetResources.gmailIcon))
                        ],
                      ), height: 100, color: AppTheme.textColor,);
                    }),
                    ),
                    ProfilePageTabBox(icon: Icons.language_rounded, text: 'SOCIAL',
                    onTap: ()=>showDialog(context: context, builder: (context){
                      return  const PopUpAlertDialogBox(widget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PopUpTextField(
                              prefix: Image(image: AssetImage(AssetResources.faceBook)),
                                prefixIconConstraints: BoxConstraints(maxWidth: 23,maxHeight: 23),
                                initialValue: 'facebooklink', image: AssetImage(AssetResources.socialIcon)),
                            SizedBox(height: 10,),
                            PopUpTextField(
                                prefix: Image(image: AssetImage(AssetResources.instagram)),
                                prefixIconConstraints: BoxConstraints(maxWidth: 23,maxHeight: 23),
                                initialValue: 'instagramlink', image: AssetImage(AssetResources.socialIcon))
                          ],
                      ), height: 160, color: AppTheme.textColor,);
                    })
                      ,)
                  ],
                ),
                const SizedBox(height: 25,),
                Text("Basic Details",style: AppTheme.tabText,),
                const SizedBox(height: 10,),
                const DetailsTextFormField(labelText: 'Company Name',),
                const SizedBox(height: 10,),
                const DetailsTextFormField(labelText: 'Address',),
                const SizedBox(height: 10,),
                const DetailsTextFormField(labelText: 'Business Details',),
                const SizedBox(height: 10,),
                const DetailsTextFormField(labelText: 'Website',),
              ],
            ),
          ),
        ),
      ),
    );
  }
}