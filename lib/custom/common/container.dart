// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:budhana_tech_task/config/colors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    Key? key,
    this.child,
    this.boxConstraints,
    this.margin = const EdgeInsets.symmetric(horizontal: 26),
  }) : super(key: key);

  final Widget? child;
  final BoxConstraints? boxConstraints;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: boxConstraints,
      margin: margin,
      decoration: BoxDecoration(
        border: Border.all(color: grey),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: grey,
            blurRadius: 10,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: child,
    );
  }
}
