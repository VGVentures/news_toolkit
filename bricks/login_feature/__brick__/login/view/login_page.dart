import 'package:authentication_client/authentication_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_example/login/login.dart';

/// {@template login_page}
/// Login page with social authentication options
/// {@endtemplate}
class LoginPage extends StatelessWidget {
  /// {@macro login_page}
  const LoginPage({super.key});

  /// Route for LoginPage
  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const LoginPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        authenticationClient: context.read<AuthenticationClient>(),
      ),
      child: const LoginView(),
    );
  }
}

/// {@template login_view}
/// View for LoginPage
/// {@endtemplate}
class LoginView extends StatelessWidget {
  /// {@macro login_view}
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _EmailInput(),
            SizedBox(height: 16),
            _LoginButtons(),
          ],
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          onChanged: (email) =>
              context.read<LoginBloc>().add(LoginEmailChanged(email)),
          decoration: InputDecoration(
            labelText: 'Email',
            errorText: state.email.displayError?.text,
          ),
        );
      },
    );
  }
}

class _LoginButtons extends StatelessWidget {
  const _LoginButtons();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Column(
          children: [
{{#enable_google}}
            ElevatedButton.icon(
              onPressed: () =>
                  context.read<LoginBloc>().add(const LoginGoogleSubmitted()),
              icon: const Icon(Icons.g_mobiledata),
              label: const Text('Sign in with Google'),
            ),
            const SizedBox(height: 8),
{{/enable_google}}
{{#enable_apple}}
            ElevatedButton.icon(
              onPressed: () =>
                  context.read<LoginBloc>().add(const LoginAppleSubmitted()),
              icon: const Icon(Icons.apple),
              label: const Text('Sign in with Apple'),
            ),
{{/enable_apple}}
          ],
        );
      },
    );
  }
}
