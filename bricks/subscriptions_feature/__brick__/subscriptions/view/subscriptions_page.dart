import 'package:flutter/material.dart';
import 'package:in_app_purchase_repository/in_app_purchase_repository.dart';

/// {@template subscriptions_page}
/// Page for managing app subscriptions
/// {@endtemplate}
class SubscriptionsPage extends StatelessWidget {
  /// {@macro subscriptions_page}
  const SubscriptionsPage({super.key});

  /// Route for SubscriptionsPage
  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const SubscriptionsPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscriptions'),
      ),
      body: const Center(
        child: Text('TODO: Implement subscription UI'),
      ),
    );
  }
}
