import 'package:bisa_app/src/presentation/dashboard_screen/dashboard_page.dart';
import 'package:bisa_app/src/presentation/home_screen/home_page.dart';
import 'package:bisa_app/src/presentation/more_screen/more_page.dart';
import 'package:bisa_app/src/utils/resources/asset_resources.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:flutter/material.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int selectedIndex=0;
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  final List<Widget> _list=[
    const HomePage(),
    const DashboardPage(),

  ];

  void onItemTapped(int index){
   index == 2
       ? _drawerKey.currentState!.openEndDrawer()
       : setState(() {
     selectedIndex=index;
   });

  }

  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: _drawerKey,
        body: Center(
          child: _list.elementAt(selectedIndex),
        ),

        endDrawer: const MorePage(),
        bottomNavigationBar:
        Container(
          padding: const EdgeInsets.only(bottom: 20,left: 20,right: 20),
          width: double.infinity,
          decoration: const BoxDecoration(

          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: AppTheme.textColor,
              elevation: 0,
              items:  const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage(AssetResources.homeIcon)),
                    label: "Home",
                ),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage(AssetResources.dashboardIcon)),
                    label: "Dashboard"
                ),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage(AssetResources.moreIcon)),
                    label: "More",

                ),
              ],
              currentIndex: selectedIndex,
              showUnselectedLabels: true,
              unselectedItemColor: Colors.grey,
              selectedItemColor: AppTheme.backColor,
              onTap: onItemTapped,

            ),
          ),
        ),
      ),
    );
  }
}
