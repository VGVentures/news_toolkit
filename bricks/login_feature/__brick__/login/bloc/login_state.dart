part of 'login_bloc.dart';

/// {@template login_state}
/// State for login feature
/// {@endtemplate}
class LoginState extends Equatable {
  /// {@macro login_state}
  const LoginState({
    this.email = const Email.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.valid = false,
  });

  /// Email input
  final Email email;

  /// Form submission status
  final FormzSubmissionStatus status;

  /// Whether the form is valid
  final bool valid;

  @override
  List<Object> get props => [email, status, valid];

  /// Creates a copy of this state with the given fields replaced
  LoginState copyWith({
    Email? email,
    FormzSubmissionStatus? status,
    bool? valid,
  }) {
    return LoginState(
      email: email ?? this.email,
      status: status ?? this.status,
      valid: valid ?? this.valid,
    );
  }
}
