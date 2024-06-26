import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tea_app/model/shop.dart';
import 'package:tea_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>BubbleTeaShop(),
      builder: (context, child)=> MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.brown),
      
      home: const HomePage(),
    ),
      );
  }
}
