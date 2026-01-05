import 'package:{{implementation_name.snakeCase()}}_{{client_name.snakeCase()}}_client/{{implementation_name.snakeCase()}}_{{client_name.snakeCase()}}_client.dart';
import 'package:{{client_name.snakeCase()}}_client/{{client_name.snakeCase()}}_client.dart';
import 'package:test/test.dart';

void main() {
  group('{{implementation_name.pascalCase()}}{{client_name.pascalCase()}}Client', () {
    late {{client_name.pascalCase()}}Client client;

    setUp(() {
      client = const {{implementation_name.pascalCase()}}{{client_name.pascalCase()}}Client();
    });

    test('can be instantiated', () {
      expect(client, isNotNull);
    });
  });
}
