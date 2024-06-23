import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tea_app/components/drink_tile.dart';
import 'package:tea_app/model/drink.dart';
import 'package:tea_app/model/shop.dart';
import 'package:tea_app/pages/order_page.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //user select a drink go to the order page 
  void goToOrderPage(Drink drink){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderPage(
      drink: drink,
    )));
  }
  @override
  Widget build(BuildContext context) {
    //basically we can consume everything in this bubble tea shop, through this value 
    return Consumer<BubbleTeaShop>(
      builder: (context, value, child)=>SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Text("Bubble Tea Shop",
            style: TextStyle(fontSize: 20),
            ),
            //now try to display the drink for sale , we are going to need a little bit state management 
            //to show this in different screen , so iam going to use provider 

            //List of drink for sale 
            //for the list iam just exxpanded to fill up the rest of the space 
            Expanded(
              child: ListView.builder(
                itemCount: value.shop.length,
                itemBuilder: (context, index){
                  //get individual drink from  shop first 
                  Drink individualDrink=value.shop[index];

                  //return drink as tile 
                  return DrinkTile(
                    drink: individualDrink,
                    onTap: ()=>goToOrderPage(individualDrink),
                    trailing: Icon(Icons.arrow_forward),
                    );

                }
                  
                  
                

              
                )
              ),

          ],
        ),
      ),
    ),
      );
  }
}