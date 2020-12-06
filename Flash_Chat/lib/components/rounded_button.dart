import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color _color;
  final String _message;
  final Function _onPress;
  RoundedButton(this._color, this._message, this._onPress);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: _color,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: () {
            _onPress();
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            _message,
          ),
        ),
      ),
    );
  }
}
