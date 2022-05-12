import 'package:flutter/material.dart';
import '../Data/DummyData.dart';

import 'package:cs4800_cipher_app/Screens/listing_screen.dart';

import '../Data/Product.dart';



class MarketplaceScreen extends StatefulWidget {
  @override
  State<MarketplaceScreen> createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends State<MarketplaceScreen> {
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();
  List<Product> filtered = DummyData.productList;

  Future<void> _pullRefresh() async
  {
    setState(() {

    });
  }

  void setIsSearching() {
    setState(() {
      isSearching = !isSearching;

      if(isSearching) {
        filtered = [];
        for(int i = 0; i < DummyData.productList.length; i++) {
          if(DummyData.productList.elementAt(i).name.contains(searchController.text)) {
            filtered.add(DummyData.productList.elementAt(i));
          }
        }
      }
      else{
        filtered = DummyData.productList;
      }
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
                child: Row(
                  children: [
                    Expanded(
                      flex: 70,
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
                    SizedBox(width: 10),
                    Expanded(
                      flex: 30,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF000000),
                          elevation: 0,
                          minimumSize: Size(350, 40),
                        ),
                        child: Text("Search", style: TextStyle(fontSize: 18)),
                        onPressed: () {
                          setIsSearching();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: (MediaQuery.of(context).viewInsets.bottom == 0) ? 85 : 75,
              child:
                RefreshIndicator(
                  onRefresh: _pullRefresh,
                  child: GridView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    return Listing(index);

                    },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,  childAspectRatio: 0.75, mainAxisSpacing: 10, crossAxisSpacing: 10),
                  padding: const EdgeInsets.all(20),
                  ),
                )
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
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(width:170, height: 170,child: filtered[index].image)),
              SizedBox(height: 5),
              Text(filtered[index].getName(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15)),
              Text(filtered[index].getPrice().toString() + " ETH", style: TextStyle(fontWeight: FontWeight.w300, color: Colors.black, fontSize: 13)),
            ]
        ),
      ),
    );

  }
}

