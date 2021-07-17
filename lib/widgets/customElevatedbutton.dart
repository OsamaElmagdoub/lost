import 'package:flutter/material.dart';
import 'package:lost/constants.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonName;
  final Function onClick;
final Color buttonColor;
  CustomElevatedButton({
    this.buttonName,
    this.onClick,
    this.buttonColor,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(

width: MediaQuery.of(context).size.width,
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
  }
}
