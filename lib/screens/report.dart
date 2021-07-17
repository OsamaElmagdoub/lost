import 'package:flutter/material.dart';
import 'package:lost/constants.dart';
import 'package:lost/provider/myProvider.dart';
import 'package:lost/screens/entered-data.dart';
import 'package:lost/screens/mobileNumber.dart';

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


  // EnteredData e = EnteredData(

  // );

  final int counterLength = 15;

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<MyProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'بلغ عن جهازك المسروق',
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: ListView(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.0,
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(),
              // Text(
              //   'بلغ عن جهازك المسروق',
              //   style: TextStyle(fontSize: 25, color: kReportButton,),
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    ':  أدخل البيانات    ',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              CustomTextField(
                controller: _nameController,
                hintText: 'الإسم',
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              CustomTextField(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
p.name=_nameController.text;
p.IMEI= _imeiController.text;
p.phone_model=_phoneModelController.text;
print(p.name);
print(p.IMEI);
print(p.phone_model);
                                        Navigator.popAndPushNamed(
                                            context, MobileNumber.id,


                                        );
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
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
