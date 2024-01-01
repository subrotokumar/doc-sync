import 'package:docsync/src/config/themes/themes.dart';
import 'package:docsync/src/core/core.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.isPassword = false,
    this.onSubmit,
    this.onChange,
    this.radius,
    this.labelEffect = false,
    this.filledColor = Colors.white,
    this.borderColor = Colors.grey,
  });
  final Color borderColor;
  final bool labelEffect;
  final Color filledColor;
  final double? radius;
  final TextEditingController controller;
  final String hint;
  final bool isPassword;
  final Function(String value)? onSubmit;
  final Function(String value)? onChange;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showPass = false;
  final double defaultRadius = 7;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: TextInputType.emailAddress,
      onSubmitted: widget.onSubmit,
      onChanged: widget.onChange,
      obscureText: widget.isPassword ? (showPass ? true : false) : false,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: widget.filledColor,
        focusColor: colorFromHex('ebecf0'),
        hoverColor: colorFromHex('ebecf0'),
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () => setState(() => showPass = !showPass),
                child: Icon(
                  !showPass
                      ? PhosphorIconsBold.eyeSlash
                      : PhosphorIconsBold.eye,
                  color: Colors.black26,
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius ?? defaultRadius),
          borderSide: BorderSide(color: widget.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius ?? defaultRadius),
          borderSide: BorderSide(color: widget.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius ?? defaultRadius),
          borderSide: BorderSide(color: widget.borderColor),
        ),
        hintText: widget.hint,
        hintStyle: Poppins(
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
        labelText: widget.labelEffect ? widget.hint : null,
      ),
    );
  }
}
