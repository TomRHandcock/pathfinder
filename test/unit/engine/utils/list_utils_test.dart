import 'package:flutter_test/flutter_test.dart';
import 'package:pathfinder/engine/util/list_utils.dart';

void main() async {
  group("List Utils Unit Tests", () {
    test("firstWhereOrNull - positive case - returns first match", () {
      // Run test
      final list = [0, 1, 2, 4, 5];
      final result = list.firstWhereOrNull((element) => element > 3);

      // Verify
      expect(result, 4);
    });

    test("firstWhereOrNull - negative case - returns null", () {
      // Run test
      final list = [0, 1, 2, 3, 4];
      final result = list.firstWhereOrNull((element) => element > 5);

      // Verify
      expect(result, null);
    });
  });
}
