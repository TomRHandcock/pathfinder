import 'package:flutter_test/flutter_test.dart';
import 'package:pathfinder/engine/model/graph/node_template.dart';

part 'fixtures.dart';

void main() {
  group("Node Template Unit Tests", () {
    test("getFlatChildren - returns expected result", () {
      // Run test & verify
      expect(nodeTemplate.item.getFlatChildren(), flatNodeTemplate);
    });

    test("ids - returns expected result", () {
      // Run test & verify
      expect(nodeTemplate.item.ids, ["0", "1", "2", "3"]);
    });

    test("inputKeys - returns expected result", () {
      // Run test & verify
      expect(nodeTemplate.item.inputKeys, ["text-1", "image-2"]);
    });

    test("addDescendant - returns node item with additional item", () {
      // Setup
      const newItem =
          NodeItem.text(id: "4", fontSize: 11.0, inputKey: "text-4");

      // Run test
      final result = nodeTemplate.item.addDescendant("3", newItem);

      // Verify
      expect(result, nodeTemplateWithNewItem.item);
    });

    test("removeDescendant - returns node item with item subtracted", (){
      // Run test
      final result = nodeTemplate.item.removeDescendant("2");

      // Verify
      expect(result, nodeTemplateWithOutItem.item);
    });
  });
}
