import 'package:allerg/Resources/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomEditText extends StatefulWidget {
  final String hintText;
  final bool obscurity;
  final controller;
  final errorText;
  final Icon icon;

  CustomEditText(
      {required this.hintText,
        required this.obscurity,
        required this.icon,
        this.controller,
        this.errorText,
      });

  @override
  _CustomEditTextState createState() => _CustomEditTextState();
}

class _CustomEditTextState extends State<CustomEditText> {
  var labelText = '';

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.errorText;
        }
      },
      obscureText: widget.obscurity,
      controller: widget.controller,
      style: TextStyle(color: AppColors.textColor),
      onChanged: (v) {
        setState(() {
          if (v.isNotEmpty) {
            labelText = widget.hintText;
          } else {
            labelText = '';
          }
        });
      },
      decoration: InputDecoration(
        labelStyle: TextStyle(color: AppColors.textColor.withOpacity(0.5)),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        hintText: widget.hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: AppColors.textColor,
          ),
        ),
        border: new OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textColor),
            borderRadius: const BorderRadius.all(const Radius.circular(8.0))),
        filled: false,
        // hintText: widget.hintText,
        hintStyle: TextStyle(color: AppColors.dimColor),
        fillColor: const Color(0xFFFFFF),
        suffixIcon: widget.icon
      ),
      cursorColor: AppColors.textColor,
      
    );
  }
}
