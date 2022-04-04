import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
                    Text("4", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45)),
                    SizedBox(width: 20,),
                    Text("Items in your cart", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25))
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 90,
              child: ListView(
                padding: EdgeInsets.all(20),
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row (
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Image.asset('assets/images/placeholder.png'),
                          SizedBox(width: 20,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Text("Product Name", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                              SizedBox(height: 5),
                              Text("\$30", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFFFF8383),
                                  elevation: 0,
                                  minimumSize: Size(130, 35),
                                ),
                                child: Text("Remove", style: TextStyle(fontSize: 15)),
                                onPressed: () {
                                },
                              ),
                            ],
                          ),
                        ]
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row (
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Image.asset('assets/images/placeholder.png'),
                          SizedBox(width: 20,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Text("Product Name", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                              SizedBox(height: 5),
                              Text("\$30", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFFFF8383),
                                  elevation: 0,
                                  minimumSize: Size(130, 35),
                                ),
                                child: Text("Remove", style: TextStyle(fontSize: 15)),
                                onPressed: () {
                                },
                              ),
                            ],
                          ),
                        ]
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row (
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Image.asset('assets/images/placeholder.png'),
                          SizedBox(width: 20,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Text("Product Name", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                              SizedBox(height: 5),
                              Text("\$30", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFFFF8383),
                                  elevation: 0,
                                  minimumSize: Size(130, 35),
                                ),
                                child: Text("Remove", style: TextStyle(fontSize: 15)),
                                onPressed: () {
                                },
                              ),
                            ],
                          ),
                        ]
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row (
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Image.asset('assets/images/placeholder.png'),
                          SizedBox(width: 20,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Text("Product Name", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                              SizedBox(height: 5),
                              Text("\$30", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFFFF8383),
                                  elevation: 0,
                                  minimumSize: Size(130, 35),
                                ),
                                child: Text("Remove", style: TextStyle(fontSize: 15)),
                                onPressed: () {
                                },
                              ),
                            ],
                          ),
                        ]
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}