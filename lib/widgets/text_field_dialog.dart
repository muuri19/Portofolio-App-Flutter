import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:muuri_project/common/color_style.dart';
import 'package:muuri_project/common/text_style.dart';

class TextFieldDialog extends StatelessWidget {
  final String labelName;
  final String idName;
  final String message;
  final TextEditingController controller;
  const TextFieldDialog(
      {super.key, required this.labelName, required this.idName, required this.message, required this.controller});

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      controller: controller,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
      style: textFormStyle,
      cursorColor: Colors.black,
      name: idName,
      validator: (value) {
                      if (value == null || value.isEmpty) {
                        return message;
                      }
                      return null;
                    },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: labelName,
        labelStyle: TextStyle(
            fontSize: 13,
            color: primaryColor.withOpacity(0.7),
            fontWeight: FontWeight.w900),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey)),
        errorBorder:
            const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        focusedErrorBorder:
            const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
            
      ),
      
    );
  }
}
