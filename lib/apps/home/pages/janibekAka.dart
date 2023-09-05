// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class ResultView extends StatefulWidget {
//   const ResultView({
//     Key? key,
//     this.idDocument,
//   }) : super(key: key);
//   final String? idDocument;

//   @override
//   _ResultViewState createState() => _ResultViewState();
// }

// class _ResultViewState extends State<ResultView> {
//   String _typedValue = '';
//   String? i;
//   // List<String> getCars() {
//   //   if (typedValue == listCar[0].marka ||
//   //       typedValue == listCar[0].marka.toLowerCase()) {
//   //     return listCar[0].model;
//   //   } else if (typedValue == listCar[1].marka) {
//   //     return listCar[1].model;
//   //   } else if (typedValue == listCar[2].marka) {
//   //     return listCar[2].model;
//   //   }
//   //   return ['No Such Car Found!'];
//   // }

//   List searchResult = [];
//   String typedSearch = '';

//   void searchFromFirebase(String typedSearch) async {
//     final result = await FirebaseFirestore.instance
//         .collection('cars')
//         .where('car_list_alphabet', arrayContains: typedSearch)
//         .get();

//     setState(() {
//       searchResult = result.docs.map((e) => e.data()).toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Firebase Search"),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: TextField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: "Search Here",
//                 ),
//                 onChanged: (query) {
//                   setState(() {});
//                   searchFromFirebase(query);
//                 },
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: searchResult.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(
//                       searchResult[index]['model'].toString(),
//                     ),
//                     subtitle: Text(
//                       searchResult[index]['string_id'],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//     Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//             child: TextField(
//               onChanged: (value) {
//                 _typedValue = value;
//                 setState(() {});
//               },
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: 'Enter a search term',
//               ),
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               // getCars();
//               // getFirestoreCar();
//               setState(() {});
//             },
//             child: const Text(
//               'Find',
//               style: TextStyle(fontSize: 25),
//             ),
//           ),
//           // Column(
//           //   children: getCars().map((element) => Text(element)).toList(),
//           //   // [
//           //   //   Text(getCars().toString()),
//           //   // ],
//           // ),
//           Expanded(
//             child: ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: searchBooks().length,
//                 itemBuilder: (context, index) {
//                   return Text(searchBooks(_typedValue)[index]);
//                 }),
//           ),
//           // for (i in searchBooks(_typedValue)) Text(i!),
//           // Text(getCars().toString()),
//         ],
//       ),
//     );
//   }
// }

// class SearchScreen extends StatefulWidget {
//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   List<QueryDocumentSnapshot> _searchResults = [];
//   Future<List<QueryDocumentSnapshot>> searchBooks(String searchTerm) async {
//     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//         .collection('cars')
//         .where('marka', isEqualTo: searchTerm)
//         .get();
//     return querySnapshot.docs;
//   }

//   void _performSearch() async {
//     final searchTerm = _searchController.text;
//     if (searchTerm.isNotEmpty) {
//       final results = await searchBooks(searchTerm);
//       setState(() {
//         _searchResults = results;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Center(
//               child: TextField(
//                 controller: _searchController,
//                 onChanged: (_) => _performSearch(),
//                 decoration: const InputDecoration(
//                   labelText: 'Search',
//                 ),
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: _searchResults.length,
//                 itemBuilder: (context, index) {
//                   final book = _searchResults[index];
//                   return ListTile(
//                     title: Text(book['marka']),
//                     subtitle: Text(book['model']),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
