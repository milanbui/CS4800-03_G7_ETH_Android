import 'dart:io' as io;

import 'package:cs4800_cipher_app/Widgets/picture_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

import '../Data/DummyData.dart';
import '../Data/Product.dart';

class ListNewProduct extends StatefulWidget {

  @override
  State<ListNewProduct> createState() => _ListNewProductState();
}

class _ListNewProductState extends State<ListNewProduct> {

  TextEditingController productName = TextEditingController();
  TextEditingController productPrice = TextEditingController();
  TextEditingController productDescription = TextEditingController();
  Image photo = Image.asset('assets/images/placeholder.png');
  bool photoChanged = false;

  // File productPhoto = Image.asset('assets/images/placeholder.png') as File;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.wallet_giftcard, size: 30),
                      SizedBox(width: 10,),
                      Text("List New Item", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Divider(thickness: 5),
                  SizedBox(height: 5,),
                  SizedBox(height: 5,),
                  Text("Listing Photo", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                ]
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: !photoChanged? 200 : photo.height,
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(0,10,0,10),
                  // padding: EdgeInsets.fromLTRB(0, 10,0, 10),
                  color: Colors.grey[300],
                  child: !photoChanged?
                  InkWell(
                      child: Icon(Icons.add_a_photo_outlined, size: 48),
                      onTap: () {
                        _upload('Gallery');
                      }
                  )
                      :
                  PictureWidget(
                    imagePath: photo,
                    onClicked: () {
                      _upload("Gallery");
                      setState(() {

                      });
                    },
                  ),),

              ],
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Listing Name", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  TextFormField(
                    controller: productName,
                    decoration: InputDecoration(hintText: 'Example Product Name'),
                  ),
                  SizedBox(height: 10),
                  Text("Listing Price", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  TextFormField(
                    controller: productPrice,
                    decoration: InputDecoration(hintText: 'Price'),
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                  ),
                  SizedBox(height: 10),
                  Text("Listing Description", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  TextField(
                    keyboardType: TextInputType.text,
                    controller: productDescription,
                    // keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(hintText: 'This is a great product made by Someone Someone.'),
                    maxLines: null,
                  ),
                ]
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF000000),
                elevation: 0,
                minimumSize: Size(350, 40),
              ),
              child: Text("Add to Listings", style: TextStyle(fontSize: 18)),
              onPressed: () {
                photoChanged = false;
                DummyData.addToListings( Product(productName.text, productPrice.text, productDescription.text, photo));
                showDialog(context: context, builder: (context) {
                  return AlertDialog(
                      title: Text("Added to Listings!"),
                      content: Text(productName.text + " has been successfully added to your listings.")
                  );
                });
                Navigator.pop(context);

              },
            )

          ],

        ),
      ),
      // body:Center(
      //   child: Padding(
      //     padding: const EdgeInsets.fromLTRB(25,0,25,0),
      //     child:
      //   )


      )
    );
  }

  Future<void> _upload(String inputSource) async {
    final picker = ImagePicker();
    XFile? pickedImage;

    pickedImage = await picker.pickImage(
        source: inputSource == 'camera'
            ? ImageSource.camera
            : ImageSource.gallery,
        maxWidth: 1920);

    int x = 20;
    pickedImage != null?
    await showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Author and Description'),
        content: SingleChildScrollView(
            child: Text("Image has been uploaded")
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () async {
              Navigator.of(context).pop();

              final String fileName = path.basename(pickedImage!.path);
              photo = Image.file(io.File(pickedImage.path), fit: BoxFit.cover);
              photoChanged = true;
              // photoURL = pickedImage.path;
/*
              // Uploading the selected image with some custom meta data
              await storage.ref(fileName).putFile(
                  imageFile,
                  SettableMetadata(customMetadata: {
                    'uploaded_by': 'Peepeepoopoohead',
                    'description': 'poo poo description'
                  }));

              photoURL = await storage.ref(fileName).getDownloadURL();
*/
              // Refresh the UI
              setState(() {});
            },
          ),
        ],
      );
    }) : null;
  }
}