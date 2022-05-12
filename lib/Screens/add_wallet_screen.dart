import 'package:cs4800_cipher_app/Data/DummyData.dart';
import 'package:cs4800_cipher_app/Screens/checkout_screen.dart';
import 'package:flutter/material.dart';

import '../Data/Product.dart';

class AddWalletScreen extends StatefulWidget {
  @override
  State<AddWalletScreen> createState() => _AddWalletScreenState();
}

class _AddWalletScreenState extends State<AddWalletScreen> {

  @override
  Widget build(BuildContext context) {
    TextEditingController _addressController = TextEditingController();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 15,
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 35, 15, 0),
                child:
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.credit_card, size: 30),
                          SizedBox(width: 10,),
                          Text("Add New Crypto Wallet", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Divider(thickness: 5),
                   ]
                ),
              ),
            ),
            Expanded(
              // if > 0, keyboard is open
              flex: MediaQuery.of(context).viewInsets.bottom > 0.0 ? 30 : 75,
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextField(
                  controller: _addressController,
                  obscureText: false,
                  decoration: InputDecoration(
                    border:
                    OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'address',
                    labelStyle: TextStyle(fontSize: 18, color: Color(0xFF7C7C7C)),
                  ),
                ),
              ),

            ),
            Container(
                padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: Divider(height: 10, thickness: 3,)),
            SizedBox(height: 10),
            Expanded(
                flex: 10,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF000000),
                    elevation: 0,
                    minimumSize: Size(350, 40),
                  ),
                  child: Text("Add Wallet", style: TextStyle(fontSize: 18)),
                  onPressed: () {

                    if(!DummyData.wallets.contains(_addressController.text)) {
                      DummyData.wallets.add(_addressController.text);
                      showDialog(context: context, builder: (context) {
                        return AlertDialog(
                            title: Text("Wallet Added!"),
                            content: Text(
                                "The new wallet has been successfully added.")
                        );
                      });
                    }
                    else{
                      showDialog(context: context, builder: (context) {
                        return AlertDialog(
                            title: Text("Wallet Not Added"),
                            content: Text(
                                "This address has already been previously added.")
                        );
                      });
                    }
                    Navigator.pop(context);

                  },
                )
            ),

            SizedBox(height: 10)

          ],
        ),
      ),
    );
  }
}