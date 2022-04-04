import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30),
            Expanded(
              flex: 10,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 25),
                  Image.asset('assets/images/profile.png'),
                  SizedBox(width: 20),
                  Text('Profile', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30))
                ]
              ),
            ),
            Expanded(
              flex: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      elevation: 0,
                      minimumSize: Size(160, 35),
                    ),
                    child: Text("List New Product", style: TextStyle(fontSize: 15)),
                    onPressed: () {
                    },
                  ),
                  SizedBox(width: 25),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      elevation: 0,
                      minimumSize: Size(160, 35),
                    ),
                    child: Text("View Listings", style: TextStyle(fontSize: 15)),
                    onPressed: () {
                    },
                  ),
                ]
              ),
            ),
            Expanded(
              flex: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                    child: Text("Owned Items", style: TextStyle(fontSize: 20)),
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                                        primary: Colors.black,
                                        elevation: 0,
                                        minimumSize: Size(130, 35),
                                      ),
                                      child: Text("View Order", style: TextStyle(fontSize: 15)),
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
                                        primary: Colors.black,
                                        elevation: 0,
                                        minimumSize: Size(130, 35),
                                      ),
                                      child: Text("View Order", style: TextStyle(fontSize: 15)),
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}