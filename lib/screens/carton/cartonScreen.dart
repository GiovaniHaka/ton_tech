import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:tontech/components/customScaffold.dart';
import 'package:tontech/utils/cartonFormat.dart';

class CartonScreen extends StatefulWidget {
  final String screenTitle;

  const CartonScreen({Key key, this.screenTitle}) : super(key: key);
  @override
  _CartonScreenState createState() => _CartonScreenState();
}

class _CartonScreenState extends State<CartonScreen> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    double padding = MediaQuery.of(context).size.width * 0.1;
    return CustomScaffold(
      floatingActionButton: Container(
        margin: EdgeInsets.all(40),
        child: FloatingActionButton(
          child: Icon(Icons.copy),
          onPressed: () {
            if (result.trim() == "") {
              print('enter text');
            } else {
              FlutterClipboard.copy(result).then((value) => print("Copied"));
            }
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding, vertical: 25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${this.widget.screenTitle}",
                style: Theme.of(context).textTheme.headline4,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      // color: Colors.grey[200],
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintText: 'Cole os ids aqui!'),
                        maxLines: null,
                        onChanged: (value) {
                          setState(() {
                            result = formatCarton(value);
                            print(formatCarton(result));
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(30),
                      child: SelectableText(result),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
