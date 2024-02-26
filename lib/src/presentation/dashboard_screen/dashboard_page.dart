import 'package:bisa_app/src/presentation/dashboard_screen/widget/grid_view_card.dart';
import 'package:flutter/material.dart';
import '../../utils/resources/asset_resources.dart';
import '../../utils/resources/theme.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       elevation: 0,
        backgroundColor: AppTheme.backColor,
        toolbarHeight: 100,
        title: const Image(image: AssetImage(AssetResources.appLogo),height: 40,width: 105,),
       centerTitle: true,
       bottom: const PreferredSize(preferredSize: Size.square(0), child: Padding(
         padding: EdgeInsets.only(left: 20,right: 20),
         child: Divider(height: 0,thickness: 0.5,color: AppTheme.smallText,),
       )),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
        height: double.infinity,
        width: double.infinity,
       // color: Colors.blue,
        child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          mainAxisSpacing: 10,crossAxisSpacing: 10,
          mainAxisExtent: 100,
        ),
        children: [
          GridViewCard(subtitle: Text("10",style: AppTheme.headTextWhite,), title: 'My Card',),
          GridViewCard(subtitle: Text("10",style: AppTheme.headTextWhite,), title: 'Shared',),
          GridViewCard(subtitle: Text("10",style: AppTheme.headTextWhite,), title: 'Saved Candidates',),
          const GridViewCard(subtitle: Icon(Icons.add_circle,color: Colors.green,size: 26,), title: 'Create account',),


        ],
        ),
      ),
    );
  }
}


