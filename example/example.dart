import 'package:json_traverse/json_traverse.dart';

void main() {
  var jsonString = '''
  {
    "name": "John Smith",
    "email": "john@example.org",
    "contact": [
      "123",
      "456"
    ]
  }
  ''';
  var traverser = JSONTraverse(jsonString);
  // for a single string
  print(traverser.query('name')); // Prints `John Smith`
  // for an array, point the index
  print(traverser.query('contact.1')); // Prints `456`
}
