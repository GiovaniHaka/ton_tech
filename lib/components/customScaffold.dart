import 'package:flutter/material.dart';

import 'header.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final Widget floatingActionButton;

  CustomScaffold({this.body, this.floatingActionButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: this.body,
      floatingActionButton: this.floatingActionButton,
    );
  }
}
