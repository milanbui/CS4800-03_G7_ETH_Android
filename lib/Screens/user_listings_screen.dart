import 'package:cs4800_cipher_app/Data/DummyData.dart';
import 'package:flutter/material.dart';

import '../Data/Product.dart';

class UserListingList extends StatefulWidget {
  @override
  State<UserListingList> createState() => _UserListingListState();
}

class _UserListingListState extends State<UserListingList> {

  bool isEmpty = DummyData.userListings.length == 0? true:false;

  Container listing(int index)
  {
    Product product = DummyData.userListings[index];
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        children: [
          Row (
              // mainAxisAlignment: MainAxisAlignment.start,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(height: 10),
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

                        showDialog(context: context, builder: (context) {
                          return AlertDialog(
                              title: Text("Remove from Listings"),
                              content: Text("Are you sure to remove " + product.name + " from current listings?"),
                            actions: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFFFF8383),
                                    elevation: 0,
                                    minimumSize: Size(130, 35),
                                  ),
                                  onPressed: (){
                                    DummyData.productList.remove(DummyData.userListings[index]);
                                DummyData.userListings.removeAt(index);
                                Navigator.pop(context);
                              }, child: Text("Yes")),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFFFF8383),
                                    elevation: 0,
                                    minimumSize: Size(130, 35),
                                  ),
                                  onPressed: (){
                                Navigator.pop(context);
                              }, child: Text("No"))
                            ]
                          );
                        });
                        setState(() {

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

  Future<void> _pullRefresh() async
  {
    setState(() {
      isEmpty = DummyData.userListings.length == 0? true:false;
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
                    Icon(Icons.wallet_giftcard, size: 35,),
                    SizedBox(width: 15,),
                    Text(DummyData.userListings.length.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
                    SizedBox(width: 10,),
                    Text("listings", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25))
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
                    itemCount: DummyData.userListings.length,
                    itemBuilder: (BuildContext context,int index){
                      return listing(index);
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