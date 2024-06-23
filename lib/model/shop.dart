//import 'dart:io';
//import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:tea_app/model/drink.dart';

class BubbleTeaShop extends ChangeNotifier{
  //List of drnk for sale
  final List<Drink> _shop=[
    //pearl milk tea
    Drink(name: "Pearl Milk Tea", imagePath: "assets/aas.png", price: "4.00"),
    
  ];
  //List of drink in user cart
  final List<Drink> _userCart=[];
  //lets also be create some getter that we can access it in differents file 

  //get drink for ssale 
  List<Drink> get shop=>_shop;
  //get user cart
   List<Drink> get cart=>_userCart;
   //so i goona need which drink i need to add to cart, if 
   // i know then we add it to the cart

  //add drinks to cart
  void addToCart(Drink drink){
    _userCart.add(drink);
    //we need to notify the the listener , when any change need to made for the Ui, we want to reflect that in cart page

    notifyListeners();

  }
  //remove from the cart
  void removeFromCart(Drink drink){
    _userCart.remove(drink);
    notifyListeners();
  }

}