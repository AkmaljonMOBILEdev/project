import 'package:flutter/material.dart';

class AdminTextField extends StatelessWidget {
  const AdminTextField({super.key, required this.hintText, required this.controller, this.isDesc=false});
  final String hintText;
  final TextEditingController controller;
  final bool isDesc;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: isDesc?100:1,
      style: Theme.of(context).textTheme.headlineSmall,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.headlineSmall,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 1
          )
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
                color: Colors.blue,
                width: 1
            )
        )
      ),
    );
  }
}
