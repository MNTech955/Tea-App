import 'package:flutter/material.dart';
import 'package:tea_app/components/bottom_nav_bar.dart';
import 'package:tea_app/pages/cart_page.dart';
import 'package:tea_app/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex=0;
  //naviagte bottom bar
  void NavigateBottomBar(int newIndex){
    setState(() {
         _selectedIndex=newIndex;
    });
 

  }
  //page to display
  final List<Widget> _pages=[
    //shop page 
    ShopPage(),
    //cart page 
    CartPage(),


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index)=>NavigateBottomBar(index),
      ),
      body: _pages[_selectedIndex]
    );
  }
}