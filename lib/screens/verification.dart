import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lost/constants.dart';
import 'package:lost/provider/myProvider.dart';
import 'package:lost/screens/my-lost-mobiles.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';

import 'package:lost/widgets/customElevatedbutton.dart';

class Verification extends StatefulWidget {
  static String id = 'verification';

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  getSigncode()async{

    final signCode =
        await SmsAutoFill().getAppSignature;

    print(
        'prefill with a code : ${signCode} ');
  }

  void initState() {
  getSigncode();

    _submitPhoneNumber(
       '+201099030517');
    listenOTP();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _modalRoute = ModalRoute.of(context).settings.arguments;
    var p = Provider.of<MyProvider>(context);
    TextEditingController _otpController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'التحقق من رقم الهاتف',
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: ListView(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'تم إرسال رمز تأكيد إلي رقم ${_modalRoute}'

                  // '${widget.phoneNumber}'
                  ,
                  // 'تم إرسال رمز التأكيد الي رقم , رجاء ادخال الرمز',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              PinFieldAutoFill(
                  controller: _otpController,
                  keyboardType: TextInputType.number,

                  // decoration: // UnderlineDecoration, BoxLooseDecoration or BoxTightDecoration see https://github.com/TinoGuo/pin_input_text_field for more info,
                  currentCode: _otpController.text, // prefill with a code
                  onCodeSubmitted: (val) {}, //code submitted callback
                  onCodeChanged: (val) {
                    _otpController.text = val;
                  }, //code changed callback
                  codeLength: 6 //code length, default 6
                  ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
              ),
              CustomElevatedButton(
                buttonName: 'إنهاء',
                buttonColor: kButtonColor,
                onClick: () async {
                  Map<String, dynamic> data = {
                    'name': p.name,
                    'imei'.toUpperCase(): p.IMEI,
                    'mobile-model': p.phone_model,
                    'phoneNumber': p.Phone_Num
                  };
                  await FirebaseFirestore.instance.collection('data').add(data);

                  Navigator.pushNamed(context, LostMobiles.id,
                      arguments: listenOTP.toString());
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }

  void listenOTP() async {
    await SmsAutoFill().listenForCode;
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
