import 'package:flutter/material.dart';

import '../Data/DummyData.dart';
import '../Data/Product.dart';

class ListingScreen extends StatefulWidget {
  int productListIndex;
  ListingScreen(this.productListIndex);

  @override
  State<ListingScreen> createState() => _ListingScreenState(DummyData.productList[productListIndex]);
}

class _ListingScreenState extends State<ListingScreen> {
  Product currentViewingProduct;
  _ListingScreenState(this.currentViewingProduct);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 70),
            Expanded(
                flex: 40,
                child: currentViewingProduct.image
                // Ink.image(
                //   image: currentViewingProduct.image.image,
                //   fit: BoxFit.cover,
                //   width: 350,
                //   height: 128,
                //   // child: InkWell(onTap: onClicked),
                // ),
            ),
            Expanded(
              flex: 30,
              child: Container(
                margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
                child: Column(
                  children: [
                    Text(currentViewingProduct.getName(), style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15),
                    Text(currentViewingProduct.getPrice().toString() + " ETH", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15),
                    Text(currentViewingProduct.getDescription(), style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
            !DummyData.IsUserListedProduct(currentViewingProduct)?
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
                    DummyData.addToCart(currentViewingProduct);
                    showDialog(context: context, builder: (context) {
                      return AlertDialog(
                        title: Text("Added to Cart!"),
                        content: Text(currentViewingProduct.getName() + " has been successfully added to cart.")
                      );
                    });

                  },
                ),
              ),
            ) : SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}