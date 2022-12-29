
import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  final bool isPassword;
  final TextEditingController? controller; 
  final String hintText;
  const AppInput({super.key, 
  required this.hintText, 
  this.isPassword=false, 
   this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        style: const TextStyle(
          fontSize: 14.0,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}
