import 'dart:convert';

class ElementNotFoundException implements Exception {
  ElementNotFoundException(String errorString) {
    print(errorString);
  }
}

class JSONTraverse {
  Map<String, dynamic> decodedJSON;
  JSONTraverse(jsonString) {
    decodedJSON = jsonDecode(jsonString);
  }

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
