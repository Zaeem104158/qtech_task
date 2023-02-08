import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qtech_product_task/utils/constants.dart';


import '../utils/strings.dart';
import '../utils/style.dart';

class TextFormFieldNoBorderComponent extends StatefulWidget {
  final String? hint;
  final String font;
  final String? label;
  final bool enabled;
  final double? fontSize;
  final bool isValidate;
  final Color textFontColor;
  final FontWeight fontWeight;
  final IconData? suffixIcon;
  final Widget? suffixWidget;
  final EdgeInsets padding;
  final Widget? prefixWidget;
  final Color? prefixIconColor;
  final String? defaultValue;
  final bool isEmailValidation;
  final bool isPhoneValidation;
  final bool isRemoveBottomBorder;
  final bool isReadOnly;
  final bool expands;
  final int maxLines;
  final bool autoFocus;
  final EdgeInsets contentPadding;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final InputBorder? inputDecorationBorder;
  final Function(String? value) onChanged;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final FilteringTextInputFormatter? inputFormatters;
  final TextEditingController? textEditingController;


  const TextFormFieldNoBorderComponent({
    Key? key,
    this.hint,
    this.label,
    this.suffixIcon,
    this.suffixWidget,
    this.prefixWidget,
    this.defaultValue,
    this.enabled = true,
    this.isReadOnly = false,
    this.font = latoFont,
    this.inputFormatters,
    this.isValidate = true,
    this.expands = false,
    required this.onChanged,
    this.inputDecorationBorder,
    this.floatingLabelBehavior,
    this.fontSize = textSmallFontSize,
    this.isEmailValidation = false,
    this.isPhoneValidation = false,
    this.isRemoveBottomBorder = false,
    this.fontWeight = mediumFontWeight,
    this.maxLines = 1,
    this.autoFocus = false,
    this.textFontColor = kTextColor,
    this.prefixIconColor = kPrimaryColor,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.textEditingController,
    this.padding = const EdgeInsets.fromLTRB(8, 8, 8, 8),
    this.contentPadding = const EdgeInsets.fromLTRB(20, 0, 20, 20),
  }) : super(key: key);

  @override
  State<TextFormFieldNoBorderComponent> createState() => _TextFormFieldNoBorderComponentState();
}

class _TextFormFieldNoBorderComponentState extends State<TextFormFieldNoBorderComponent> {
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Form(
        key: _formKey,
        child: TextFormField(
          enabled: widget.enabled,
          readOnly: widget.isReadOnly,
          controller: widget.textEditingController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          initialValue: widget.defaultValue,
          expands: widget.expands,
          maxLines: widget.maxLines,
          autofocus: widget.autoFocus,
          onChanged: (value) {
            if (_formKey.currentState != null &&
                _formKey.currentState!.validate()) {
              widget.onChanged(value);
            } else {
              widget.onChanged(null);
            }
          },
          validator: widget.isValidate
              ? (value) {
                  var hintText = widget.hint?.tr() ?? "";
                  if (value == null || value.trim().isEmpty) {
                    //return hintText + "empty_field_warning".tr();
                  } else if (widget.isEmailValidation) {
                    if (value.contains(" ")) {
                      return hintText + "can_not_contain_white_space".tr();
                    } else if (!RegExp(emailPattern).hasMatch(value)) {
                      return "Invalid ${hintText.tr()} Address";
                    } else if (widget.isPhoneValidation) {
                      if (value.contains('')) {
                        return hintText + "can_not_contain_white_space".tr();
                      } else if (value.length != 11) {
                        return kInvalidPhoneNumber;
                      }
                    }
                  }

                  return null;
                }
              : null,
          inputFormatters:
              widget.inputFormatters == null ? null : [widget.inputFormatters!],
          style: GoogleFonts.getFont(
            widget.font,
            fontWeight: widget.fontWeight,
            color: widget.textFontColor,
            fontSize: widget.fontSize,
          ),
          enableSuggestions: true,
          keyboardType: widget.textInputType,
          textInputAction: widget.textInputAction,
          decoration: InputDecoration(
            filled: widget.isRemoveBottomBorder,
            fillColor: widget.isRemoveBottomBorder ? Colors.transparent : null,
            /*border: OutlineInputBorder(
              borderSide: const BorderSide(color: kDisabledTextColor, width: 1.0),
              borderRadius: BorderRadius.circular(4.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kPrimaryColor, width: 2.0),
              borderRadius: BorderRadius.circular(4.0),
            ),*/
            floatingLabelBehavior: widget.floatingLabelBehavior,
            suffixIcon: widget.suffixWidget,
            prefixIcon: widget.prefixWidget,
            hintText: widget.hint?.tr() ?? "",
            hintStyle: widget.enabled
                ? const TextStyle(
                    color: kDisabledTextColor,
                    fontFamily: latoFont,
                    fontSize: textSmallFontSize)
                : const TextStyle(
                    color: kDisabledTextColor,
                    fontFamily: latoFont,
                    fontSize: textSmallFontSize),
            labelText: widget.label?.tr() ?? "",
            labelStyle: widget.isReadOnly
                ? const TextStyle(
                    color: kDisabledTextColor,
                    fontFamily: latoFont,
                    fontSize: textFontSize)
                : const TextStyle(
                    color: kTextColor,
                    fontFamily: latoFont,
                    fontSize: textFontSize),
            errorMaxLines: 2,
            contentPadding: widget.contentPadding,
            suffixIconConstraints: const BoxConstraints(
              minHeight: 16,
              minWidth: 48,
            ),
            prefixIconConstraints: const BoxConstraints(
              minHeight: 8,
              minWidth: 48,
            ),
            /*suffixIcon: widget.suffixIcon != null ? IconButton(
              icon: Icon(
                widget.suffixIcon,
                color: widget.prefixIconColor,
              ),
              onPressed: () {},
            ) : null,*/
            /*prefixIcon: widget.prefixIcon != null
                ? IconButton(
              icon: Icon(
                widget.prefixIcon,
                color: widget.prefixIconColor,
              ),
              onPressed: () {},
            )
                : null,*/
          ),
        ),
      ),
    );
  }
}
