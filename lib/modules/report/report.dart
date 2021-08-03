import 'package:flutter/material.dart';
import 'package:lost/constants.dart';
import 'package:lost/modules/mobile_number/mobileNumber.dart';
import 'package:lost/provider/myProvider.dart';
import 'package:lost/shared/components/components.dart';

import 'package:lost/widgets/customElevatedbutton.dart';
import 'package:lost/widgets/customtextfield.dart';
import 'package:provider/provider.dart';

class Report extends StatefulWidget {
  static String id = 'report';
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  TextEditingController _imeiController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneModelController = TextEditingController();

  var formkey = GlobalKey<FormState>();

  final int counterLength = 15;

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<MyProvider>(context);

    return
      // Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(
      //     'بلغ عن جهازك المسروق',
      //     style: TextStyle(fontSize: 22),
      //   ),
      // ),
      // body:
      //
      Form(
        key: formkey,
        child: ListView(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.0,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      ':  أدخل البيانات    ',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                CustomTextField(
                  valid: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  textDir: TextDirection.rtl,
                  controller: _nameController,
                  hintText: 'الإسم',
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                CustomTextField(
                  valid: (String value) {
                    if (value.isEmpty ) {
                      return 'Please enter a valid IMEI';
                    }
                    return null;
                  },
                  textDir: TextDirection.rtl,
                  counterColor: _imeiController.text.length < 15
                      ? Colors.black
                      : Colors.blue,
                  controller: _imeiController,
                  hintText: '  رقم ال IMEI',
                  keyboardType: TextInputType.number,
                  maxLength: counterLength,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                CustomTextField(
                  valid: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter your mobile model';
                    }
                    return null;
                  },
                  textDir: TextDirection.rtl,
                  controller: _phoneModelController,
                  hintText: 'نوع الهاتف المسروق',
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                CustomElevatedButton(
                    buttonName: 'التالي',
                    buttonColor: kButtonColor,
                    onClick: () {
                      if (formkey.currentState.validate() ) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Directionality(
                                textDirection: TextDirection.rtl,
                                child: AlertDialog(
                                  title: Text('رقم ال IMEI الذي أدخلته هو :'),
                                  content: Container(
                                    height: 70,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(_imeiController.text),
                                          Text('هل الرقم صحيح أم تود تعديله ؟')
                                        ]),
                                  ),
                                  actions: [
                                    Row(
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('تعديل')),
                                        TextButton(
                                            onPressed: () {
                                              p.IMEI= _imeiController.text;
                                              p.phone_model=_phoneModelController.text;
                                              p.name= _nameController.text;
                                             Navigator.of(context).pushReplacementNamed(MobileNumber.id);

                                            },
                                            child: Text('تم'))
                                      ],
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                    )
                                  ],
                                ),
                              );
                            });
                        //    Navigator.pushNamed(context, MobileNumber.id,arguments: _mobNumController.text);
                      }
                    }),
              ],
            ),
          ),
        ]),
      //),
    );
  }
}
