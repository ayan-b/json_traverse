import 'package:json_traverse/json_traverse.dart';

void main() {
  String jsonString = """
  {
    "name": "John Smith",
    "email": "john@example.org",
    "contact": [
      "123",
      "456"
    ]
  }
  """;
  JSONTraverse traverser = JSONTraverse(jsonString);
  // for a single string
  print(traverser.query("name"));
  // for an array, point the index
  print(traverser.query("contact.1"));
}
