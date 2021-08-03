import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget CustomTextField({
  final String hintText,
  final Color counterColor,
  final TextInputType keyboardType,
  final int maxLength,
  Function onChanged,
  TextDirection textDir = TextDirection.rtl,
  TextAlign txtAlign= TextAlign.right,
  Function valid,
  final key,
  final TextEditingController controller,
}) =>
    Directionality(
      textDirection: textDir,
      child: TextFormField(
        validator: valid,
        autofocus: false,
        key: key,
        onChanged: onChanged,
        controller: controller,
        maxLength: maxLength,
        style: TextStyle(fontSize: 20),
        textAlign: txtAlign,
        textDirection: TextDirection.rtl,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            prefixStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),

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


 Widget  CustomElevatedButton (
{
final
String
buttonName
,
final
Function
onClick
,
final
Color
buttonColor
,
})=>
     SizedBox(
       width: double.infinity,
       child: ElevatedButton(

           style: ButtonStyle(
               backgroundColor: MaterialStateProperty.all(buttonColor),
               shape: MaterialStateProperty.all(RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(12),

               ))
           ),     onPressed: onClick,
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text(
               buttonName,
               style: TextStyle(fontSize:22, fontWeight: FontWeight.w400),
             ),
           )),
     );

