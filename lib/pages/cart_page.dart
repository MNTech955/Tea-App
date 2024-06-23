import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tea_app/components/drink_tile.dart';
import 'package:tea_app/model/drink.dart';
import 'package:tea_app/model/shop.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  //remove drink form cart
  void removeFromCart(Drink drink){
    Provider.of<BubbleTeaShop>(context, listen: false).removeFromCart(drink);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BubbleTeaShop>(
      builder: (context, value, child)=>SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            //Heading
            Text("Your Cart",
            style: TextStyle(fontSize: 20),
            ),
            //List of cart item
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index){
                  //get individual drink in the cart first
                  Drink drink=value.cart[index];
                  //return as tile 
                  return DrinkTile(
                    drink: drink,
                     onTap: ()=>removeFromCart(drink),
                     trailing: Icon(Icons.delete),
                     );
                }
               

                )
              ),
              MaterialButton(
                child: Text("Pay",
                style: TextStyle(color: Colors.white),
                ),
                color: Colors.brown,
                onPressed: (){},
                
                )

            
          ],
        ),
      ),
    )
      );
  }
}