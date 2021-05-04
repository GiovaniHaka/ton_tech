import 'package:flutter/material.dart';

class HeaderButton extends StatelessWidget {
  final String text;
  final Function onTap;

  const HeaderButton({Key key, this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: this.onTap,
      child: Text('${this.text}'),
      style: TextButton.styleFrom(primary: Colors.black),
    );
  }
}
