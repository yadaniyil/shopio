import 'package:flutter/material.dart';
import 'package:shop/containers/product_details.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/presentation/loading_indicator.dart';

class FavouritesList extends StatelessWidget {
  final List<ProductModel> favouriteProducts;
  final bool isLoading;
  final Function(ProductModel) addToCart;

  FavouritesList(
      {Key key,
      @required this.favouriteProducts,
      @required this.isLoading,
      @required this.addToCart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getBody();
  }

  Widget _getBody() {
    if (isLoading) {
      return LoadingIndicator();
    } else if (favouriteProducts.isEmpty) {
      return _noFavouriteItems;
    } else {
      return _favouriteItems;
    }
  }

  Widget get _noFavouriteItems {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.favorite_border, size: 120.0, color: Colors.red),
          SizedBox(height: 40.0),
          Text(
            'You do not have favourite items yet',
            textAlign: TextAlign.center,
            textScaleFactor: 1.2,
          )
        ],
      ),
    );
  }

  Widget get _favouriteItems {
    return ListView.builder(
        itemCount: favouriteProducts.length,
        itemBuilder: (context, index) {
          return getRow(context, index);
        });
  }

  Widget getRow(BuildContext context, int index) {
    var item = favouriteProducts[index];
    return Card(
        child: InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => ProductDetails(
                  product: item,
                )));
      },
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Image.network(
                '${item.imageLink}',
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(item.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0)),
                    tagsSection(item),
                    priceAndBuySection(item)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget tagsSection(ProductModel product) {
    List<String> tags = List();
    if (product.category != null) tags.add(product.category);
    if (product.area != null) tags.add(product.area);
    return Row(
        children: tags
            .map((title) => Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Chip(label: Text(title)),
                ))
            .toList());
  }

  Widget priceAndBuySection(ProductModel product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(product.getPrice(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
        IconButton(
            icon: Icon(Icons.add_shopping_cart, color: Colors.blueAccent),
            onPressed: () => addToCart(product))
      ],
    );
  }
}
