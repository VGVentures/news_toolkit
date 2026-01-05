import 'package:{{client_name.snakeCase()}}_client/{{client_name.snakeCase()}}_client.dart';
import 'package:test/test.dart';

class Mock{{client_name.pascalCase()}}Client extends {{client_name.pascalCase()}}Client {
  const Mock{{client_name.pascalCase()}}Client();
}

void main() {
  group('{{client_name.pascalCase()}}Client', () {
    test('can be implemented', () {
      expect(const Mock{{client_name.pascalCase()}}Client(), isNotNull);
    });
  });
}
