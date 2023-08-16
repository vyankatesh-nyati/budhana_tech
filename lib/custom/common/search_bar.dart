// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../config/colors.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    Key? key,
    required this.labelText,
  }) : super(key: key);

  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 16),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          border: const OutlineInputBorder(),
          fillColor: black.withOpacity(0.1),
          filled: true,
          labelText: labelText,
        ),
      ),
    );
  }
}
