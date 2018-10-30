import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              appNameText,
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: appDescriptionText,
              ),
              SizedBox(height: 40.0),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    color: Theme.of(context).accentColor,
                    textColor: Colors.white,
                    child: Text('CONTINUE'),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/home');
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

var appNameText = Text('Healthy shop',
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0));
var appDescriptionText = Text('Tasty and healty. Do you fucking need more?',
    style: TextStyle(fontSize: 24.0), textAlign: TextAlign.center);
