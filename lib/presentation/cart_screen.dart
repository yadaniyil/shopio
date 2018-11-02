import 'package:flutter/material.dart';
import 'package:shop/containers/product_details.dart';
import 'package:shop/models/cart_model.dart';
import 'package:shop/models/product_model.dart';

class CartScreen extends StatelessWidget {
  final List<CartModel> cartProducts;
  final Function(ProductModel) incrementProductQuantity;
  final Function(ProductModel) decrementProductQuantity;
  final Function(ProductModel) removeProductFromCart;

  CartScreen(
      {Key key,
      @required this.cartProducts,
      this.incrementProductQuantity,
      this.decrementProductQuantity,
      this.removeProductFromCart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (cartProducts.isEmpty) {
      return _noCartItems;
    } else {
      return _cartItems(context);
    }
  }

  Widget get _noCartItems {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.shopping_cart, size: 120.0, color: Colors.blueAccent),
          SizedBox(height: 40.0),
          Text('Your shopping cart is empty',
              textAlign: TextAlign.center, textScaleFactor: 1.2)
        ],
      ),
    );
  }

  _cartItems(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 11,
            child: ListView.builder(
                itemCount: cartProducts.length,
                itemBuilder: (context, index) {
                  return getRow(context, index);
                }),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10.0,
                  )
                ],
              ),
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Total:',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold)),
                      Text(_calculateTotalPrice(),
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 4.0),
                  RaisedButton(
                    color: Theme.of(context).accentColor,
                    onPressed: () {},
                    child: Text('Proceed to checkout'),
                    textColor: Colors.white,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getRow(BuildContext context, int index) {
    var item = cartProducts[index];
    return Card(
        child: InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => ProductDetails(
                  product: item.product,
                )));
      },
      child: Container(
        height: 100.0,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Image.network(
                item.product.imageLink,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _itemNameAndRemoveRow(item.product),
                    _itemCounterAndPriceRow(item, context),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  _itemCounterAndPriceRow(CartModel item, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            IconButton(
              icon: item.quantity > 1
                  ? Icon(Icons.remove_circle_outline,
                      color: Theme.of(context).accentColor)
                  : Icon(Icons.remove_circle_outline, color: Colors.grey),
              onPressed: () {
                if (item.quantity > 1) {
                  decrementProductQuantity(item.product);
                }
              },
            ),
            Text(item.quantity.toString()),
            IconButton(
              icon: Icon(Icons.add_circle_outline,
                  color: Theme.of(context).accentColor),
              onPressed: () {
                incrementProductQuantity(item.product);
              },
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Text(item.getTotalPrice(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
        ),
      ],
    );
  }

  _itemNameAndRemoveRow(ProductModel item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(item.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
        IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              removeProductFromCart(item);
            },
            padding: EdgeInsets.zero)
      ],
    );
  }

  _calculateTotalPrice() {
    double price = 0.0;
    cartProducts.forEach((item) => price += item.getTotalPriceDouble());
    return '\$$price';
  }
}
