import 'package:{{client_name.snakeCase()}}_client/{{client_name.snakeCase()}}_client.dart';

/// {@template {{implementation_name.snakeCase()}}_{{client_name.snakeCase()}}_client}
/// {{implementation_name.pascalCase()}} implementation of {{client_name.pascalCase()}}Client
/// {@endtemplate}
class {{implementation_name.pascalCase()}}{{client_name.pascalCase()}}Client extends {{client_name.pascalCase()}}Client {
  /// {@macro {{implementation_name.snakeCase()}}_{{client_name.snakeCase()}}_client}
  const {{implementation_name.pascalCase()}}{{client_name.pascalCase()}}Client();

  // TODO: Implement client methods here
}

/// {@template {{implementation_name.snakeCase()}}_{{client_name.snakeCase()}}_failure}
/// {{implementation_name.pascalCase()}} failure for {{client_name.pascalCase()}}Client
/// {@endtemplate}
class {{implementation_name.pascalCase()}}{{client_name.pascalCase()}}Failure extends {{client_name.pascalCase()}}Failure {
  /// {@macro {{implementation_name.snakeCase()}}_{{client_name.snakeCase()}}_failure}
  const {{implementation_name.pascalCase()}}{{client_name.pascalCase()}}Failure(super.error);
}
