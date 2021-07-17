import 'package:flutter/material.dart';
import 'package:lost/constants.dart';
import 'package:lost/widgets/customElevatedbutton.dart';
import 'package:lost/widgets/customtextfield.dart';

class Search extends StatelessWidget {
  static String id = 'search';
  @override
  Widget build(BuildContext context) {
   final _formkey = GlobalKey<FormState>();
    return Scaffold(
    //  resizeToAvoidBottomInset: false,

      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ابحث عن الحهاز وانت بتشتريه',
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: Form(
        key: _formkey,

        child: ListView(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(

                  hintText: 'أدخل رقم ال IMEI',
                  keyboardType: TextInputType.number,
                  maxLength: 15,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                CustomElevatedButton(
                  buttonColor: kButtonColor,
                  buttonName: 'بحث',
                  onClick: () {},
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
