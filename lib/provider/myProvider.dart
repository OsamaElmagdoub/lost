import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{
  String name;
  String IMEI;
  String phone_model;
  String Phone_Num;
Color counterColor;
countercolor(TextEditingController textEditingController){
  textEditingController.text.length<15?counterColor=Colors.black:counterColor=Colors.blue;
  notifyListeners();
}

}