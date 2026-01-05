import 'package:{{storage_name.snakeCase()}}_storage/{{storage_name.snakeCase()}}_storage.dart';
import 'package:mocktail/mocktail.dart';
import 'package:storage/storage.dart';
import 'package:test/test.dart';

class MockStorage extends Mock implements Storage {}

void main() {
  group('{{storage_name.pascalCase()}}Storage', () {
    late Storage storage;
    late {{storage_name.pascalCase()}}Storage {{storage_name.camelCase()}}Storage;

    setUp(() {
      storage = MockStorage();
      {{storage_name.camelCase()}}Storage = {{storage_name.pascalCase()}}Storage(storage: storage);
    });

    test('can be instantiated', () {
      expect({{storage_name.camelCase()}}Storage, isNotNull);
    });
  });
}
