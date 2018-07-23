import 'package:flutter/material.dart';
import 'package:shop/presentation/cart_and_search_toolbar.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: cartAndSearchToolbar('Profile', context),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: 30.0),
                RaisedButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  child: Text('Sign up with Google'),
                  onPressed: () {},
                ),
                SizedBox(height: 30.0),
                RaisedButton(
                  color: Colors.lightBlue,
                  textColor: Colors.white,
                  child: Text('Sign up with Facebook'),
                  onPressed: () {},
                ),
                SizedBox(height: 30.0),
                RaisedButton(
                  color: Colors.grey,
                  child: Text('Log out'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            )
          ],
        ));
  }
}
