import 'package:flutter/material.dart';
import 'package:sqfliteyotubenotaapp/views/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
    );
  }
}


// openAlertBox() {
//
//   return  showDialog<void>(
//       builder: (context) {
//         return AlertDialog(
//           content: Container(
//             width: 300,
//             height: 200,
//             child: Column(
//               children: [
//                 TextFormField(
//                   initialValue: name,
//                   decoration: InputDecoration(
//                     hintText: 'Add Name',
//                     border: InputBorder.none,
//                     fillColor: Colors.grey[300],
//                   ),
//                   validator: (value) {
//                     return null;
//                   },
//                   onSaved: (String value) {
//                     name = value;
//                   },
//                 ),
//                 TextFormField(
//                   initialValue: phone,
//                   decoration: InputDecoration(
//                     hintText: 'Add Phone',
//                     border: InputBorder.none,
//                     fillColor: Colors.grey[300],
//                   ),
//                   validator: (value) {
//                     return null;
//                   },
//                   onSaved: (String value) {
//                     phone = value;
//                   },
//                 ),
//                 TextFormField(
//                   initialValue: email,
//                   decoration: InputDecoration(
//                     hintText: 'Add Email',
//                     border: InputBorder.none,
//                     fillColor: Colors.grey[300],
//                   ),
//                   validator: (value) {
//                     return null;
//                   },
//                   onSaved: (String value) {
//                     email = value;
//                   },
//                 ),
//                 ElevatedButton(
//                   onPressed: () {},
//                   child: Text("Add User"),
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//       context:context
//   );
// }
