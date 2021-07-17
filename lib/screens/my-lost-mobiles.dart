import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lost/provider/myProvider.dart';
import 'package:provider/provider.dart';

class LostMobiles extends StatefulWidget {
  //const LostMobiles({Key? key}) : super(key: key);
  static String id = 'lostmobiles';

  @override
  _LostMobilesState createState() => _LostMobilesState();
}

class _LostMobilesState extends State<LostMobiles> {
  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    var p = Provider.of<MyProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('مفقوداتي'),
      ),
      body:
//       StreamBuilder(
// stream: _firestore.collection('data').snapshots(),
//         builder: (context, snapshot) {
//           if(!snapshot.hasData){
//
//             return Text('No value');
//           }
//
// return
//               ListView(
//
//
//                 children: [
//                   snapshot.data.documents.Map((document){
//
// return Text(document["name"]);
//                   })
//                 ],
//               );

          ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              child: Column(
                children: [
                  Text(p.name),
                  Text(p.IMEI),
                  Text(p.phone_model),
                  Text(p.Phone_Num),
                ],
              ),
              height: 100,
              decoration: BoxDecoration(color: Colors.red),
            ),
          );
        },
      ),
    );
  }
}
