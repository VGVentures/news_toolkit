import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part '{{feature_name.snakeCase()}}_event.dart';
part '{{feature_name.snakeCase()}}_state.dart';

class {{feature_name.pascalCase()}}Bloc extends Bloc<{{feature_name.pascalCase()}}Event, {{feature_name.pascalCase()}}State> {
  {{feature_name.pascalCase()}}Bloc() : super(const {{feature_name.pascalCase()}}State()) {
    on<{{feature_name.pascalCase()}}Started>(_on{{feature_name.pascalCase()}}Started);
  }

  Future<void> _on{{feature_name.pascalCase()}}Started(
    {{feature_name.pascalCase()}}Started event,
    Emitter<{{feature_name.pascalCase()}}State> emit,
  ) async {
    emit(state.copyWith(status: {{feature_name.pascalCase()}}Status.loading));

    try {
      // TODO: Implement your logic here

      emit(state.copyWith(status: {{feature_name.pascalCase()}}Status.success));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: {{feature_name.pascalCase()}}Status.failure));
      addError(error, stackTrace);
    }
  }
}
