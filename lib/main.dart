import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lost/layout/home_layout.dart';
import 'package:lost/modules/home/home_page.dart';
import 'package:lost/modules/report/report.dart';
import 'package:lost/modules/search/search.dart';
import 'package:lost/provider/myProvider.dart';

import 'package:provider/provider.dart';

import 'modules/mobile_number/mobileNumber.dart';
import 'modules/my_lost_mobiles/my-lost-mobiles.dart';
import 'modules/verification/verification.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: (_) => MyProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //  debugShowCheckedModeBanner: false,
      initialRoute: HomePage.id,

      routes: {
        HomeLAyout.id:(context)=>HomeLAyout(),
        HomePage.id: (context) => HomePage(),
        Search.id: (context) => Search(),
        Report.id: (context) => Report(),
        MobileNumber.id: (context) => MobileNumber(),
        Verification.id: (context) => Verification(),
        LostMobiles.id: (context) => LostMobiles(),
      },
    );
  }
}
