import 'package:{{repository_name.snakeCase()}}_repository/{{repository_name.snakeCase()}}_repository.dart';
import 'package:test/test.dart';

void main() {
  group('{{repository_name.pascalCase()}}Repository', () {
    late {{repository_name.pascalCase()}}Repository repository;

    setUp(() {
      repository = const {{repository_name.pascalCase()}}Repository();
    });

    test('can be instantiated', () {
      expect(repository, isNotNull);
    });
  });
}
