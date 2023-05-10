import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegularInput extends StatelessWidget {
  const RegularInput({
    this.obscureText = false,
    this.focusNode,
    this.hintText,
    this.suffix,
    this.prefixIcon,
    this.controller,
    this.background,
    this.errorText,
    this.minLine = 1,
    this.maxLine = 1,
    this.onChange,
    this.onSubmit,
    this.inputAction,
    this.style,
    this.inputType,
    this.enable = true,
    this.onTap,
    this.readOnly,
    this.inputFormatters,
    this.maxLength,
    this.autoFocus,
    this.label,
    this.prefix,
    this.isRequired,
    this.textAlign,
    this.underlineInput,
    this.underlineInputFocus,
    this.underlineInputError,
    Key? key,
  }) : super(key: key);

  final String? prefixIcon;
  final bool? obscureText;
  final bool? enable;
  final bool? readOnly;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final String? errorText;
  final Widget? suffix;
  final Color? background;
  final int minLine;
  final int maxLine;
  final ValueChanged<String>? onChange;
  final ValueChanged<String>? onSubmit;
  final TextInputAction? inputAction;
  final TextStyle? style;
  final TextInputType? inputType;
  final VoidCallback? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final bool? autoFocus;
  final String? label;
  final Widget? prefix;
  final bool? isRequired;
  final TextAlign? textAlign;
  final UnderlineInputBorder? underlineInput;
  final UnderlineInputBorder? underlineInputFocus;
  final UnderlineInputBorder? underlineInputError;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        iconTheme: const IconThemeData(size: 10),
      ),
      child: TextFormField(
        focusNode: focusNode,
        controller: controller,
        obscureText: obscureText ?? false,
        minLines: minLine,
        maxLines: maxLine,
        maxLength: maxLength,
        onChanged: onChange,
        onFieldSubmitted: onSubmit,
        textAlign: textAlign ?? TextAlign.start,
        textInputAction: inputAction ?? TextInputAction.done,
        style: style ??
            const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
        keyboardType: inputType,
        enabled: enable,
        onTap: onTap,
        readOnly: readOnly ?? false,
        inputFormatters: inputFormatters,
        autofocus: autoFocus ?? false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          focusedBorder: underlineInputFocus,
          enabledBorder: underlineInput,
          focusedErrorBorder: underlineInputError,
          errorBorder: underlineInputError,
          prefixIcon: (prefix != null && prefixIcon == null)
              ? Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: prefix,
                )
              : (prefixIcon != null
                  ? Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: SvgPicture.asset(
                        prefixIcon!,
                        width: 20,
                        height: 20,
                        //fit: BoxFit.fill,
                      ),
                    )
                  : null),
          label: label != null ? Text(label!) : null,
          counterText: '',
          fillColor: background,
          hintText: hintText ?? '',
          errorText: errorText,
          suffixIcon: suffix,
          errorMaxLines: 2,
        ),
      ),
    );
  }
}
