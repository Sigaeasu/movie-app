import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movieapp/components/components.dart';

class RegisterInput extends StatefulWidget {
  const RegisterInput({
    Key? key,
    required this.label,
    this.controller,
    this.isRequired = false,
    this.errorText,
    this.maxLength = 225,
    this.maxLine = 1,
    this.prefix,
    this.inputType,
    this.background,
    this.readOnly,
    this.suffix,
    this.onChange,
    this.inputFormatters,
  }) : super(key: key);

  final String label;
  final TextEditingController? controller;
  final bool? isRequired;
  final String? errorText;
  final int maxLength;
  final int maxLine;
  final Widget? prefix;
  final TextInputType? inputType;
  final Color? background;
  final bool? readOnly;
  final Widget? suffix;
  final ValueChanged? onChange;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<RegisterInput> createState() => _RegisterInputState();
}

class _RegisterInputState extends State<RegisterInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Row(
            children: [
              Text(widget.label),
              if (widget.isRequired == true) ...[
                Text(
                  '*',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                )
              ]
            ],
          ),
          SizedBox(height: 4),
          RegularInput(
            onChange: widget.onChange,
            hintText: widget.label,
            controller: widget.controller,
            errorText: widget.errorText,
            maxLength: widget.maxLength,
            maxLine: widget.maxLine,
            prefix: widget.prefix,
            inputType: widget.inputType,
            background: widget.background,
            suffix: widget.suffix,
            readOnly: widget.readOnly,
            inputFormatters: widget.inputFormatters,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
