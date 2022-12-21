import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String value;
  final Function() onPressed;
  const AppButton({
    super.key,
    required this.value,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.deepPurple,
      padding: const EdgeInsets.all(
        20.0,
      ),
      shape:   RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      onPressed: onPressed,
      child: Text(
        value,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
