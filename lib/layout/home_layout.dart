import 'package:flutter/material.dart';
import 'package:lost/modules/mobile_number/mobileNumber.dart';
import 'package:lost/modules/my_lost_mobiles/my-lost-mobiles.dart';
import 'package:lost/modules/report/report.dart';
import 'package:lost/modules/search/search.dart';
import 'package:lost/modules/verification/verification.dart';
class HomeLAyout extends StatefulWidget {
//  const HomeLAyout({Key? key}) : super(key: key);
  static String id = 'homeLayout';

  @override
  _HomeLAyoutState createState() => _HomeLAyoutState();
}

class _HomeLAyoutState extends State<HomeLAyout> {
List<Widget> twoscreens=[
  MobileNumber(),
  Verification()
];
Map<String,GlobalKey<NavigatorState>> navigatorKeys={

  Search.id: GlobalKey<NavigatorState>(),
  Report.id: GlobalKey<NavigatorState>(),
  LostMobiles.id: GlobalKey<NavigatorState>(),
};
  List<Widget> screens =[

    Search(),

  Report(),
  LostMobiles(),



];
  int currentIndex=0;

  List <String>appbarTitles=[
'ابحث عن جهاز',
    'بلغ عن تليفونك'
 ,
  'الأجهزه اللي بلغت عنها'
  ] ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
centerTitle: true,
        title: Text(appbarTitles[currentIndex]),

      ),
bottomNavigationBar: BottomNavigationBar(
currentIndex: currentIndex,

  type: BottomNavigationBarType.fixed,

  onTap: (index){

  setState(() {
    currentIndex=index;
  });
  },
  items: [BottomNavigationBarItem(icon: Icon(Icons.search),label: "search"),

    BottomNavigationBarItem(icon: Icon(Icons.report),label: "Report"),
    BottomNavigationBarItem(icon: Icon(Icons.report_gmailerrorred_outlined),label: "My Lost"),
    //// BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
    // BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home")

  ],


),
      body: screens[currentIndex],
    );

  }
}
