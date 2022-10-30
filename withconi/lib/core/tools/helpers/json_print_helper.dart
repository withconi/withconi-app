import 'dart:convert';

JsonDecoder decoder = JsonDecoder();
JsonEncoder encoder = JsonEncoder.withIndent('  ');

void prettyPrintJson(String input) {
  var object = decoder.convert(input);
  var prettyString = encoder.convert(object);
  prettyString.split('\n').forEach((element) => print(element));
}
