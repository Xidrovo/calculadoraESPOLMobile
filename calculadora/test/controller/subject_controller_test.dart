import 'package:flutter_test/flutter_test.dart';
import 'package:calculadora/domain/controller/calculator_controller.dart';
import 'package:calculadora/domain/controller/subjects_controller.dart';
import 'package:calculadora/helpers/storage_helper.dart';

class FakeStorageHelper extends StorageHelper {
  final Map<String, String> storage = {};

  @override
  Future<String> getData(String subjectName) async {
    return storage[subjectName] ?? '';
  }

  @override
  Future<bool> saveSubjectData(String subjectName, String jsonString) async {
    storage[subjectName] = jsonString;
    return true;
  }

  // Implement other methods as needed for your tests
}

void main() {
  group('SubjectsController Tests', () {
    late FakeStorageHelper fakeStorageHelper;
    late SubjectsController subjectsController;

    setUp(() {
      fakeStorageHelper = FakeStorageHelper();
      subjectsController = SubjectsController();
      subjectsController.helper = fakeStorageHelper; // Inject fake
    });

    test('getData returns correct CalculatorController instance', () async {
      // Pre-populate the fake storage with expected data
      fakeStorageHelper.storage['Math'] =
          '{"theoricPorcentage": 30.0, "firstPartial": 25.0, "secondPartial": 25.0, "practicalNote": 15.0, "remedial": 5.0}';

      // Expected CalculatorController based on the pre-populated JSON
      final expectedCalculatorController =
          CalculatorController(30, 25, 25, 15, 5);

      // Actual result from SubjectsController
      final result = await subjectsController.getData('Math');

      // Verify the result matches expected values
      expect(result.theoricPorcentage,
          expectedCalculatorController.theoricPorcentage);
      expect(result.firstPartial, expectedCalculatorController.firstPartial);
      expect(result.secondPartial, expectedCalculatorController.secondPartial);
      expect(result.practicalNote, expectedCalculatorController.practicalNote);
      expect(result.remedial, expectedCalculatorController.remedial);
    });

    // Additional tests here...
  });
}
