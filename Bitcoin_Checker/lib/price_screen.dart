import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'coin_api.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  Coin_API coinAPI = Coin_API();
  String startingCurrency = "USD";
  double bitCoinValue;
  double ethereumValue;
  double litecoinValue;

  Widget getTextWidgets(List<String> list) {
    List<Widget> newList = new List();
    for (var i = 0; i < list.length; i++) {
      newList.add(
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
                '1 ${list[i]} = $bitCoinValue $startingCurrency',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );
    }
    newList.add(
      Container(
        height: 150.0,
        alignment: Alignment.center,
        padding: EdgeInsets.only(bottom: 30.0),
        color: Colors.lightBlue,
        child: getVersionPicker(),
      ),
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: newList,
    );
  }

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
        updateAPIData(value);
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
          updateAPIData(list[value].value);
        });
      },
      children: getMenuCurrencies(currenciesList),
    );
  }

  Widget getVersionPicker() {
    if (Platform.isIOS) {
      return getIOSPicker();
    } else {
      return getAndroidPicker();
    }
  }

  Future getAPIData() async {
    var resultBitcoin = await coinAPI.getOriginalBitcoinData();
    var resultEthereum = await coinAPI.getOriginalEthereumData();
    var resultLitecoin = await coinAPI.getOriginalLitecoinData();
    setState(() {
      bitCoinValue = resultBitcoin["rate"];
      ethereumValue = resultEthereum["rate"];
      litecoinValue = resultLitecoin["rate"];
    });
    return resultBitcoin;
  }

  Future updateAPIData(String currency) async {
    var resultBitcoin = await coinAPI.getCurrencyBitcoinData(currency);
    var resultEthereum = await coinAPI.getCurrencyEthereumData(currency);
    var resultLitecoin = await coinAPI.getCurrencyLitecoinData(currency);
    setState(() {
      bitCoinValue = resultBitcoin["rate"];
      ethereumValue = resultEthereum["rate"];
      litecoinValue = resultLitecoin["rate"];
    });
    return resultBitcoin;
  }

  @override
  void initState() {
    getAPIData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: getTextWidgets(cryptoList),
    );
  }
}
