import 'package:cs4800_cipher_app/Data/DummyData.dart';
import 'package:cs4800_cipher_app/Screens/add_wallet_screen.dart';
import 'package:cs4800_cipher_app/Screens/user_listings_screen.dart';
import 'package:flutter/material.dart';

import 'list_product_screen.dart';

class WalletScreen extends StatefulWidget {
  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
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
                    Expanded(
                        flex: 30,
                        child: Image.asset('assets/images/profile.png')
                    ),
                    Expanded(
                        flex: 50,
                        child: Text(DummyData.UserName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30))
                    ),
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
                      child: Text("Connect new crypto Wallet", style: TextStyle(fontSize: 15)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddWalletScreen()),
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
                          Text("Connected Wallets", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          Divider(thickness: 5),
                        ],
                      )

                  ),

                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: _pullRefresh,
                      child: ListView.builder(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        itemCount: DummyData.wallets.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 75,
                                  child: Container(
                                      child: Text(DummyData.wallets.elementAt(index), style: TextStyle(fontSize: 20))
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  flex: 30,
                                  child: DummyData.wallets.length == 1 ? Container() : ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xFFFF8383),
                                      elevation: 0,
                                      minimumSize: Size(160, 35),
                                    ),
                                    child: Text("Remove", style: TextStyle(fontSize: 15)),
                                    onPressed: () {
                                      setState(() {
                                        DummyData.wallets.removeAt(index);
                                      });
                                    },
                                  ),
                                ),
                              ],
                            )
                          );
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

  Future<void> _pullRefresh() async {
    setState(() {

    });
  }
}