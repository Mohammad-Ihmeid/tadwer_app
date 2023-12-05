import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/color_manger.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.icon,
      required this.suffixIcon,
      this.obscureText = false,
      this.textInputAction = TextInputAction.next,
      this.keyboardType = TextInputType.text,
      this.hasIcon = true,
      this.enabled = true,
      this.borderRadius = 0.0,
      this.contentPadding = 0.0,
      this.fillColor = ColorManager.white,
      this.validator,
      this.inputFormatters = const []})
      : super(key: key);

  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final double borderRadius;
  final bool obscureText, enabled, hasIcon;
  final Color fillColor;
  final double contentPadding;
  final Widget suffixIcon;
  final List<TextInputFormatter> inputFormatters;
  final String? Function(String?)? validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscure = false;

  @override
  void initState() {
    super.initState();
    if (widget.obscureText) {
      obscure = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {
        if (widget.controller.selection ==
            TextSelection.fromPosition(
                TextPosition(offset: widget.controller.text.length - 1))) {
          setState(() {
            widget.controller.selection = TextSelection.fromPosition(
                TextPosition(offset: widget.controller.text.length));
          });
        }
      },
      scrollPadding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      obscureText: obscure,
      inputFormatters: widget.inputFormatters,
      validator: widget.validator,
      cursorColor: ColorManager.white,
      style: TextStyle(
        fontSize: 15.sp,
        color: ColorManager.white,
        fontWeight: FontWeight.w100,
        decorationThickness: 0,
      ),
      decoration: InputDecoration(
        prefixIcon: widget.hasIcon ? Icon(widget.icon) : const SizedBox(),
        prefixIconColor: MaterialStateColor.resolveWith((states) =>
            states.contains(MaterialState.focused)
                ? ColorManager.white
                : ColorManager.white),
        hintText: widget.hintText,
        hintStyle: TextStyle(
            color: ColorManager.white,
            fontSize: 15.sp,
            shadows: const [
              Shadow(
                  color: ColorManager.darkGreen,
                  blurRadius: 1,
                  offset: Offset(1, 1))
            ]),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorManager.white),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 173, 123, 123)),
        ),
      ),
    );
  }
}
