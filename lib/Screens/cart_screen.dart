import 'package:cs4800_cipher_app/Data/DummyData.dart';
import 'package:cs4800_cipher_app/Screens/checkout_screen.dart';
import 'package:flutter/material.dart';

import '../Data/Product.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  double total = 0;

  initState() {
    total = calcTotal();
  }

  double calcTotal() {
    double sum = 0;

    for( int i = 0; i < DummyData.cartList.length; i++) {
      sum += double.parse(DummyData.cartList.elementAt(i).price);
    }

    return sum;
  }

  Container cartItem(int index)
  {
    Product product = DummyData.cartList[index];
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        children: [
          Row (
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Ink.image(
                  image: product.image.image,
                  fit: BoxFit.cover,
                  width: 128,
                  height: 128,
                  // child: InkWell(onTap: onClicked),
                ),
                SizedBox(width: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(product.getName(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    SizedBox(height: 5),
                    Text("\$" + product.getPrice().toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFFF8383),
                        elevation: 0,
                        minimumSize: Size(130, 35),
                      ),
                      child: Text("Remove", style: TextStyle(fontSize: 15)),
                      onPressed: () {
                        DummyData.cartList.removeAt(index);
                        showDialog(context: context, builder: (context) {
                          return AlertDialog(
                              title: Text("Removed from Cart!"),
                              content: Text(product.getName() + " has been successfully removed from cart.")
                          );
                        });
                        setState(() {
                          total = calcTotal();
                        });
                      },
                    ),
                  ],
                ),
              ]
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Divider(thickness: 2,),
          )
        ],
      ),
    );
  }

  Future<void> _pullRefresh() async
  {
    setState(() {
      total = calcTotal();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 15,
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 35, 15, 0),
                child: Row(
                  children: [
                    Image.asset('assets/images/full_cart.png'),
                    SizedBox(width: 20,),
                    Text(DummyData.cartList.length.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45)),
                    SizedBox(width: 20,),
                    Text("Items in your cart", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25))
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: Divider(height: 10, thickness: 3, color: Colors.black,)),
            Expanded(
              flex: 75,
              child: RefreshIndicator(
                onRefresh: _pullRefresh,
                child: ListView.builder(
                    padding: EdgeInsets.all(20),
                    itemCount: DummyData.cartList.length,
                    itemBuilder: (BuildContext context,int index){
                      return cartItem(index);
                    }
                ),
              ),

            ),
            Container(
                padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: Divider(height: 10, thickness: 3,)),
            Container(
                margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: Text(total.toStringAsFixed(2) + " ETH", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30))
            ),
            Container(
                padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: Divider(height: 10, thickness: 3,)
            ),
            SizedBox(height: 10),
            Expanded(
              flex: 10,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF000000),
                  elevation: 0,
                  minimumSize: Size(350, 40),
                ),
                child: Text("Proceed to Purchase", style: TextStyle(fontSize: 18)),
                onPressed: () {

                  Navigator.push(
                    context,
                      MaterialPageRoute(builder: (context) => CheckoutScreen())
                  );

                },
              )
            ),

            SizedBox(height: 10)

          ],
        ),
      ),
    );
  }
}