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

  // void searchResultFromFireBase(String hello) async {
  //   final resalt = await FirebaseFirestore.instance
  //       .collection('searchApp')
  //       .where(
  //         'hello1',
  //         arrayContains: hello,
  //       )
  //       .get();
  //   setState(() {
  //     searchResult = resalt.docs.map((e) => e.data()).toList();
  //   });
  // }

  // void searchResultFireBase(String hello) async {
  //   final userresult = await FirebaseFirestore.instance
  //       .collectionGroup(
  //         'searchApp ',
  //       )
  //       .where(
  //         'ser1',
  //         isEqualTo: hello,
  //       )
  //       .get();
  //   setState(() {
  //     searchResult = userresult.docs.map((e) => e.data()).toList();
  //   });
  // }

  final _formKey = GlobalKey<FormState>();
  // void loadData(QuizPaperModel serch1) async {
  //   Serch1Model = serch1;
  //   // lodinng
  //   try {
  //     final QuerySnapshot<Map<String, dynamic>> questionsQueru =
  //         await serch1Fr.doc(serch1.id).collection('answers').get;
  //     final answers = answersQueru.docs
  //         .map((answers) => Answers.fromSnapshot(answers))
  //         .toList();
  //     serch1.answers = answers;
  //     for (Answers _answers in serch1.questions!) {
  //       final Answers.fromSnapshot<Map<String, dynamic>> carsQuery =
  //           await serch1Fr
  //               .doc(serch1.id)
  //               .collection('questions')
  //               .doc(_answers.id)
  //               .collection('cars')
  //               .get;
  //       final cars = carsQuery.docs
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  // void onePies() async {
  //   final oneni =
  //       await FirebaseFirestore.instance.collection('one').doc('documend_id');

  // }

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
                  itemCount: searchResult.toList().length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      // title: Text(searchResult[index]['hi'].toString()),
                      subtitle: Text(
                        '${searchResult[index]['foods'] ??''} - ${searchResult[index]['cars']?? ''}',
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
