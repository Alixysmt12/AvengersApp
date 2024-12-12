import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import '../theme/color_constants.dart';

class EditTextWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final IconData icon;
  final bool obscureText;
  final bool readOnly;
  final TextInputType? keyboardType;
  final bool isError;
  final int? maxLength;

  const EditTextWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
    required this.icon,
    this.obscureText = false,
    this.readOnly = false,
    this.keyboardType,
    this.isError = false,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text(
          hintText,
          style: TextStyle(
            color: isError ? Colors.red : ColorConstants.textPrimary,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          style: TextStyle(color: ColorConstants.textPrimary),
          obscureText: obscureText,
          controller: controller,
          readOnly: readOnly,
          keyboardType: keyboardType,
          maxLength: maxLength,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.0),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey), // Set hint text color to gray
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide.none,
            ),
            fillColor: Colors.grey[200], // Set fill color to gray
            filled: true,
          ),
        ),
      ],
    );
  }
}


