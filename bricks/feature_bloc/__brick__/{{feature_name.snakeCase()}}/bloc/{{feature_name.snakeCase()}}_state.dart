part of '{{feature_name.snakeCase()}}_bloc.dart';

enum {{feature_name.pascalCase()}}Status { initial, loading, success, failure }

class {{feature_name.pascalCase()}}State extends Equatable {
  const {{feature_name.pascalCase()}}State({
    this.status = {{feature_name.pascalCase()}}Status.initial,
  });

  final {{feature_name.pascalCase()}}Status status;

  @override
  List<Object?> get props => [status];

  {{feature_name.pascalCase()}}State copyWith({
    {{feature_name.pascalCase()}}Status? status,
  }) {
    return {{feature_name.pascalCase()}}State(
      status: status ?? this.status,
    );
  }
}
