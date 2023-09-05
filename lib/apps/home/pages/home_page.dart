import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List searchResult = [];

  String hello = '';
  // void searchResultFromFireBase(String query) async {
  //   try {
  //     final result = await FirebaseFirestore.instance
  //         .collection('search')
  //         .where('hio', isEqualTo: query)
  //         .get();

  //     setState(() {
  //       searchResult = result.docs.map((e) => e.data()).toList();
  //     });
  //   } catch (e) {
  //     log('null${searchResult}');
  //   }
  // }
  void searchResultFromFireBase(String hello) async {
    final resalt = await FirebaseFirestore.instance
        .collection('search')
        .where(
          'hi',
          arrayContains: hello,
        )
        .get();
    setState(() {
      searchResult = resalt.docs.map((e) => e.data()).toList();
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
                        print("$searchResultFromFireBase");
                      });
                      searchResultFromFireBase(query);
                    },
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: searchResult.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      // title: Text(searchResult[index]['hi'].toString()),
                      subtitle: Text(
                        '${searchResult[index]['hi']} - ${searchResult[index]['hello']}',
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
