import 'package:flutter/material.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/presentation/loading_indicator.dart';

class FavouritesList extends StatelessWidget {
  final List<ProductModel> favouriteProducts;
  final bool isLoading;

  FavouritesList(
      {Key key, @required this.favouriteProducts, @required this.isLoading})
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
    return ListView(
      children: <Widget>[
        SizedBox(height: 140.0),
        Icon(Icons.favorite_border, size: 120.0, color: Colors.red),
        SizedBox(height: 40.0),
        Text(
          'You do not have favourite items yet',
          textAlign: TextAlign.center,
          textScaleFactor: 1.2,
        )
      ],
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
        child: Row(
//      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
            flex: 6,
            child: Image.network(
              '${item.imageLink}',
              width: 130.0,
              fit: BoxFit.fitHeight,
            )),
        Expanded(
            flex: 11,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(item.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0)),
                  tagsSection(item),
                  priceAndBuySection(item)
                ],
              ),
            ))
      ],
    ));
  }

  Widget tagsSection(ProductModel product) {
    List<String> tags = List();
    if (product.category != null) tags.add(product.category);
    if (product.area != null) tags.add(product.area);
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: tags
              .map((title) => ActionChip(label: Text(title), onPressed: () {}))
              .toList()),
    );
  }

  Widget priceAndBuySection(ProductModel product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(product.getPrice(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
        IconButton(
            icon: Icon(Icons.add_shopping_cart, color: Colors.blueAccent),
        onPressed: () => {})
      ],
    );
  }
}
