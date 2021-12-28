import 'package:allerg/Resources/colors.dart';
import 'package:flutter/material.dart';

InputDecoration textFormDecoration = InputDecoration(
  fillColor: Colors.white,
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: const BorderSide(
      color: AppColors.textColor,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: const BorderSide(
      color: Colors.grey,
    ),
  ),
);