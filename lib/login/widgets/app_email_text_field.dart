import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// An email text field component.
class AppEmailTextField extends StatelessWidget {
  const AppEmailTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.onSuffixPressed,
    this.suffixVisible,
    this.onChanged,
  }) : super(key: key);

  /// Controls the text being edited.
  final TextEditingController? controller;

  /// Text that suggests what sort of input the field accepts.
  final String? hintText;

  /// Called when the user inserts or deletes texts in the text field.
  final ValueChanged<String>? onChanged;

  /// Called when the user clicks on the suffix icon.
  final VoidCallback? onSuffixPressed;

  /// Whether the suffix is visible.
  /// Defaults to false.
  final bool? suffixVisible;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      hintText: hintText,
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      prefix: const Padding(
        padding: EdgeInsets.only(
          left: AppSpacing.sm,
          right: AppSpacing.sm,
        ),
        child: Icon(
          Icons.email_outlined,
          color: AppColors.mediumEmphasis,
          size: 24,
        ),
      ),
      onChanged: onChanged,
      suffix: _ClearIconButton(
        onPressed: onSuffixPressed,
        suffixVisible: suffixVisible ?? false,
      ),
    );
  }
}

class _ClearIconButton extends StatelessWidget {
  const _ClearIconButton({
    Key? key,
    required this.onPressed,
    required this.suffixVisible,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final bool suffixVisible;

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: const Key('appEmailTextField_clearIconButton'),
      padding: const EdgeInsets.only(right: AppSpacing.md),
      child: Visibility(
        visible: suffixVisible,
        child: GestureDetector(
          onTap: onPressed,
          child: Assets.icons.closeCircle.svg(),
        ),
      ),
    );
  }
}
