import 'package:flutter_test/flutter_test.dart';
import 'package:pathfinder/engine/util/object_utils.dart';

class A {}

class B extends A {}

void main() {
  group("Object Utils Tests", () {
    test("let - returns expected result", () {
      // Run test
      final result = 1.let((it) => it + 1);

      // Verify
      expect(result, 2);
    });

    test("asOrNull - positive case - returns casted result", () {
      // Setup
      final input = B();
      final A casted = input;

      // Run test
      final result = casted.asOrNull<B>();

      // Verify
      expect(result, input);
    });

    test("asOrNull - negative case - returns null", () {
      // Setup
      final input = B();

      // Run test
      final result = input.asOrNull<String>();

      // Verify
      expect(result, null);
    });
  });
}
