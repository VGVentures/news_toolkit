part of 'login_bloc.dart';

/// Base class for all login events
abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

/// Event when email input changes
class LoginEmailChanged extends LoginEvent {
  const LoginEmailChanged(this.email);

  /// The email address
  final String email;

  @override
  List<Object> get props => [email];
}

/// Event to send email magic link
class SendEmailLinkSubmitted extends LoginEvent {
  const SendEmailLinkSubmitted();

  @override
  List<Object> get props => [];
}

/// Event to login with Google
class LoginGoogleSubmitted extends LoginEvent {
  const LoginGoogleSubmitted();

  @override
  List<Object> get props => [];
}

/// Event to login with Apple
class LoginAppleSubmitted extends LoginEvent {
  const LoginAppleSubmitted();

  @override
  List<Object> get props => [];
}

/// Event to login with Facebook
class LoginFacebookSubmitted extends LoginEvent {
  const LoginFacebookSubmitted();

  @override
  List<Object> get props => [];
}

/// Event to login with Twitter
class LoginTwitterSubmitted extends LoginEvent {
  const LoginTwitterSubmitted();

  @override
  List<Object> get props => [];
}
