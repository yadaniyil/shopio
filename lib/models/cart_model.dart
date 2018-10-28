import 'package:shop/models/product_model.dart';

class CartModel {
  ProductModel _product;
  int _quantity;

  CartModel(this._product, this._quantity);

  incrementQuantity() => _quantity++;
  decrementQuantity() => _quantity--;

  int get quantity => _quantity;
  ProductModel get product => _product;

  String getTotalPrice() {
    return '\$${_quantity * _product.getPriceDouble()}';
  }
}