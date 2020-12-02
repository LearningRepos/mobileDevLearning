import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String startingCurrency = "USD";

  DropdownButton<String> getAndroidPicker() {
    List<DropdownMenuItem<String>> getMenuCurrencies(List<String> list) {
      List<DropdownMenuItem<String>> newList = new List();
      for (var i = 0; i < list.length; i++) {
        newList.add(
          DropdownMenuItem(
            child: Center(
              child: Text(
                '${list[i]}',
              ),
            ),
            value: list[i],
          ),
        );
      }
      return newList;
    }

    return DropdownButton<String>(
      value: "$startingCurrency",
      items: getMenuCurrencies(currenciesList),
      onChanged: (value) {
        setState(() {
          startingCurrency = value;
        });
      },
    );
  }

  CupertinoPicker getIOSPicker() {
    List<DropdownMenuItem<String>> getMenuCurrencies(List<String> list) {
      List<DropdownMenuItem<String>> newList = new List();
      for (var i = 0; i < list.length; i++) {
        newList.add(
          DropdownMenuItem(
            child: Center(
              child: Text(
                '${list[i]}',
              ),
            ),
            value: list[i],
          ),
        );
      }
      return newList;
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (value) {
        setState(() {
          List<DropdownMenuItem<String>> list =
              getMenuCurrencies(currenciesList);
          startingCurrency = list[value].value;
        });
      },
      children: getMenuCurrencies(currenciesList),
    );
  }

  Widget getVersionPicker() {
    if (Platform.isIOS) {
      return getIOSPicker();
    } else if (Platform.isAndroid) {
      return getAndroidPicker();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? $startingCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getVersionPicker(),
          ),
        ],
      ),
    );
  }
}
