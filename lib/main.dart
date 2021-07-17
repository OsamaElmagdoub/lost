import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lost/provider/myProvider.dart';
import 'package:lost/screens/my-lost-mobiles.dart';
import 'package:lost/screens/report.dart';
import 'package:lost/screens/Search.dart';
import 'package:lost/screens/home_page.dart';
import 'package:lost/screens/mobileNumber.dart';
import 'package:lost/screens/verification.dart';
import 'package:provider/provider.dart';

main()async{
  WidgetsFlutterBinding.ensureInitialized();
 await  Firebase.initializeApp();
  runApp(ChangeNotifierProvider(create: (_)=>MyProvider(),
  child: MyApp(),
  ));
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(


    //  debugShowCheckedModeBanner: false,
      initialRoute:HomePage.id,
      
      routes: {
        HomePage.id:(context)=>HomePage(),
Search.id:(context)=>Search(),
        Report.id:(context)=>Report(),
        MobileNumber.id:(context)=>MobileNumber(),
        Verification.id:(context)=>Verification(),
        LostMobiles.id:(context)=>LostMobiles(),
      },
    );
  }
}
