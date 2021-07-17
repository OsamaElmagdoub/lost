import 'package:flutter/material.dart';
import 'package:lost/constants.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Color counterColor;
  final TextInputType keyboardType;
  final int maxLength;
  Function onChanged;
  TextDecoration textDirection;
  final key;
  final TextEditingController controller;
  CustomTextField(
      {this.counterColor,
      this.key,
      this.hintText,
      this.keyboardType,
      this.maxLength,
      this.controller,
      this.onChanged
      ,this.textDirection
      });

  @override
  Widget build(BuildContext context) {
    return Directionality(

      textDirection:TextDirection.rtl,
      child: TextFormField(
validator: (value) {

},
        autofocus: false,
        key: key,
        onChanged: onChanged,
        controller: controller,
        maxLength: maxLength,
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        keyboardType: keyboardType,
        decoration: InputDecoration(


            //counterText: '',
            filled: true,
            counterStyle: TextStyle(color: counterColor, fontSize: 18),
            labelStyle: TextStyle(
              fontSize: 20,
              height: 0.2,
            ),
            hintText: hintText,
            labelText: hintText,
            hintStyle: TextStyle(fontSize: 20),
            alignLabelWithHint: true,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}
