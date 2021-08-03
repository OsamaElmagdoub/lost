import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lost/constants.dart';
import 'package:lost/modules/verification/verification.dart';
import 'package:lost/provider/myProvider.dart';
import 'package:lost/shared/components/components.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';

class MobileNumber extends StatefulWidget {
  // const MobileNumber({Key? key}) : super(key: key);

  static String id = 'mobilenumber';
  @override
  _MobileNumberState createState() => _MobileNumberState();
}

class _MobileNumberState extends State<MobileNumber> {
  var formkey = GlobalKey<FormState>();

  TextEditingController _mobNumController = TextEditingController();
  String countrycode = '+2';

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<MyProvider>(context);
    String phoneNumber = "${_mobNumController.text}";
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              'التسجيل برقم الموبايل',
              style: TextStyle(fontSize: 22),
            )),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
              child: SingleChildScrollView(
                  child: Form(
            key: formkey,
            child: Column(children: [
              Text(
                'أدخل رقم موبايل يمكن التواصل معك من خلاله في حالة ايجاد الجهاز ',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: CustomTextField(
                  valid: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter your number';
                    }
                    return null;
                  },

                  maxLength: 11,

                  textDir: TextDirection.ltr,
                  // prefixstring: '+2   ',
                  txtAlign: TextAlign.left,
                  controller: _mobNumController,
                  //maxLength: ,
                  keyboardType: TextInputType.phone,
                  //   hintText: 'رقم الموبايل',
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              CustomElevatedButton(
                  buttonColor: kButtonColor,
                  buttonName: 'التالي'.toUpperCase(),
                  onClick: () {
                    if (formkey.currentState.validate()) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Directionality(
                              textDirection: TextDirection.rtl,
                              child: AlertDialog(
                                //     backgroundColor: Colors.red,
                                title: Text('سوف نتحقق من رقم الهاتف :'),
                                content: Container(
                                  height: 70,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Directionality(
                                          child: Text(
                                              " ${_mobNumController.text}"),
                                          textDirection: TextDirection.ltr,
                                        ),
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
                                          onPressed: () async {
                                            p.Phone_Num =
                                                _mobNumController.text;
                                            print(p.Phone_Num);
                                            final signCode = await SmsAutoFill()
                                                .getAppSignature;

                                            print(
                                                'prefill with a code : ${signCode} ');
                                            Navigator.popAndPushNamed(
                                                context, Verification.id,
                                                arguments: phoneNumber);
                                            // _submitPhoneNumber(
                                            //     '+2${_mobNumController.text}'
                                            // );
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
                    }
                  })
            ]),
          ))),
        ));
  }

  Future<List> _submitPhoneNumber(String phoneNumber) async {
    /// NOTE: Either append your phone number country code or add in the code itself
    AuthCredential _phoneAuthCredential =
        AuthCredential(providerId: '', signInMethod: '');
    String _verifectionId = '';
    print(phoneNumber);

    /// The below functions are the callbacks, separated so as to make code more readable
    void verificationCompleted(AuthCredential phoneAuthCredential) async {
      print('verificationCompleted');
      _phoneAuthCredential = phoneAuthCredential;
      print(phoneAuthCredential);
      await FirebaseAuth.instance
          .signInWithCredential(_phoneAuthCredential)
          .then((UserCredential authRes) async {
        print(authRes.user.toString());
      });
    }

    void verificationFailed(Exception error) {
      print(error.toString());
    }

    void codeSent(dynamic verificationId, dynamic code) {
      _verifectionId = verificationId;
      print('تم ارسال رمز التحقق');
    }

    void codeAutoRetrievalTimeout(String verificationId) {
      print('codeAutoRetrievalTimeout');
      //Navigator.push(context, MaterialPageRoute(builder: (context)=>VerfectionScreen(verificationId)));
    }

    await FirebaseAuth.instance.verifyPhoneNumber(
      /// Make sure to prefix with your country code
      phoneNumber: phoneNumber,

      /// `seconds` didn't work. The underlying implementation code only reads in `milliseconds`
      timeout: Duration(milliseconds: 1000),

      /// If the SIM (with phoneNumber) is in the current device this function is called.
      /// This function gives `AuthCredential`. Moreover `login` function can be called from this callback
      verificationCompleted: verificationCompleted,

      /// Called when the verification is failed
      verificationFailed: verificationFailed,

      /// This is called after the OTP is sent. Gives a `verificationId` and `code`
      codeSent: codeSent,

      /// After automatic code retrival `tmeout` this function is called
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
    return [
      _phoneAuthCredential,
      _verifectionId
    ]; // All the callbacks are above
  }
}
