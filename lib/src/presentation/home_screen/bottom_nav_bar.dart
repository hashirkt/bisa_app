import 'package:bisa_app/src/presentation/home_screen/home_page.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:flutter/material.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int selectedIndex=0;

  final List<Widget> _list=[
    const HomePage(),
    const Text("data1"),
    const Text("data2"),

  ];

  void onItemTapped(int index){
    setState(() {
      selectedIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: _list.elementAt(selectedIndex),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Container(

            margin: const EdgeInsets.only(bottom: 30),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppTheme.textColor,

            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BottomNavigationBar(
                backgroundColor: AppTheme.textColor,
                elevation: 0,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined,),
                      label: "Home",
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.dashboard_outlined,),
                      label: "Dashboard"
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.more_outlined,),
                      label: "More"
                  ),
                ],
                currentIndex: selectedIndex,
                unselectedItemColor: Colors.grey,
                selectedItemColor: AppTheme.backColor,
                onTap: onItemTapped,

              ),
            ),
          ),
        ),
      ),
    );
  }
}
