import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tontech/components/headerButton.dart';

class Header extends StatefulWidget implements PreferredSizeWidget {
  final double headerHeight;
  Header({
    Key key,
    this.headerHeight = 70,
  })  : preferredSize = Size.fromHeight(headerHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: <Color>[Colors.blue, Colors.pink],
        //   ),
        // ),
        color: Theme.of(context).backgroundColor,
        child: const AppBarContent(),
      ),
    );
  }
}

class AppBarContent extends StatefulWidget {
  const AppBarContent({Key key}) : super(key: key);

  @override
  _AppBarContentState createState() => _AppBarContentState();
}

class _AppBarContentState extends State<AppBarContent> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'One';
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  constraints.maxWidth > 800
                      ? Expanded(
                          child: Wrap(
                            // alignment: WrapAlignment.end,
                            spacing: 50,
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // alignment: WrapAlignment.spaceEvenly,
                            children: [
                              HeaderButton(
                                text: 'Carton',
                                onTap: () => Get.toNamed('/carton'),
                              ),
                              HeaderButton(
                                text: 'Payton',
                                onTap: () => Get.toNamed('/payton'),
                              ),
                            ],
                          ),
                        )
                      : DropdownButton<String>(
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          items: <String>['One', 'Two', 'Free', 'Four']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
