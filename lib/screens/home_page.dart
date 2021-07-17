import 'package:flutter/material.dart';
import 'package:lost/constants.dart';
import 'package:lost/screens/report.dart';
import 'package:lost/screens/Search.dart';
import 'package:lost/widgets/customElevatedbutton.dart';

class HomePage extends StatelessWidget {
  static String id = 'homePage';
  String value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

        backgroundColor: Colors.white,

//    bottomNavigationBar: BottomNavigationBar(
// type: BottomNavigationBarType.fixed,
//      backgroundColor: Colors.red,
//      fixedColor: Colors.white,
//      items: [
//        BottomNavigationBarItem(
//            title: Text('osam'),
//            icon: Icon(Icons.build)),
//        BottomNavigationBarItem(
//            title: Text('osam'),
//            icon: Icon(Icons.build)),
//        BottomNavigationBarItem(
//            title: Text('osam'),
//            icon: Icon(Icons.build)),
//        BottomNavigationBarItem(
//            title: Text('osam'),
//            icon: Icon(Icons.build)),
//
//    ],),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Image(
                      image: AssetImage(
                          "images/Awicons-Vista-Artistic-Search.ico"))),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              Text('ابحث عن أشياءك المفقوده',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              CustomElevatedButton(
                buttonName: 'ابحث عن الجهاز وانت بتشتريه',
                onClick: () {
                  Navigator.pushNamed(context, Search.id);
                },
                buttonColor: kButtonColor,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
              ),
              CustomElevatedButton(
                onClick: () {
                  Navigator.pushNamed(context, Report.id);
                },
                buttonName: 'بلغ عن جهازك المسروق',
                buttonColor: kButtonColor,
              )
            ],
          ),
        ));
  }
}
