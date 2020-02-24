<div align="center">
	<img src="https://ayan-b.github.io/json_traverse/maple-tree.jpg" width="200" height="200">
	<h1>JSON Traverser</h1>
	<p>
		<b>Traverse a deeply nested JSON with a query string</b><br>
    <i>Photo by Simone Dalmeri on Unsplash</i>
	</p>
	<br>
	<br>
	<br>
</div>

```dart
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
  print(traverser.query("name")); // Prints `John Smith`
  // for an array, point the index
  print(traverser.query("contact.1")); // Prints `456`
}
```

## Usage

First instantiate a `JSONTraverse` object: `JSONTraverse traverser = JSONTraverse(jsonString)`.

Now, use the `query` method to traverse through the JSON: `traverser.query("name")`.

If you want to traverse through an array, you have to mention the index, _e.g._,
`traverser.query("contact.1")` for index `1` of the contact array. If the index
is not a valid number, the code will throw a `FormatException`.

## License

[BSD-3-Clause](./LICENSE)
