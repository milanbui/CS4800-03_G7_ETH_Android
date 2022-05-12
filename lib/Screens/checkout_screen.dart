import 'package:cs4800_cipher_app/Data/DummyData.dart';
import 'package:cs4800_cipher_app/Screens/review_order_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Data/Product.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {

  @override
  Widget build(BuildContext context) {
    TextEditingController _cryptoAddress = TextEditingController();
    String dropdownValue = DummyData.wallets.first;
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 15,
                child: Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 35, 15, 0),
                    child:
                        Text("Checkout", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25))
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: Divider(height: 10, thickness: 3, color: Colors.black,)
              ),
              Expanded(
                flex: 15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 35, 15, 0),
                      child:
                      Text("Name: " + DummyData.UserName, style: TextStyle(fontSize: 20))
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(20, 15, 15, 15),
                        child:
                        Text("Email: " + DummyData.UserEmail, style: TextStyle(fontSize: 20))
                    ),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: Divider(height: 10, thickness: 3,)
              ),
              Expanded(
                flex: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.fromLTRB(20, 35, 15, 0),
                        child:
                        Text("Select Wallet: ", style: TextStyle(fontSize: 20))
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 35, 20, 0),
                      child: DropdownButton(
                        isExpanded: true,
                          value: dropdownValue,
                          items: DummyData.wallets.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: Divider(height: 10, thickness: 3,)
              ),
              SizedBox(height: 10),
              Expanded(
                  flex: 10,
                  child: Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF000000),
                        elevation: 0,
                        minimumSize: Size(350, 40),
                      ),
                      child: Text("Next", style: TextStyle(fontSize: 18)),
                      onPressed: () {

                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ReviewOrderScreen(dropdownValue))
                        );

                      },
                    ),
                  )
              ),

              SizedBox(height: 10)

            ],
          ),
      ),
    );
  }
}