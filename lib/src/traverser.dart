import 'dart:convert';

/// ElementNotFound Exception implementation, currently simply prints the
/// error message
class ElementNotFoundException implements Exception {
  ElementNotFoundException(String errorString) {
    print(errorString);
  }
}

/// JSONTraverse class, implements the query method as well
class JSONTraverse {
  Map<String, dynamic> decodedJSON;

  /// The constructor converts the `jsonString` to `Map<String, dynamic>`
  /// which is used by the `query` method.
  JSONTraverse(jsonString) {
    decodedJSON = jsonDecode(jsonString);
  }

  /// The query method takes `queryString` and then splits into an array of
  /// strings. The converted map(that is, `decodedJSON`) is then traversed using 
  /// the splitted strings, reducing it at every step.
  dynamic query(String queryString) {
    var splittedString = queryString.split('.');
    dynamic reduced = decodedJSON;
    for (var query in splittedString) {
      if (reduced is List) {
        num index;
        try {
          index = int.parse(query);
        } on FormatException {
          throw FormatException('Next item to traverse is an array. Expected'
              ' an index of type `int` but found `String`');
        }
        reduced = reduced[index];
      } else {
        try {
          reduced = reduced[query];
        } on NoSuchMethodError {
          throw ElementNotFoundException('The query string does not lead to a'
              'valid JSON field. Please check the string. The query failed while'
              'accessing the field `${query}`');
        }
      }
    }
    return reduced;
  }
}
