/// {@template {{client_name.snakeCase()}}_client}
/// Abstract interface for {{client_name.lowerCase()}} client
/// {@endtemplate}
abstract class {{client_name.pascalCase()}}Client {
  /// {@macro {{client_name.snakeCase()}}_client}
  const {{client_name.pascalCase()}}Client();

  // TODO: Add client methods here
}

/// {@template {{client_name.snakeCase()}}_failure}
/// Base failure class for {{client_name.pascalCase()}}Client errors
/// {@endtemplate}
abstract class {{client_name.pascalCase()}}Failure implements Exception {
  /// {@macro {{client_name.snakeCase()}}_failure}
  const {{client_name.pascalCase()}}Failure(this.error);

  /// The error that was caught.
  final Object error;
}
