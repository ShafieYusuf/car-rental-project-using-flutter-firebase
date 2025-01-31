import 'package:carrental/domain/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final bool readOnly;
  final TextEditingController controller;
  final TextStyle? hintstyle;
  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final TextStyle? errorStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextStyle? style;
  final int maxLines;

  const CustomTextFormField({
    super.key,
    this.hintstyle,
    this.errorStyle,
    this.keyboardType,
    this.readOnly = false,
    this.style,
    required this.controller,
    this.maxLines = 1,
    required this.hintText,
    this.obscureText = false,
    this.validator,
    this.enabledBorder,
    this.focusedBorder,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      style: widget.style ??
          Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: const Color.fromARGB(255, 194, 87, 87)),
      maxLines: widget.maxLines,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      decoration: InputDecoration(
        errorStyle: const TextStyle(color: Colors.red),
        hintStyle: widget.hintstyle ??
            Theme.of(context).textTheme.bodySmall!.copyWith(color: kwhite),
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.white)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.white)),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : widget.suffixIcon,
      ),
      obscureText: widget.obscureText && _obscureText,
      validator: widget.validator,
    );
  }
}
