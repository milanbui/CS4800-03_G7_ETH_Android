import 'package:cs4800_cipher_app/Data/DummyData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Data/Order.dart';
import '../Data/Product.dart';

class ReviewOrderScreen extends StatefulWidget {
  String walletAddress;
  ReviewOrderScreen(this.walletAddress);
  @override
  State<ReviewOrderScreen> createState() => _ReviewOrderScreenState();
}

class _ReviewOrderScreenState extends State<ReviewOrderScreen> {

  double total = 0;

  @override
  initState() {
    total = calcTotal();
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
                    Text(product.getPrice().toString() + " ETH", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
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


  double calcTotal() {
    double sum = 0;

    for( int i = 0; i < DummyData.cartList.length; i++) {
      sum += double.parse(DummyData.cartList.elementAt(i).price);
    }

    return sum;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Center(
              child: Container(
                  margin: EdgeInsets.fromLTRB(20, 35, 15, 0),
                  child:
                  Text("Checkout", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25))
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Divider(height: 10, thickness: 3, color: Colors.black,)
          ),
          Expanded(
            flex: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.fromLTRB(20, 15, 15, 0),
                    child:
                    Text("Name: " + DummyData.UserName, style: TextStyle(fontSize: 20))
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(20, 15, 15, 0),
                    child:
                    Text("Email: " + DummyData.UserEmail, style: TextStyle(fontSize: 20))
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Divider(height: 10, thickness: 3,)
          ),
          Expanded(
            flex: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.fromLTRB(20, 15, 15, 0),
                    child:
                    Text("Review Order: ", style: TextStyle(fontSize: 20))
                ),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                          padding: EdgeInsets.all(20),
                          itemCount: DummyData.cartList.length,
                          itemBuilder: (BuildContext context,int index){
                            return cartItem(index);
                          }
                      ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Divider(height: 10, thickness: 3,)
          ),
          Container(
              margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Text(total.toStringAsFixed(2) + " ETH", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30))
          ),
          Container(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Divider(height: 10, thickness: 3,)
          ),
          Expanded(
              flex: 10,
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF000000),
                    elevation: 0,
                    minimumSize: Size(350, 40),
                  ),
                  child: Text("Complete Purchase", style: TextStyle(fontSize: 18)),
                  onPressed: () {

                    DummyData.orders.add(Order(DummyData.cartList.toList(), DateTime.now(), widget.walletAddress, total));


                    for(int i = 0; i < DummyData.cartList.length; i++) {
                      DummyData.ownedItems.add(DummyData.cartList.elementAt(i));
                      DummyData.productList.remove(DummyData.cartList.elementAt(i));
                    }

                    while(DummyData.cartList.isNotEmpty) {
                      DummyData.cartList.removeLast();
                    }

                    showDialog(context: context, builder: (context) {
                      return AlertDialog(
                          title: Text("Purchase Complete"),
                          content: Text(
                              "Your purchase has been completed.")
                      );
                    });
                    Navigator.pop(context);
                    Navigator.pop(context);

                  },
                ),
              )
          ),

          SizedBox(height: 10)

        ],
      ),
    );
  }
}