import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tadwer_app/core/utils/color_manger.dart';
import 'package:tadwer_app/core/utils/values_manager.dart';

class CustomAddressTextField extends StatelessWidget {
  const CustomAddressTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.textInputAction = TextInputAction.next,
      this.keyboardType = TextInputType.text,
      this.inputFormatters = const []})
      : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      controller: controller,
      inputFormatters: inputFormatters,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorManager.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(AppBorderRadius.s15),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(AppBorderRadius.s15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(AppBorderRadius.s15),
        ),
      ),
    );
  }
}
