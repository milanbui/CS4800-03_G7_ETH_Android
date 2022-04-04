import 'package:flutter/material.dart';

import 'package:cs4800_cipher_app/Screens/listing_screen.dart';

class MarketplaceScreen extends StatefulWidget {
  @override
  State<MarketplaceScreen> createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends State<MarketplaceScreen> {

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: (MediaQuery.of(context).viewInsets.bottom == 0) ? 15 : 25,
              child: Container(
                margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
                child: TextField(
                  controller: searchController,
                  obscureText: false,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Color(0xFF6C6C6C)),
                    border:
                    OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'search',
                    labelStyle: TextStyle(fontSize: 18, color: Color(0xFF6C6C6C)),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: (MediaQuery.of(context).viewInsets.bottom == 0) ? 85 : 75,
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                childAspectRatio: 0.75,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ListingScreen())
                      );
                    },
                    child: Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Image.asset('assets/images/placeholder.png', scale: 0.8),
                            SizedBox(height: 10),
                            Text("Product Name", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                            SizedBox(height: 5),
                            Text("\$30", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                          ]
                      ),
                      color: Color(0xFF3C3C3C),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ListingScreen())
                      );
                    },
                    child: Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Image.asset('assets/images/placeholder.png', scale: 0.8),
                            SizedBox(height: 10),
                            Text("Product Name", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                            SizedBox(height: 5),
                            Text("\$30", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                          ]
                      ),
                      color: Color(0xFF3C3C3C),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ListingScreen())
                      );
                    },
                    child: Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Image.asset('assets/images/placeholder.png', scale: 0.8),
                            SizedBox(height: 10),
                            Text("Product Name", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                            SizedBox(height: 5),
                            Text("\$30", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                          ]
                      ),
                      color: Color(0xFF3C3C3C),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ListingScreen())
                      );
                    },
                    child: Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Image.asset('assets/images/placeholder.png', scale: 0.8),
                            SizedBox(height: 10),
                            Text("Product Name", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                            SizedBox(height: 5),
                            Text("\$30", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                          ]
                      ),
                      color: Color(0xFF3C3C3C),
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