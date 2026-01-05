import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_example/{{feature_name.snakeCase()}}/{{feature_name.snakeCase()}}.dart';

class {{feature_name.pascalCase()}}Page extends StatelessWidget {
  const {{feature_name.pascalCase()}}Page({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const {{feature_name.pascalCase()}}Page(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => {{feature_name.pascalCase()}}Bloc()
        ..add(const {{feature_name.pascalCase()}}Started()),
      child: const {{feature_name.pascalCase()}}View(),
    );
  }
}

class {{feature_name.pascalCase()}}View extends StatelessWidget {
  const {{feature_name.pascalCase()}}View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('{{feature_name.titleCase()}}'),
      ),
      body: BlocBuilder<{{feature_name.pascalCase()}}Bloc, {{feature_name.pascalCase()}}State>(
        builder: (context, state) {
          return switch (state.status) {
            {{feature_name.pascalCase()}}Status.initial => const SizedBox(),
            {{feature_name.pascalCase()}}Status.loading => const Center(
                child: CircularProgressIndicator(),
              ),
            {{feature_name.pascalCase()}}Status.success => const Center(
                child: Text('Success!'),
              ),
            {{feature_name.pascalCase()}}Status.failure => const Center(
                child: Text('Something went wrong!'),
              ),
          };
        },
      ),
    );
  }
}
