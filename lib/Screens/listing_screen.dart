import 'package:flutter/material.dart';

class ListingScreen extends StatefulWidget {
  @override
  State<ListingScreen> createState() => _ListingScreenState();
}

class _ListingScreenState extends State<ListingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 15),
            Expanded(
                flex: 40,
                child: Image.asset('assets/images/placeholder.png', scale: 0.6)
            ),
            Expanded(
              flex: 40,
              child: Container(
                margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Column(
                  children: [
                    Text("Product Name", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15),
                    Text("\$30", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15),
                    Text("Description", style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 20,
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 70, 0, 25),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF000000),
                    elevation: 0,
                    minimumSize: Size(350, 40),
                  ),
                  child: Text("Add to Cart", style: TextStyle(fontSize: 18)),
                  onPressed: () {
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}