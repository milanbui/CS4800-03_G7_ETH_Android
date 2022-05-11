import 'package:flutter/material.dart';
import '../Data/DummyData.dart';

import 'package:cs4800_cipher_app/Screens/listing_screen.dart';



class MarketplaceScreen extends StatefulWidget {
  @override
  State<MarketplaceScreen> createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends State<MarketplaceScreen> {

  TextEditingController searchController = TextEditingController();

  Future<void> _pullRefresh() async
  {
    setState(() {

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
              child:
                RefreshIndicator(
                  onRefresh: _pullRefresh,
                  child: GridView.builder(
                  itemCount: DummyData.getItemCount(),
                  itemBuilder: (context, index) => Listing(index),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,  childAspectRatio: 0.75, mainAxisSpacing: 10, crossAxisSpacing: 10),
                  padding: const EdgeInsets.all(20),
                  ),
                )
                /*
                GridView.count(
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
                    child: Listing(0),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ListingScreen())
                      );
                    },
                    child: Listing(1),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ListingScreen())
                      );
                    },
                    child: Listing(),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ListingScreen())
                      );
                    },
                    child: Listing()
                  ),
                ],
              ),
              */
            )
          ],
        ),
      ),
    );
  }

  InkWell Listing(int index) {
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ListingScreen(index))
        );
      },
      child: Container(
        // margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        // padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        // decoration: BoxDecoration(
        //   color: Colors.grey[200],
        //     border: Border.all(
        //       color: Colors.grey,
        //       width: 3
        //     ),
        //     borderRadius: BorderRadius.all(Radius.circular(20)),
        //   // boxShadow: [BoxShadow(color: Colors.black)]
        //
        // ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(width:170, height: 170,child: DummyData.productList[index].image)),
              SizedBox(height: 5),
              Text(DummyData.productList[index].getName(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15)),
              // SizedBox(height: 5),
              Text(DummyData.productList[index].getPrice().toString() + " ETH", style: TextStyle(fontWeight: FontWeight.w300, color: Colors.black, fontSize: 13)),
            ]
        ),
        // color: Colors.grey[400],
      ),
    );

  }
}

