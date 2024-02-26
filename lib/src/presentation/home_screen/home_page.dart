import 'package:bisa_app/src/presentation/home_screen/widget/customer_name_field_widget.dart';
import 'package:bisa_app/src/presentation/more_screen/more_page.dart';
import 'package:bisa_app/src/utils/resources/asset_resources.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:flutter/material.dart';

import '../widget/search_text_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: InkWell(
                onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const MorePage())),
                child: const Image(image: AssetImage(AssetResources.appLogo),color: AppTheme.backColor,height: 22,width: 59,)),
            centerTitle: false,
            actions:  [
              IconButton(onPressed: (){}, icon: const Icon(Icons.notifications,color: AppTheme.backColor,))
            ],
            backgroundColor: AppTheme.textColor,
            bottom:  PreferredSize(preferredSize: const Size.square(130), child: Column(
              children: [
                Container(

                  margin: const EdgeInsets.only(bottom: 15,left: 40,right: 40,),
                    padding: const EdgeInsets.only(left: 25,right: 5),

                    decoration: BoxDecoration(
                      color: AppTheme.backColor,
                      borderRadius: BorderRadius.circular(30),),
                    child: const SearchTextField()
                ),
                Container(
                  height: 55,

                    width: double.infinity,
                    //padding: const EdgeInsets.only(left: 10,right: 10),

                    decoration: const BoxDecoration(
                      color: AppTheme.backColor,
                      ),
                  child:  TabBar(
                    indicatorPadding: const EdgeInsets.only(left: 10,right: 10),
                    dividerColor: AppTheme.backColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    unselectedLabelColor: AppTheme.smallText,
                    unselectedLabelStyle: AppTheme.smallHead,
                    indicatorColor: Colors.black87,
                      labelColor: AppTheme.textColor,
                      labelStyle: AppTheme.tabText,
                      tabs: const [
                        Tab(child: Text('Recent')),
                        Tab(child: Text('Saved')),
                        Tab(child: Text('Promotions')),
                      ]),

                ),
              ],
            )),
          ),
          body: TabBarView(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(left: 20,right: 20),
                width: double.infinity,
                child: const SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomerNameField(nameText: 'Customer Name',
                        companyNameText: 'Customer Company Private Limited',
                        checkedIcon: Icons.check_circle, profileImage: AssetImage(AssetResources.userDp),),
                      CustomerNameField(nameText: 'Customer Name',
                        companyNameText: 'Customer Company Private Limited', profileImage: AssetImage(AssetResources.user1Dp),
                      ),
                      CustomerNameField(nameText: 'Customer Name',
                        companyNameText: 'Customer Company Private Limited',
                        checkedIcon: Icons.check_circle, profileImage: AssetImage(AssetResources.user1Dp),),
                      CustomerNameField(nameText: 'Customer Name',
                        companyNameText: 'Customer Company Private Limited', profileImage: AssetImage(AssetResources.userDp),),
                      CustomerNameField(nameText: 'Customer Name',
                        companyNameText: 'Customer Company Private Limited',
                        checkedIcon: Icons.check_circle, profileImage: AssetImage(AssetResources.user2Dp),),
                      CustomerNameField(nameText: 'Customer Name',
                        companyNameText: 'Customer Company Private Limited', profileImage: AssetImage(AssetResources.userDp),),
                      CustomerNameField(nameText: 'Customer Name',
                        companyNameText: 'Customer Company Private Limited',
                        checkedIcon: Icons.check_circle, profileImage: AssetImage(AssetResources.user1Dp),),
                      CustomerNameField(nameText: 'Customer Name',
                        companyNameText: 'Customer Company Private Limited', profileImage: AssetImage(AssetResources.userDp),),
                    ],
                  ),
                ),
              ),
              const Icon(Icons.directions_transit, size: 350),
              const Icon(Icons.directions_car, size: 350),
            ],
          ),
        ),
      ),
    );
  }
}




