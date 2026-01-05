import 'package:flutter/material.dart';

/// {@template subscribe_dialog}
/// Dialog prompting user to subscribe
/// {@endtemplate}
class SubscribeDialog extends StatelessWidget {
  /// {@macro subscribe_dialog}
  const SubscribeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Subscribe to {{subscription_name}}'),
      content: const Text(
        'Get access to premium features with a subscription.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            // TODO: Implement subscription purchase
            Navigator.of(context).pop();
          },
          child: const Text('Subscribe'),
        ),
      ],
    );
  }
}
