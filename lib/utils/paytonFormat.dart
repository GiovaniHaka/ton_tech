import 'dart:convert';

formatPayton(String ids, String description) {
  // print(str.split);
  LineSplitter ls = new LineSplitter();
  List<String> lines = ls.convert(ids);
  for (int i = 0; i < lines.length; i++) {
    lines[i] = "{\n\tid: '${lines[i]}',\n\tdescription: '$description'\n},\n";
  }
  String result = '';
  lines.forEach((element) {
    result += element;
  });
  return result;
}
