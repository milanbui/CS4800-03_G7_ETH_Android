import 'package:flutter/material.dart';

import 'Order.dart';
import 'Product.dart';

class DummyData
{
  static int itemCount = 5; // Not totally sure if this is still necessary but if you want to remove it, sure

  // products listed on marketplace_screen
  static List<Product> productList = List.empty(growable: true);

  // products listed in cart_screen
  static List<Product> cartList = List.empty(growable: true);

  // products listed in user_listings_screen
  static List<Product> userListings = List.empty(growable: true);

  // products listed in profile_screen under Owned Items
  static List<Product> ownedItems = List.empty(growable: true);

  // list of crypto wallets connected
  static List<String> wallets = List.empty(growable: true);

  // list of crypto wallets connected
  static List<Order> orders = List.empty(growable: true);

  // for login_screen credentials
  static String UserEmail = "user@email.com";
  static String UserPW = "pw";
  static String UserName = "John Smith"; // Not necessary yet?

  DummyData() {
    productList.add(new Product("Neon Disclosure", "29.99", "A rare instance of a kirby in the wild for a hunt", Image.asset('assets/images/disclosure.png', fit: BoxFit.cover)));
    productList.add(new Product("Waverly World", "1.99", "I sell waterguns full of cat pee to children", Image.asset('assets/images/creativity.jpg', fit: BoxFit.cover)));
    productList.add(new Product("Abstract", "95.99", "Only grapes are accepted for payment", Image.asset('assets/images/abstract.jpg', fit: BoxFit.cover)));
    productList.add(new Product("Circles", "42.34", "This is NFT1", Image.asset('assets/images/yellowcircles.jpg', fit: BoxFit.cover)));
    productList.add(new Product("Pop Art", "29.23", "This is NFT1", Image.asset('assets/images/tiger.jpg',  fit: BoxFit.cover)));

    productList.add(new Product("Grass Is Greener", "4.53", "Grass is greener where you water it :)", Image.asset('assets/images/cuphead.jpg',  fit: BoxFit.cover)));
    productList.add(new Product("Cuphead", "0.97", "He needs som milk", Image.asset('assets/images/greenergrass.jpg',  fit: BoxFit.cover)));

    wallets.add("0xb794f5ea0ba39494ce839613fffba74279579268");
  }

  static void addToCart(Product product)
  {
    cartList.add(product);
  }

  static void addToListings(product) {
    productList.add(product);
    userListings.add(product);
    itemCount++;
  }


  static void removeFromListings(product)
  {
    productList.remove(product);
    userListings.remove(product);
    itemCount--;
  }

  static getItemCount() {
    return productList.length;

  }

  // If a certain product is listed by the current user themselves,
  // that product will not have the button "Add to Cart"
  static IsUserListedProduct(Product currentViewingProduct) {
    if(userListings.contains(currentViewingProduct))
      return true;
    else
      return false;
  }
}