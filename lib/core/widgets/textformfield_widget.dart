import 'package:ajev_application/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/config.dart';
import '../utility/formatters.dart';

class BuildTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final FocusNode? focusNode;
  final bool obscureText;
  final String? prefixText;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? suffixText;
  final TextStyle? suffixStyle;
  final TextInputType? keyboardType;
  final int minLines;
  final int? maxLines;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final Function()? onTap;
  final bool showValidator;
  final FormFieldValidator<String>? validator;
  final bool disable;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autoValidateMode;
  final TextAlign textAlign;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final Color? bgColor;
  final Function(String value)? onFieldSubmitted;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? inputBorder;
  final bool isCollapsed;
  final Color? cursorColor;
  final void Function(bool value)? onFocusChange;
  final bool necessary;
  final EdgeInsetsGeometry? padding;
  final BoxConstraints? constraints;
  final bool convertTheme;

  const BuildTextFormField({
    super.key,
    this.controller,
    this.initialValue,
    this.obscureText = false,
    this.focusNode,
    this.prefixText,
    this.suffixIcon,
    this.suffixText,
    this.suffixStyle,
    this.labelText,
    this.hintText,
    this.helperText,
    this.prefixIcon,
    this.keyboardType,
    this.minLines = 1,
    this.maxLines,
    this.maxLength,
    this.onSaved,
    this.onTap,
    this.validator,
    this.showValidator = true,
    this.disable = false,
    this.readOnly = false,
    this.onChanged,
    this.inputFormatters,
    this.autoValidateMode,
    this.textAlign = TextAlign.start,
    this.hintStyle,
    this.errorStyle,
    this.bgColor,
    this.onFieldSubmitted,
    this.contentPadding,
    this.inputBorder,
    this.isCollapsed = false,
    this.cursorColor,
    this.onFocusChange,
    this.style,
    this.necessary = false,
    this.padding,
    this.constraints,
    this.convertTheme = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? context.onlyBottomPaddingNormal,
      child: Focus(
        onFocusChange: onFocusChange,
        child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
          key: key,
          controller: controller,
          initialValue: initialValue,
          focusNode: focusNode,
          obscureText: obscureText,
          cursorColor: cursorColor,
          decoration: InputDecoration(
            suffixText: suffixText,
            suffixStyle:
                suffixStyle ?? AppTextStyle(context).kTextDefaultGreyTurquoise,
            alignLabelWithHint: true,
            constraints: constraints,
            isCollapsed: isCollapsed,
            fillColor: bgColor ?? Colors.transparent,
            filled: true,
            contentPadding: contentPadding ?? const EdgeInsets.all(12),
            prefixText: prefixText,
            prefixStyle: AppTextStyle(context, convertTheme: convertTheme)
                .kTextDefaultGreyTurquoise,
            labelStyle: AppTextStyle(context, convertTheme: convertTheme)
                .kTextDefaultGreyTurquoise,
            helperMaxLines: 2,
            errorMaxLines: 2,
            hintMaxLines: 2,
            hintText: hintText,
            hintStyle: hintStyle ??
                AppTextStyle(context, convertTheme: convertTheme)
                    .kTextDefaultGreyTurquoise,
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.all(12),
                    child: prefixIcon,
                  )
                : prefixIcon,
            label: labelText != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (validator != null && showValidator)
                        Text(
                          '* ',
                          style:
                              AppTextStyle(context, convertTheme: convertTheme)
                                  .kText16Red,
                        ),
                      Text(
                        emptyToDash(labelText),
                        style: AppTextStyle(context, convertTheme: convertTheme)
                            .kTextDefaultGreyTurquoise,
                      ),
                    ],
                  )
                : null,
            counterStyle: AppTextStyle(context, convertTheme: convertTheme)
                .kTextDefaultBlack,
            prefixIconColor: !disable
                ? AppColors.instance.greyTurquoise(context)
                : AppColors.instance.disable(context),
            suffixIcon: suffixIcon != null
                ? Padding(
                    padding: const EdgeInsets.all(12),
                    child: suffixIcon,
                  )
                : null,
            suffixIconColor: !disable
                ? AppColors.instance.greyTurquoise(context)
                : AppColors.instance.disable(context),
            enabledBorder: inputBorder ??
                OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.instance
                        .gainsBoro(context, convertTheme: convertTheme),
                  ),
                ),
            focusedBorder: inputBorder ??
                OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.instance
                        .gainsBoro(context, convertTheme: convertTheme),
                  ),
                ),
            border: inputBorder ??
                OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.instance
                        .gainsBoro(context, convertTheme: convertTheme),
                  ),
                ),
            errorBorder: inputBorder ??
                OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.instance.red(context),
                  ),
                ),
            focusedErrorBorder: inputBorder ??
                OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.instance.red(context),
                  ),
                ),
            disabledBorder: inputBorder ??
                OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.instance.disable(context),
                  ),
                ),
            errorStyle: errorStyle ??
                AppTextStyle(context, convertTheme: convertTheme)
                    .kTextDefaultRed,
          ),
          style: style ??
              AppTextStyle(context, convertTheme: convertTheme)
                  .kTextDefaultBlack,
          keyboardType: keyboardType ?? TextInputType.text,
          maxLength: maxLength,
          minLines: minLines,
          maxLines: maxLines,
          onChanged: onChanged,
          onSaved: onSaved,
          onTap: onTap,
          validator: validator,
          enabled: !disable,
          readOnly: readOnly,
          inputFormatters: inputFormatters,
          autovalidateMode: autoValidateMode,
          textAlign: textAlign,
          onFieldSubmitted: onFieldSubmitted,
          canRequestFocus: !readOnly,
        ),
      ),
    );
  }
}
