import 'package:json_traverse/json_traverse.dart';
import 'package:test/test.dart';

void main() {
  test('check basic', () {
    var jsonString = '''
  {
    "name": "John Smith",
    "email": "john@example.org"
  }
  ''';
    var traverser = JSONTraverse(jsonString);
    assert(traverser.query('name') == 'John Smith');
  });

  test('check array', () {
    var jsonString = '''
  {
    "name": "John Smith",
    "email": "john@example.org",
    "contact": [
      "123",
      "345"
    ]
  }
  ''';
    var traverser = JSONTraverse(jsonString);
    assert(traverser.query('contact.1') == '345');
  });

  test('deeply nested JSON', () {
    var jsonString = '''
    {
      "name": "John Smith",
      "email": "john@example.org",
      "address": [
        {"contact": "123", "street no": "1b", "city": "New York"},
        {"contact": "12", "street no": "1c", "city": "Kolkata"}
      ]
    }
    ''';
    var traverser = JSONTraverse(jsonString);
    assert(traverser.query('address.1.city') == 'Kolkata');
  });

  test('check FormatException', () {
    var jsonString = '''
    {
    "name": "John Smith",
    "email": "john@example.org",
    "contact": [
      "123",
      "345"
    ]
  }
  ''';
    var traverser = JSONTraverse(jsonString);
    try {
      var _ = traverser.query('contact.abc');
    } on FormatException catch (e) {
      expect(
          e.message,
          'Next item to traverse is an array. Expected an index of type `int` '
          'but found `String`');
      return;
    }
  });
}
