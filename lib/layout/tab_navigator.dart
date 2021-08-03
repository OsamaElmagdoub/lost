import 'package:flutter/material.dart';
import 'package:lost/modules/my_lost_mobiles/my-lost-mobiles.dart';
import 'package:lost/modules/report/report.dart';
import 'package:lost/modules/search/search.dart';

class TabNavigator extends StatelessWidget  {
  final GlobalKey<NavigatorState> navigatorKey;
final String tabItem;
  const TabNavigator({Key key, this.navigatorKey, this.tabItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {

Widget child;
if(tabItem==Search.id)child=Search();
else if(tabItem==Report.id)child=Report();
else if(tabItem==LostMobiles.id)child=LostMobiles();
  return Navigator(key: navigatorKey,
          onGenerateRoute: (routesettings){

return MaterialPageRoute(builder: (context)=>

Container(child: child,));

          },
  );
  }



}