import 'package:allerg/Resources/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BorderEditText extends StatefulWidget {
  final String hintText;
  final bool obscurity;
  final controller;
  final errorText;
  final Icon icon;

  BorderEditText(
      {required this.hintText,
        required this.obscurity,
        required this.icon,
        this.controller,
        this.errorText,
      });

  @override
  _BorderEditTextState createState() => _BorderEditTextState();
}

class _BorderEditTextState extends State<BorderEditText> {
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
        labelStyle: TextStyle(color: AppColors.lightText.withOpacity(0.5)),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        hintText: widget.hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: AppColors.lightText,
          ),
        ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: AppColors.lightText,
            ),
          ),

        filled: false,
        // hintText: widget.hintText,
        hintStyle: TextStyle(color: AppColors.dimColor),
        fillColor: const Color(0xFFFFFF),
        suffixIcon: widget.icon,
        suffixStyle: const TextStyle(
          color: AppColors.lightText
        )
      ),
      cursorColor: AppColors.lightText,
      
    );
  }
}
