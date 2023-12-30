import 'package:flutter_test/flutter_test.dart';
import 'package:pathfinder/engine/util/iterable_utils.dart';

void main() {
  group("Deep Iterable Utils Unit Tests", () {
    test("flatten - returns expected result", () {
      // Setup
      const inputToExpected = {
        [[1, 2], [3], [4], []]: [1, 2, 3, 4]
      };

      // Run test & verify
      inputToExpected.forEach((input, expected) {
        expect(input.flatten(), expected);
      });
    });
  });
}