// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:budhana_tech_task/config/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.buttonText,
    this.onPressed,
  }) : super(key: key);

  final String buttonText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: black,
            fixedSize: const Size.fromWidth(double.maxFinite)),
        onPressed: onPressed ?? () {},
        child: Text(
          buttonText,
          style: const TextStyle(color: white),
        ),
      ),
    );
  }
}
