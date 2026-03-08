import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
this.onChange, this.controller, this.hintText,this.maxLines=1,this.textInputAction,
  });

final Function(String)? onChange;
final TextEditingController? controller;
final String? hintText;
final int maxLines;
final TextInputAction? textInputAction;
  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: textInputAction,
      controller:controller ,
      decoration: InputDecoration(hintText: hintText),
      onChanged:onChange,
  maxLines: maxLines,
  autofocus: false,
    );
  }
}
