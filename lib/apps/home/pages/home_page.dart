import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List searchResult = [];

  String hello = '';

  void fire(String hello) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final DocumentReference documentRef =
        firestore.collection('one').doc('documend_id');

    final QuerySnapshot subcollections = await documentRef
        .collection('on1')
        .where('cars', arrayContains: hello)
        .get();
    subcollections.docs.forEach((QueryDocumentSnapshot subcollection) {
      print('Subcollection ID: ${subcollection.id}');
    });

    setState(() {
      searchResult = subcollections.docs.map((e) => e.data()).toList();
    });
  }

  void fireb(String hello) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final DocumentReference documentRef =
        firestore.collection('one').doc('documend_id');

    final QuerySnapshot subcollections = await documentRef
        .collection('on2')
        .where('foods', arrayContains: hello)
        .get();
    subcollections.docs.forEach((QueryDocumentSnapshot subcollection) {
      print('Subcollection ID: ${subcollection.id}');
    });

    setState(() {
      searchResult = subcollections.docs.map((e) => e.data()).toList();
    });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        hintText: 'Search Here...'),
                    onChanged: (query) {
                      setState(() {
                        // print("$searchResultFromFireBase");
                        // print("$searchResultFireBase");
                        print("$fire");
                        print("$fireb");
                      });
                      // searchResultFromFireBase(query);
                      // searchResultFireBase(query);
                      fire(query);
                      fireb(query);
                    },
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: searchResult.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      // title: Column(
                      //   children: [
                      //     Text(
                      //       '${searchResult[index]['foods'] ?? ''}  ${searchResult[index]['cars'] ?? ''}  ',
                      //       style: TextStyle(
                      //           fontSize: 18, fontWeight: FontWeight.w800),
                      //     ),
                      //   ],
                      // ),
                      title: Column(
                        children: [
                          for (var i in searchResult[index]['cars'] ??
                              searchResult[index]['foods'])
                            Text(
                              i!,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w800),
                            ),
                        ],
                      ),
                    );
                  },
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
