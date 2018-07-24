import 'package:flutter/material.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/presentation/cart_and_search_toolbar.dart';

class ProductScreen extends StatelessWidget {
  final ProductModel product;

  const ProductScreen({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
        appBar: cartAndSearchToolbar(
            title: product.name, context: context, implyLeading: true),
        body: ListView(
          children: [
            foodPicture,
            titleSection(theme),
            Divider(),
            tagsSection,
            Divider(),
            addToCartButton,
            ingredients,
            instructions
          ],
        ));
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

  Widget titleSection(theme) {
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
            icon: Icon(Icons.favorite_border, color: Colors.red, size: 32.0),
            tooltip: 'Add to favourite',
            onPressed: () {},
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

  Widget get addToCartButton {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: RaisedButton(
          onPressed: () {},
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
