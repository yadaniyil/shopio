import 'package:flutter/material.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/presentation/cart_and_search_toolbar.dart';
import 'package:shop/presentation/loading_indicator.dart';

class ProductScreen extends StatelessWidget {
  final ProductModel product;
  final Function onAddToFavourites;
  final Function onDeleteFromFavourites;
  final Function onAddToCart;
  final List<String> favouriteIds;

  const ProductScreen(
      {Key key,
      @required this.product,
      @required this.onAddToFavourites,
      @required this.onDeleteFromFavourites,
      @required this.onAddToCart,
      @required this.favouriteIds})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    bool isFavourite = favouriteIds.contains(product.id);

    return Scaffold(
        appBar: cartAndSearchToolbar(
            title: product.name, context: context, implyLeading: true),
        body: product.sourceLink == null
            ? LoadingIndicator()
            : _productDetails(theme, isFavourite, context));
  }

  _productDetails(ThemeData theme, bool isFavourite, BuildContext context) {
    return ListView(
      children: [
        foodPicture,
        titleSection(theme, isFavourite),
        Divider(),
        tagsSection,
        Divider(),
        _addToCartButton(context),
        ingredients,
        instructions
      ],
    );
  }

  Widget get foodPicture {
    return Hero(
      tag: '${product.id}_hero_tag',
      child: Image.network(
        product.imageLink,
        height: 200.0,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget titleSection(theme, isFavourite) {
    return Container(
      height: 60.0,
      padding: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[name(theme), price(theme)]),
          IconButton(
            icon: Icon(isFavourite ? Icons.favorite : Icons.favorite_border,
                color: Colors.red, size: 32.0),
            tooltip: 'Add to favourite',
            onPressed: isFavourite ? onDeleteFromFavourites : onAddToFavourites,
          ),
          IconButton(
            icon: Icon(Icons.share, size: 24.0),
            tooltip: 'Share',
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Widget name(theme) {
    return Text(
      product.name,
      style: theme.textTheme.body2,
      maxLines: 1,
    );
  }

  Widget price(theme) {
    return Text(product.getPrice(), style: theme.textTheme.title);
  }

  Widget get tagsSection {
    List<String> tags = List();
    if (product.category != null) tags.add(product.category);
    if (product.area != null) tags.add(product.area);
    if (product.tags != null) tags.add(product.tags);
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: tags
            .map((title) => ActionChip(label: Text(title), onPressed: () {}))
            .toList());
  }

  _addToCartButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: RaisedButton(
        color: Theme.of(context).accentColor,
          onPressed: onAddToCart,
          child: Text('ADD TO CART', style: TextStyle(fontSize: 14.0)),
          textColor: Colors.white,
          padding: EdgeInsets.all(20.0)),
    );
  }

  Widget get ingredients {
    return ExpansionTile(title: Text('Ingredients'), children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: <Widget>[]),
      )
    ]);
  }

  Widget get instructions {
    return ExpansionTile(title: Text('Instructions'), children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(product.instructions),
      )
    ]);
  }
}
