import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_eye/feature/presentation/common/colors/colors.dart';
import 'package:open_eye/feature/presentation/common/form/form.dart';

class EditTextField {
  TextFormField getCustomEditTextArea(
      {String labelValue = "",
      String hintValue = "",
      int? maxLength, int? maxLines,
      bool? obscureText,
      bool? validation,
      bool? validationEmail,
      bool? validationPassword,
      TextEditingController? controller,
      TextInputType keyboardType = TextInputType.text,
      TextStyle? textStyle,
      String? validationErrorMsg}) {
    TextFormField textFormField = TextFormField(
      keyboardType: keyboardType,
      style: textStyle,
      controller: controller,
            validator: (value) {
        if (validation!) {
          if (value!.isEmpty) {
            return validationErrorMsg;
          } else if (validationEmail!) {
            controller!.text.toLowerCase().replaceAll(' ', '');
            print(controller);
            if (!emailValidatorRegExp.hasMatch(value)) {
              return kInvalidEmailError;
            }
          } else if (validationPassword!) {
            if (value.length < 8) {
              return kShortPassError;
            }
          }
        }
      },
      obscureText: obscureText!,
      maxLength: maxLength,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelValue,
        hintText: hintValue,
        labelStyle: textStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            width: 1,
            color: grey,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            width: 1,
            color: grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            width: 1,
            color: primaryColor,
          ),
        ),
      ),
    );
    return textFormField;
  }
}


class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String? hintValue;
  final int? maxLines;
  final TextEditingController controller;
  final bool? enabled;
  CustomTextFormField({required this.labelText, required this.controller, this.hintValue, this.maxLines, this.enabled});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled!,
      maxLines: maxLines!,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintValue,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            width: 1,
            color: grey,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            width: 1,
            color: grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            width: 1,
            color: primaryColor,
          ),
        ),
      ),
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$labelText is required';
        }
        return null;
      },
    );
  }
}