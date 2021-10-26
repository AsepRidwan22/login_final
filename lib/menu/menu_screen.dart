// import 'package:flutter/cupertino.dart';
// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:login_final/network_utils/api.dart';
import 'package:login_final/utilities/constants.dart';
// import 'package:login_final/menu/model_user.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:login_final/menu/controller_user.dart';
// import 'package:login_final/menu/model_user.dart';
import 'package:login_final/screens/login_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List data = List.empty();

  Future<String> getData() async {
    var res = await Network().getData('/showall');
    var body = json.decode(res.body);

    if (body['status'] == 1) {
      print(body['data']);
      setState(() {
        data = body['data'];
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Gagal mengambil data")));
    }
    return "";
  }

  @override
  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: ListView.builder(
        itemCount: data.isEmpty ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Row(
              children: [
                Text(data[index]["name"]),
                Text(" - "),
                Text(data[index]["email"]),
              ],
            ),
          );
        },
      ),
    );
  }
}
// class MenuScreen extends StatefulWidget {
//   // User user;
//   // MenuScreen({this.user});
//   @override
//   _MenuScreenState createState() => _MenuScreenState(); //(this.user);
// }

// class User {}

// class _MenuScreenState extends State<MenuScreen> {
//   final User user;
//   _MenuScreenState(this.user);
//   final _scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xff151515),
//       appBar: AppBar(
//         title: Text('Detail Student'),
//         backgroundColor: Color(0xff151515),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.all(24),
//           child: Card(
//             elevation: 4.0,
//             color: Colors.blue[700],
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(14),
//             ),
//             child: Padding(
//               padding: EdgeInsets.all(24),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         // "${user.id}",
//                         style: TextStyle(
//                           fontSize: 28,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 24),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         // "${user.name}",
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 12),
//                   Row(
//                     children: [
//                       Text(
//                         // "${user.role}",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       )
//                     ],
//                   ),
//                   SizedBox(height: 24),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Date of Birth: ",
//                         style: TextStyle(
//                           fontSize: 16,
//                         ),
//                       ),
//                       Text(
//                         // "${user.image}",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
