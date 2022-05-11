import 'package:cs4800_cipher_app/Data/DummyData.dart';
import 'package:cs4800_cipher_app/Screens/user_listings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'list_product_screen.dart';

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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ListNewProduct()),
                      );
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserListingList()),
                      );
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
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Owned Items", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Divider(thickness: 5),
                      ],
                    )

                  ),

                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: _pullRefresh,
                      child: ListView.builder(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        itemCount: DummyData.ownedItmes.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ownedItem(index);
                        },


                      ),
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

  Widget ownedItem(int index) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row (
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Ink.image(
                fit: BoxFit.cover,
                image: DummyData.ownedItmes[index].image.image,
                width:128,
              height: 128,
            ),
            SizedBox(width: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: 10),
                Text(DummyData.ownedItmes[index].getName(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                // SizedBox(height: 5),
                Text(DummyData.ownedItmes[index].getPrice() + " ETH", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
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
    );
  }

  Future<void> _pullRefresh() async {
    setState(() {

    });
  }
}