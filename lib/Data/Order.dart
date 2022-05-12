import 'Product.dart';

class Order {
  List<Product> _items;
  DateTime _timeStamp;
  String _walletUsed;
  double _total;

  Order(this._items, this._timeStamp, this._walletUsed, this._total);

  List<Product> getItems(){return this._items;}
  DateTime getTimeStamp(){return this._timeStamp;}
  String getWalletUsed(){return this._walletUsed;}
  double getTotal(){return this._total;}
}