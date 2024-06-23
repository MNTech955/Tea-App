import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tea_app/model/drink.dart';
import 'package:tea_app/model/shop.dart';

class OrderPage extends StatefulWidget {
  final Drink drink;
  const OrderPage({super.key, required this.drink});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  //customize sweet value
  double sweetValue=0.5;
  void customizeSweet(double newValue){
    setState(() {
      sweetValue=newValue;
    });
  }
  
  double iceValue=0.5;
  void customizeIce(double newValue){
    setState(() {
      iceValue=newValue;
    });
  }
  
  double pearlValue=0.5;
  void customizePearl(double newValue){
    setState(() {
      pearlValue=newValue;
    });
  }
  //add to cart method 
  void addToCart(){
    Provider.of<BubbleTeaShop>(context, listen: false).addToCart(widget.drink);
    //direct user back to the shop page 
    Navigator.pop(context);
    //let user know if has been sucessfuly added 
    showDialog(
      context: context,
       builder: (context)=>AlertDialog(
        title: Text("Successfuly addes to the Cart"),
       )
       );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.drink.name,style: TextStyle(color: Colors.white),),
      backgroundColor: Colors.brown,
      centerTitle: true,
      
      ),
      backgroundColor: Colors.brown[200],
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            //drink image 
            Center(child: Image.asset(widget.drink.imagePath,
            
          
            )),
        
            //slider to customize the drink
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      //color: Colors.red,
                      width: 100,
                      child: Text("Sweet")),
                    Expanded(
                      child: Slider(
                        value: sweetValue,
                        label: sweetValue.toString(),
                        divisions: 4,
                        //thumbColor: Colors.brown,   
                        activeColor: Colors.brown,               
                         onChanged: (value)=>customizeSweet(value),
                         ),
                    ),
                  ],
                ),
                       Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                     // color: Colors.red,
                      width: 100,
                      child: Text("Ice")),
                    Expanded(
                      child: Slider(
                        value: iceValue,
                        label: iceValue.toString(),
                        divisions: 4,
                        //thumbColor: Colors.brown,   
                        activeColor: Colors.brown,               
                         onChanged: (value)=>customizeIce(value),
                         ),
                    ),
                  ],
                ),
                       Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      //color: Colors.red,
                      width: 100,
                      child: Text("Pearls")),
                    Expanded(
                      child: Slider(
                        value: pearlValue,
                        label: pearlValue.toString(),
                        divisions: 4,
                        //thumbColor: Colors.brown,   
                        activeColor: Colors.brown,               
                         onChanged: (value)=>customizePearl(value),
                         ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20,),
            //add to cart button
            MaterialButton(
            child: Text("Add To Cart",
            style: TextStyle(color: Colors.white)
            ),
            color: Colors.brown,
            onPressed: addToCart,

              )
        
          ],
        ),
      ),
    );
  }
}