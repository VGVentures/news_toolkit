import 'package:storage/storage.dart';

/// {@template {{storage_name.snakeCase()}}_storage}
/// Storage for {{storage_name.lowerCase()}} data
/// {@endtemplate}
class {{storage_name.pascalCase()}}Storage {
  /// {@macro {{storage_name.snakeCase()}}_storage}
  const {{storage_name.pascalCase()}}Storage({
    required Storage storage,
  }) : _storage = storage;

  final Storage _storage;

  /// Storage key for {{storage_name.lowerCase()}}
  static const _storageKey = '__{{storage_name.snakeCase()}}_storage_key__';

  // TODO: Add storage methods here
  // Example:
  // Future<void> save(Model data) async {
  //   await _storage.write(key: _storageKey, value: jsonEncode(data.toJson()));
  // }
  //
  // Future<Model?> read() async {
  //   final json = await _storage.read(key: _storageKey);
  //   if (json == null) return null;
  //   return Model.fromJson(jsonDecode(json) as Map<String, dynamic>);
  // }
  //
  // Future<void> clear() async {
  //   await _storage.delete(key: _storageKey);
  // }
}
