import 'package:flutter/material.dart';
import 'package:shop/containers/products_view.dart';
import 'package:shop/models/products_filter.dart';
import 'package:shop/presentation/loading_indicator.dart';

class AreasList extends StatelessWidget {
  final bool isLoading;
  final List<String> areas;
  final Function clearProducts;

  const AreasList({Key key, this.isLoading, this.areas, this.clearProducts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (areas.contains('Unknown')) areas.remove('Unknown');
    if (!areas.contains('Others')) areas.add('Others');
    return isLoading ? LoadingIndicator() : getAreasListView();
  }

  ListView getAreasListView() => ListView.builder(
      padding: EdgeInsets.only(top: 10.0),
      itemCount: areas.length,
      itemBuilder: (BuildContext context, int position) {
        return getRow(position, context, areas);
      });

  Widget getRow(int i, BuildContext context, List<String> areas) {
    return Column(children: <Widget>[
      ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          onTap: () {
            clearProducts();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => ProductsView(
                      filter: ProductsFilter.country,
                      filters: [areas[i]],
                    )));
          },
          leading: Image.network(
            _getLinkForCountryFlag(areas[i]),
            width: 80.0,
          ),
          title: Text(areas[i])),
      Divider(
        height: 1.0,
      )
    ]);
  }

  String _getLinkForCountryFlag(String country) {
    String countryCode = '';
    switch (country) {
      case 'American':
        countryCode = 'US';
        break;
      case 'British':
        countryCode = 'GB';
        break;
      case 'Canadian':
        countryCode = 'CA';
        break;
      case 'Chinese':
        countryCode = 'CN';
        break;
      case 'Dutch':
        countryCode = 'NL';
        break;
      case 'French':
        countryCode = 'FR';
        break;
      case 'Greek':
        countryCode = 'GR';
        break;
      case 'Indian':
        countryCode = 'IN';
        break;
      case 'Irish':
        countryCode = 'IE';
        break;
      case 'Italian':
        countryCode = 'IT';
        break;
      case 'Jamaican':
        countryCode = 'JM';
        break;
      case 'Japanese':
        countryCode = 'JP';
        break;
      case 'Malaysian':
        countryCode = 'MY';
        break;
      case 'Mexican':
        countryCode = 'MX';
        break;
      case 'Moroccan':
        countryCode = 'MA';
        break;
      case 'Russian':
        countryCode = 'RU';
        break;
      case 'Spanish':
        countryCode = 'ES';
        break;
      case 'Thai':
        countryCode = 'TW';
        break;
      case 'Vietnamese':
        countryCode = 'VN';
        break;
      case 'Unknown':
        countryCode = null;
        break;
      default:
        countryCode = null;
    }

    String imageLink = 'https://www.countryflags.io/$countryCode/flat/64.png';
    return imageLink;
  }
}
