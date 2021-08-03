import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
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

    return
        // Scaffold(
        // appBar: AppBar(
        //   title: Text('مفقوداتي'),
        // ),
        // body:
        //
        StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('Users Data').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }
              return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: DefaultTextStyle(
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "Name : ${snapshot.data.docs[index]['name']}"),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                    'IMEI : ${snapshot.data.docs[index]['IMEI']}'),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                    'Mobile Model : ${snapshot.data.docs[index]['mobile-model']}'),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                    'PhoneNumber : ${snapshot.data.docs[index]['phoneNumber']}'),
                                SizedBox(
                                  height: 25,
                                ),
                                Divider(
                                  thickness: 2,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Icon(Icons.delete),
                                    GestureDetector(
                                        onTap: () {
                                          FirebaseFirestore.instance
                                              .collection('Users Data')
                                              .doc(p.IMEI)
                                              .delete()
                                              .then((value) => () {})
                                              .catchError((err) {
                                            print(
                                                'eroor is ########### ${err.toString()}');
                                          });
                                        },
                                        child: Row(
                                          children: [
                                            Icon(Icons.delete),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text('Delete')
                                          ],
                                        )),

                                    GestureDetector(
                                        onTap: () {},
                                        child: Row(
                                          children: [
                                            Icon(Icons.update),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text('Update')
                                          ],
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        //  height: 150,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    );
                  });
            }
            //),
            );
  }
}
