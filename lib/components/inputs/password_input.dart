import 'package:movieapp/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({
    Key? key,
    this.controller,
    this.focusNode,
    this.hintText,
    this.label,
    this.isRequired,
    this.errorText,
    this.inputFormatters,
    this.onChange,
    this.onSubmit,
    this.inputAction,
    this.style,
    this.inputType,
    this.maxLength,
    this.underlineInput,
    this.underlineInputFocus,
    this.underlineInputError,
    this.prefixIcon,
  }) : super(key: key);

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final String? label;
  final bool? isRequired;
  final String? errorText;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChange;
  final ValueChanged<String>? onSubmit;
  final TextInputAction? inputAction;
  final TextStyle? style;
  final TextInputType? inputType;
  final int? maxLength;
  final UnderlineInputBorder? underlineInput;
  final UnderlineInputBorder? underlineInputFocus;
  final UnderlineInputBorder? underlineInputError;
  final String? prefixIcon;

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    final suffix = InkWell(
      onTap: () {
        setState(() {
          isVisible = !isVisible;
        });
      },
      child: Icon(
        isVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
        key: const Key('change_visibility_password_input_icon'),
        color: Color(0xFFAAAAAA),
        size: 20,
      ),
    );

    return RegularInput(
      errorText: widget.errorText,
      controller: widget.controller,
      hintText: widget.hintText,
      label: widget.label,
      isRequired: widget.isRequired,
      focusNode: widget.focusNode,
      inputAction: widget.inputAction,
      inputFormatters: widget.inputFormatters,
      onChange: widget.onChange,
      onSubmit: widget.onSubmit,
      style: widget.style,
      inputType: widget.inputType ?? TextInputType.visiblePassword,
      maxLength: widget.maxLength,
      obscureText: !isVisible,
      suffix: suffix,
      underlineInput: widget.underlineInput,
      underlineInputFocus: widget.underlineInputFocus,
      underlineInputError: widget.underlineInputError,
      prefixIcon: widget.prefixIcon,
    );
  }
}
