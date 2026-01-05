import 'package:authentication_client/authentication_client.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

part 'login_event.dart';
part 'login_state.dart';

/// {@template login_bloc}
/// Manages login authentication state
/// {@endtemplate}
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  /// {@macro login_bloc}
  LoginBloc({
    required AuthenticationClient authenticationClient,
  })  : _authenticationClient = authenticationClient,
        super(const LoginState()) {
    on<LoginEmailChanged>(_onLoginEmailChanged);
    on<SendEmailLinkSubmitted>(_onSendEmailLinkSubmitted);
    on<LoginGoogleSubmitted>(_onLoginGoogleSubmitted);
    on<LoginAppleSubmitted>(_onLoginAppleSubmitted);
    on<LoginFacebookSubmitted>(_onLoginFacebookSubmitted);
    on<LoginTwitterSubmitted>(_onLoginTwitterSubmitted);
  }

  final AuthenticationClient _authenticationClient;

  void _onLoginEmailChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        valid: Formz.validate([email]),
      ),
    );
  }

  Future<void> _onSendEmailLinkSubmitted(
    SendEmailLinkSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (!state.valid) return;

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    try {
      // TODO: Implement email link authentication
      // await _authenticationClient.sendLoginEmailLink(
      //   email: state.email.value,
      // );

      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      addError(error, stackTrace);
    }
  }

  Future<void> _onLoginGoogleSubmitted(
    LoginGoogleSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    try {
      await _authenticationClient.logInWithGoogle();
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      addError(error, stackTrace);
    }
  }

  Future<void> _onLoginAppleSubmitted(
    LoginAppleSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    try {
      await _authenticationClient.logInWithApple();
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      addError(error, stackTrace);
    }
  }

  Future<void> _onLoginFacebookSubmitted(
    LoginFacebookSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    try {
      await _authenticationClient.logInWithFacebook();
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      addError(error, stackTrace);
    }
  }

  Future<void> _onLoginTwitterSubmitted(
    LoginTwitterSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    try {
      await _authenticationClient.logInWithTwitter();
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      addError(error, stackTrace);
    }
  }
}
