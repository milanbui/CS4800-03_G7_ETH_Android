import 'package:cs4800_cipher_app/Data/DummyData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Data/Order.dart';
import '../Data/Product.dart';

class OrderScreen extends StatefulWidget {
  int index;
  OrderScreen(this.index);
  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  Container item(int index)
  {
    Product product = DummyData.orders.elementAt(widget.index).getItems().elementAt(index);
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
                  Text("Order", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25))
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Divider(height: 10, thickness: 3, color: Colors.black,)
          ),
          Expanded(
            flex: 10,
            child:
                Center(
                  child:
                      Text(DummyData.orders.elementAt(widget.index).getTimeStamp().month.toString()
                          + " / " + DummyData.orders.elementAt(widget.index).getTimeStamp().day.toString()
                          + " / " + DummyData.orders.elementAt(widget.index).getTimeStamp().year.toString()
                          + " @ " + DummyData.orders.elementAt(widget.index).getTimeStamp().hour.toString()
                          + ":" + DummyData.orders.elementAt(widget.index).getTimeStamp().minute.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Divider(height: 5, thickness: 3,)
          ),
          Expanded(
            flex: 60,
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
                        itemCount: DummyData.orders.elementAt(widget.index).getItems().length,
                        itemBuilder: (BuildContext context,int index){
                          return item(index);
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
              child: Text(DummyData.orders.elementAt(widget.index).getTotal().toString() + " ETH", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30))
          ),
          Container(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Divider(height: 10, thickness: 3,)
          ),

          SizedBox(height: 10)

        ],
      ),
    );
  }
}