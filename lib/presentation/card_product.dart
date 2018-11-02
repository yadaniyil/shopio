import 'package:flutter/material.dart';
import 'package:shop/containers/product_details.dart';
import 'package:shop/models/product_model.dart';

class CardProduct extends StatelessWidget {
  final ProductModel product;
  final ThemeData theme;

  const CardProduct({Key key, this.product, this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String label = product.getOptionalLabel();
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => ProductDetails(
                      product: product,
                    )));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 16.0 / 11.0,
                child: _foodPicture(product),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      product.name,
                      style: theme.textTheme.title,
                      maxLines: 1,
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(product.getPrice(), style: theme.textTheme.body2),
                        label == null
                            ? Container()
                            : (label == 'New'
                                ? _getChip(label, Colors.blue)
                                : _getChip(label, Colors.red))
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget _foodPicture(ProductModel product) {
    return Hero(
      child: Image.network(product.imageLink, fit: BoxFit.fitWidth),
      tag: '${product.id}_hero_tag',
    );
  }

  Widget _getChip(String text, Color color) {
    return Container(
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 6.0),
        child: Text(text, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
