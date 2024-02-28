import 'package:bisa_app/src/presentation/home_screen/bottom_nav_bar.dart';
import 'package:bisa_app/src/presentation/home_screen/widget/menu_text_button_widget.dart';
import 'package:bisa_app/src/presentation/more_screen/create_card_screen/create_business_card_page.dart';
import 'package:bisa_app/src/presentation/more_screen/create_card_screen/create_individual_card_page.dart';
import 'package:bisa_app/src/presentation/widget/pop_up_alert_dialog_box_widget.dart';
import 'package:bisa_app/src/utils/resources/asset_resources.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  void signUserOut()async{
   await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 20,right: 20),
        height: double.infinity,
        width: double.infinity,
        color: AppTheme.textColor,
        child:  SingleChildScrollView(
          child: Column(
            children: [
               Container(
                width: double.infinity,
                height: 150,
                decoration: const BoxDecoration(
                 //color: Colors.blue,
                  border: Border(bottom: BorderSide(color: AppTheme.smallText,width: 0.5)),
                  image: DecorationImage(image: AssetImage(AssetResources.appLogoWhiteLarge),
                  alignment: Alignment(0, 0.4))
                ),
                 child: IconButton(onPressed: (){
                   Navigator.pop(context);
                 }, icon: const Icon(Icons.close,color: AppTheme.smallText,),alignment: Alignment.centerRight,),
              ),
              const SizedBox(height: 20,),
              MenuTextButtonWidget(buttonText: 'Home', buttonImage: const AssetImage(AssetResources.homeIcon),onTap: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const BottomNavBarPage())),),
               MenuTextButtonWidget(buttonText: 'Create Card', buttonImage: const AssetImage(AssetResources.dashboardIcon),onTap: ()=>showDialog(context: context, builder: (BuildContext context){
                 return  PopUpAlertDialogBox(
                     widget: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                    InkWell(
                      onTap:()
                     { Navigator.pop(context);
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateBusinessCardPage()));

                     },
                      child: Card(
                        elevation:2,
                        child: Container(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          height: 60,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            //border: Border.all(color: AppTheme.smallText,width: 0.2),
                            // boxShadow: [BoxShadow(
                            //   color: AppTheme.textColor,blurRadius: 1
                            // )]
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.card_travel_outlined,color: AppTheme.textColor,),
                              const SizedBox(width: 20,),
                              Text("Create Business",style: AppTheme.tabText,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                 Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateIndividualCardPage()));},
                      child: Card(
                        elevation:2,
                        child: Container(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          height: 60,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            //border: Border.all(color: AppTheme.smallText,width: 0.2),
                            // boxShadow: [BoxShadow(
                            //   color: AppTheme.textColor,blurRadius: 1
                            // )]
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.person,color: AppTheme.textColor,),
                              const SizedBox(width: 20,),
                              Text("Create Individual",style: AppTheme.tabText,)
                            ],
                          ),
                        ),
                      ),
                    ),
                   ],
                 ), height: 250, color: AppTheme.backColor,
                 );
               }),),
              const MenuTextButtonWidget(buttonText: 'My Card', buttonImage: AssetImage(AssetResources.myCard)),
              const MenuTextButtonWidget(buttonText: 'Pay Now', buttonImage:AssetImage(AssetResources.payNow),),
              const MenuTextButtonWidget(buttonText: 'Notification', buttonImage:AssetImage(AssetResources.notificationIcon)),
              const MenuTextButtonWidget(buttonText: 'About Us', buttonImage: AssetImage(AssetResources.aboutUs)),
              const MenuTextButtonWidget(buttonText: 'How To Use', buttonImage:AssetImage(AssetResources.howToUse)),
              const MenuTextButtonWidget(buttonText: 'Invite Friends', buttonImage:AssetImage(AssetResources.inviteFriends)),
              const MenuTextButtonWidget(buttonText: 'Settings', buttonImage:AssetImage(AssetResources.settingsIcon)),
              const MenuTextButtonWidget(buttonText: 'Feedback', buttonImage: AssetImage(AssetResources.feedbackIcon)),
              const MenuTextButtonWidget(buttonText: 'Partner With Us', buttonImage: AssetImage(AssetResources.partnerWithUs)),
              MenuTextButtonWidget(buttonText: 'Logout', buttonImage:const AssetImage(AssetResources.logOut),onTap: signUserOut,),

            ],

          ),
        ),
      ),
    );
  }
}


