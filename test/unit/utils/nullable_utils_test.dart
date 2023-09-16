import 'package:flutter_test/flutter_test.dart';
import 'package:pathfinder/engine/util/nullable_utils.dart';

void main() async {
  group("Nullabke Utils Unit Tests", () {
    test("takeIf - positive case - returns expected result", () {
      expect("Hello world".takeIf(true), "Hello world");
    });

    test("takeIf - negative case - returns expected result", () {
      expect("Hello world".takeIf(false), null);
    });

    test("takeUnless - positive case - returns expected result", () {
      expect("Hello world".takeUnless(false), "Hello world");
    });

    test("takeUnless - negative case - returns expected result", () {
      expect("Hello world".takeUnless(true), null);
    });
  });
}
