import 'dart:convert';

formatCarton(String str) {
  // print(str.split);
  LineSplitter ls = new LineSplitter();
  List<String> lines = ls.convert(str);
  for (int i = 0; i < lines.length; i++) {
    lines[i] = "{\n\tid: '${lines[i]}',\n},\n";
  }
  String result = '';
  lines.forEach((element) {
    result += element;
  });
  return result;
}
