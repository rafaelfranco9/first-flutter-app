import 'package:flutter/material.dart';

enum SimpleButtonSize { small, medium }

class SimpleButton extends StatelessWidget {
  SimpleButton({
    required this.text,
    this.buttonSize = SimpleButtonSize.small,
    required this.primaryColor,
    required this.secondaryColor,
    this.onPressButton,
    this.selected = false,
  });

  final String text;
  final SimpleButtonSize buttonSize;
  final Color primaryColor;
  final Color secondaryColor;
  final bool selected;
  final void Function()? onPressButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressButton,
      child: Text(text, style: _buildTextStyle()),
      style: _buildButtonStyle(),
    );
  }

  TextStyle _buildTextStyle() {
    return TextStyle(
      color: selected ? primaryColor : secondaryColor,
      fontSize: buttonSize == SimpleButtonSize.small ? 15 : 20,
      fontWeight: FontWeight.w700,
    );
  }

  ButtonStyle _buildButtonStyle() {
    final verticalPadding = buttonSize == SimpleButtonSize.small ? 20.0 : 25.0;
    final horizontalPadding =
        buttonSize == SimpleButtonSize.small ? 40.0 : 50.0;
    final radius = buttonSize == SimpleButtonSize.small ? 12.0 : 18.0;

    return ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      primary: selected ? secondaryColor : primaryColor,
      side: BorderSide(
        color: selected ? primaryColor : secondaryColor,
        width: 1.5,
      ),
    );
  }
}
