import 'package:cs4800_cipher_app/Data/DummyData.dart';
import 'package:cs4800_cipher_app/Screens/order_screen.dart';
import 'package:flutter/material.dart';

import '../Data/Product.dart';

class ViewOrdersScreen extends StatefulWidget {
  @override
  State<ViewOrdersScreen> createState() => _ViewOrdersScreenState();
}

class _ViewOrdersScreenState extends State<ViewOrdersScreen> {

  bool isEmpty = DummyData.orders.length == 0? true:false;

  Future<void> _pullRefresh() async
  {
    setState(() {
      isEmpty = DummyData.orders.length == 0? true:false;
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
                    // Image.asset('assets/images/full_cart.png'),
                    Icon(Icons.shopping_bag, size: 35,),
                    SizedBox(width: 15,),
                    Text(DummyData.orders.length.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
                    SizedBox(width: 10,),
                    Text("orders", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Divider(thickness: 5, color: Colors.black,),
            ),
            Expanded(
              flex: 90,
              child: RefreshIndicator(
                  onRefresh: _pullRefresh,
                  child:

                  ListView.builder(
                      padding: EdgeInsets.all(20),
                      itemCount: DummyData.orders.length,
                      itemBuilder: (BuildContext context,int index){
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => OrderScreen(index))
                            );
                          },
                          child: Container(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 80,
                                  child: Text(DummyData.orders.elementAt(index).getTimeStamp().month.toString()
                                      + " / " + DummyData.orders.elementAt(index).getTimeStamp().day.toString()
                                      + " / " + DummyData.orders.elementAt(index).getTimeStamp().year.toString()
                                      + " @ " + DummyData.orders.elementAt(index).getTimeStamp().hour.toString()
                                      + ":" + DummyData.orders.elementAt(index).getTimeStamp().minute.toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                ),
                                Expanded(
                                    flex: 30,
                                    child: Text(DummyData.orders.elementAt(index).getTotal().toString() + " ETH",
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
                                ),
                              ],
                            )
                          ),
                        );
                      }
                  )
              ),

            )
          ],
        ),
      ),
    );
  }
}