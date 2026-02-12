import 'package:blabla/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class BlaButton extends StatelessWidget {
  final String data;
  final int buttonHierarchy;
  final VoidCallback onPressed;
  final IconData? icon;

  const BlaButton(
    this.data, {
    super.key,
    this.buttonHierarchy = primary,
    required this.onPressed,
    this.icon,
  });

  static const primary = 0;
  static const secondary = 1;

  @override
  Widget build(BuildContext context) {
    ButtonStyleButton button;
    switch (buttonHierarchy) {
      case secondary:
        button = OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(backgroundColor: BlaColors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              if (icon != null) Icon(icon, color: BlaColors.primary),
              Text(
                data,
                style: BlaTextStyles.button.copyWith(color: BlaColors.primary),
              ),
            ],
          ),
        );
        break;
      case primary:
      default:
        button = TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(backgroundColor: BlaColors.primary),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              if (icon != null) Icon(icon, color: BlaColors.white),
              Text(
                data,
                style: BlaTextStyles.button.copyWith(color: BlaColors.white),
              ),
            ],
          ),
        );
    }
    TextButton.styleFrom(backgroundColor: BlaColors.primary);
    return Row(children: [Expanded(child: button)]);
  }
}
