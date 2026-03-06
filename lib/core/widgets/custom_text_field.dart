import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
this.onChange, this.controller,required this.hintText,
  });

final Function(String)? onChange;
final TextEditingController? controller;
final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller:controller ,
      decoration: InputDecoration(hintText: hintText),
      onChanged:onChange,

    );
  }
}
