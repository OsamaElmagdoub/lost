import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lost/constants.dart';
import 'package:lost/provider/myProvider.dart';
import 'package:lost/shared/components/components.dart';
import 'package:lost/widgets/customElevatedbutton.dart';
import 'package:provider/provider.dart';

class Search extends StatelessWidget {
  static String id = 'search';

  @override



  TextEditingController searchcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    var p = Provider.of<MyProvider>(context,);

    Color countercolor;
    return
        // Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: Text(
        //     'ابحث عن الحهاز وانت بتشتريه',
        //     style: TextStyle(fontSize: 22),
        //   ),
        // ),
        // body:
        SingleChildScrollView(
          child:
      // SizedBox(
      //   height: MediaQuery.of(context).size.height * 0.3,
      // ),
      Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Text(
                  ' ابحث عن الجهاز وانت بتشتريه علشان تعرف هو متبلغ عنه ولا لأ',
                  style: TextStyle(

                      fontWeight: FontWeight.bold, fontSize: 28),
                textAlign: TextAlign.center,),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                CustomTextField(
    controller: p.countercolor(searchcontroller),

                  valid: (String value) {
                    if (value.isEmpty||value.length<15) {
                      return ('please enter a valid imei ');
                    }
                  },
                  //  txtAlign: TextAlign.right,
                  textDir: TextDirection.rtl,
                  hintText: 'أدخل رقم ال IMEI',
                  keyboardType: TextInputType.number,
                  maxLength: 15,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                CustomElevatedButton(
                  buttonColor: kButtonColor,
                  buttonName: 'بحث',
                  onClick: () {
                    if (formkey.currentState.validate()) {
                      print('valid');
                    }
                  },
                ),SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                TextButton(onPressed: (){}, child: Text('IMEI ازاي أعرف رقم ال ',style: TextStyle(fontSize: 20,),))
              ],
            ),
          ),
      ),

              //),
              );

  }
}
