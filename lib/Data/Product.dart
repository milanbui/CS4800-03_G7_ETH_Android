import 'package:flutter/material.dart';

class Product {
  String name;
  String price;
  Image image;
  String description;
  Product(this.name, this.price, this.description, this.image);

  String getName() {return name;}
  String getPrice() {return price;}
  Image getImageURL() {return image;}
  String getDescription() {return description;}
}