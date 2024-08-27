// import 'package:camera/camera.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:origami/Origami/need/need.dart';
// import 'package:origami/Origami/test.dart';
// import 'package:origami/Origami/test_camera.dart';
// import '../Login/login.dart';
// import 'A_Test/dropdown_b2.dart';
// import 'academy/academy.dart';
// import 'google_map.dart';
// import 'job/job.dart';
// import 'need/need_approve.dart';
//
// class BackOrigamiPage extends StatefulWidget {
//   const BackOrigamiPage({
//     super.key,
//     required this.employee,
//   });
//   final Employee employee;
//   @override
//   State<BackOrigamiPage> createState() => _BackOrigamiPageState();
// }
//
// class _BackOrigamiPageState extends State<BackOrigamiPage> {
//   int _index = 0;
//   static var optionStyle =
//   GoogleFonts.openSans(fontSize: 24, fontWeight: FontWeight.bold);
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _index = index;
//     });
//   }
//
//   // Example data variable
//   int _data = 0;
//
//   // Method to simulate data reload
//   Future<void> _reloadData() async {
//     await Future.delayed(Duration(seconds: 1));
//     setState(() {
//       _data = DateTime.now().second; // Example: Update with new data
//     });
//   }
//
//   // late List<MemberData> memberData;
//   @override
//   void initState() {
//     super.initState();
//     // Load saved credentials if available
//   }
//
//   // @override
//   // Widget build(BuildContext context) {
//   //   return MaterialApp(
//   //       // scrollBehavior: MyCustomScrollBehavior(),
//   //       home: Scaffold(body: _getContentWidget()));
//   // }
//
//   List<String> listTitle = [
//     "Need",
//     "Request Approve",
//     "Academy",
//     "",
//     "Origami Job",
//     "F",
//     "G",
//   ];
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Colors.black,
//       body: _getContentWidget(),
//     );
//   }
//
//   bool need = false;
//   @override
//   Widget _getContentWidget() {
//     return Scaffold(
//       appBar: AppBar(
//         // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Row(
//           children: [
//             Text(
//               "${listTitle[_index]}",
//               style: GoogleFonts.openSans(
//                   fontWeight: FontWeight.bold, color: Colors.white),
//             ),
//           ],
//         ),
//         // leading: IconButton(
//         //   icon: Icon(Icons.abc),
//         //   onPressed: () {
//         //     Scaffold.of(context).openDrawer();
//         //   },
//         // ),
//         actions: <Widget>[
//           IconButton(
//             icon: Container(
//               width: 40,
//               child: Image.network(
//                 widget.employee.comp_logo ?? '',
//               ),
//             ),
//             onPressed: () {},
//           ),
//         ],
//         backgroundColor: Colors.orange.shade500,
//       ),
//       drawer: Drawer(
//         shadowColor: Colors.amber,
//         backgroundColor: Colors.white,
//         child: ListView(
//           // Important: Remove any padding from the ListView.
//           padding: EdgeInsets.all(0),
//           children: [
//             UserAccountsDrawerHeader(
//               accountName: Expanded(
//                 child: Row(
//                   children: [
//                     Text(
//                       'Name: ',
//                       style: GoogleFonts.openSans(
//                           fontSize: 16, fontWeight: FontWeight.bold,color: Colors.orange.shade200),
//                     ),
//                     Expanded(
//                         child: Text(
//                           '${widget.employee.emp_name}',
//                           style: GoogleFonts.openSans(
//                             fontSize: 16,
//                           ),
//                         )),
//                   ],
//                 ),
//               ),
//               accountEmail: Row(
//                 children: [
//                   Text(
//                     'Position: ',
//                     style: GoogleFonts.openSans(
//                         fontSize: 16, fontWeight: FontWeight.bold,color: Colors.orange.shade200),
//                   ),
//                   Expanded(
//                     child: Text(
//                       '${widget.employee.dept_description}',
//                       style: GoogleFonts.openSans(
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               currentAccountPicture: CircleAvatar(
//                 backgroundColor: Colors.transparent,
//                 child: Container(
//                   width: 50,
//                   height: 80,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color: Colors.white,
//                     border: Border.all(
//                       color: Colors.white,
//                       width: 2.0,
//                     ),
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(25),
//                     child: Padding(
//                       padding: const EdgeInsets.only(bottom: 2.0),
//                       child: Image.network(
//                         widget.employee.emp_avatar ?? '',
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage('assets/company-scaled.jpg'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Column(
//               children: [
//                 ListTile(
//                   trailing: (need == false)
//                       ? Icon(Icons.arrow_drop_down_outlined)
//                       : Icon(Icons.file_copy_outlined),
//                   title: Text(
//                     'NEED',
//                     style: GoogleFonts.openSans(),
//                   ),
//                   selected: _index == 0,
//                   onTap: () {
//                     setState(() {
//                       (need == true) ? _index = 0 : _index = _index;
//                       (need == true) ? need = false : need = true;
//                     });
//                     // setState(() {
//                     //
//                     // });
//                   },
//                 ),
//                 (need == true)
//                     ? Container()
//                     : Container(
//                   padding: EdgeInsets.only(left: 16),
//                   child: Column(
//                     children: [
//                       ListTile(
//                         trailing: Icon(Icons.file_present_outlined),
//                         title: Text(
//                           'Need',
//                           style: GoogleFonts.openSans(),
//                         ),
//                         selected: _index == 0,
//                         onTap: () {
//                           setState(() {
//                             _index = 0;
//                           });
//                           _reloadData;
//                           Navigator.pop(context);
//                         },
//                       ),
//                       ListTile(
//                         trailing: Icon(Icons.done_all),
//                         title: Text(
//                           'Request Approve',
//                           style: GoogleFonts.openSans(),
//                         ),
//                         selected: _index == 1,
//                         onTap: () {
//                           // setState(() {
//                           //   _index = 1;
//                           // });
//                           // _reloadData;
//                           Navigator.pop(context);
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             ListTile(
//               trailing: Icon(Icons.home_repair_service),
//               title: Text(
//                 'ACADEMY',
//                 style: GoogleFonts.openSans(),
//               ),
//               selected: _index == 2,
//               onTap: () {
//                 setState(() {
//                   _index = 2;
//                 });
//                 _reloadData;
//                 Navigator.pop(context);
//               },
//             ),
//             // ListTile(
//             //   trailing: Icon(Icons.access_time),
//             //   title: Text('เวลา',style: GoogleFonts.openSans(),),
//             //   selected: _index == 6,
//             //   onTap: () {
//             //     // Update the state of the app
//             //     // _onItemTapped(2);
//             //     // Then close the drawer
//             //     // Navigator.pop(context);
//             //   },
//             // ),
//             // ListTile(
//             //   trailing: Icon(Icons.work),
//             //   title: Text('ทำงาน',style: GoogleFonts.openSans(),),
//             //   selected: _index == 6,
//             //   onTap: () {
//             //     // Update the state of the app
//             //     // _onItemTapped(3);
//             //     // Then close the drawer
//             //     // Navigator.pop(context);
//             //   },
//             // ),
//             // ListTile(
//             //   trailing: Icon(Icons.check),
//             //   title: Text('ต้องการ',style: GoogleFonts.openSans(),),
//             //   selected: _index == 6,
//             //   onTap: () {
//             //     // Update the state of the app
//             //     // _onItemTapped(6);
//             //     // Then close the drawer
//             //     // Navigator.pop(context);
//             //   },
//             // ),
//             // ListTile(
//             //   trailing: Icon(Icons.check_circle),
//             //   title: Text('DropdownButton2',style: GoogleFonts.openSans(),),
//             //   selected: _index == 6,
//             //   onTap: () {
//             //     // Update the state of the app
//             //     // _onItemTapped(5);
//             //     // Then close the drawer
//             //     // Navigator.pop(context);
//             //     setState(() {
//             //       Navigator.push(
//             //         context,
//             //         MaterialPageRoute(
//             //           builder: (context) => DropdownExample2(),
//             //         ),
//             //       );
//             //     });
//             //   },
//             // ),
//             ListTile(
//               trailing: Icon(Icons.info_outline),
//               title: Text(
//                 'TEST FUNCTION',
//                 style: GoogleFonts.openSans(),
//               ),
//               selected: _index == 3,
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => HomePage4(),
//                   ),
//                 );
//               },
//             ),
//             ListTile(
//               trailing: Icon(Icons.person_outline),
//               title: Text(
//                 'JOB',
//                 style: GoogleFonts.openSans(),
//               ),
//               selected: _index == 4,
//               onTap: () {
//                 setState(() {
//                   _index = 4;
//                 });
//                 _reloadData;
//                 Navigator.pop(context); // _onItemTapped(7);
//
//                 _reloadData();
//               },
//             ),
//             ListTile(
//               trailing: Icon(Icons.output),
//               title: Text(
//                 'ออกจากระบบ',
//                 style: GoogleFonts.openSans(),
//               ),
//               selected: _index == 8,
//               onTap: () {
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext dialogContext) {
//                     return AlertDialog(
//                       title: Icon(
//                         Icons.info_outline,
//                         size: 64,
//                         color: Colors.red,
//                       ),
//                       content: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Expanded(
//                             child: Text(
//                               'คุณต้องการออกจากระบบใช่หรือไม่?',
//                               style: GoogleFonts.openSans(
//                                   fontSize: 16,
//                                   // fontWeight: FontWeight.bold,
//                                   color: Colors.black),
//                               maxLines:2,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                         ],
//                       ),
//                       actions: <Widget>[
//                         TextButton(
//                           child: Text(
//                             'ยกเลิก',
//                             style: GoogleFonts.openSans(
//                               color: Colors.black38,
//                               fontSize: 16,
//                             ),
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               Navigator.of(dialogContext).pop();
//                               // Navigator.pop(context);
//                             });
//                           },
//                         ),
//                         TextButton(
//                           child: Text(
//                             'ออกจากระบบ',
//                             style: GoogleFonts.openSans(
//                               color: Colors.orange,
//                               fontSize: 16,
//                             ),
//                           ),
//                           onPressed: () {
//                             Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => LoginPage(
//                                   num: 1,
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Center(
//         child: _index == 0
//             ? NeedsView(
//           employee: widget.employee,
//         )
//             : _index == 1
//             ? NeedRequest(
//           employee: widget.employee,
//         )
//             : _index == 2
//             ? AcademyPage(
//           employee: widget.employee,
//         )
//             : _index == 3
//             ? Text(
//           'Index 3: Works',
//           style: optionStyle,
//         )
//             : _index == 4
//             ? JobPage(
//           employee: widget.employee,
//         )
//             : _index == 5
//             ? Text(
//           'Index 5: Approval',
//           style: optionStyle,
//         )
//             : _index == 6
//             ? Text(
//           'Index 6: Overtime',
//           style: optionStyle,
//         )
//             : _index == 7
//             ? JobPage(
//           employee: widget.employee,
//         )
//             : _index == 8
//             ? Text(
//           'Index 8: SignOut',
//           style: optionStyle,
//         )
//             : Container(),
//       ),
//     );
//   }
//
// // void main4() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   final cameras = await availableCameras();
// //   final firstCamera = cameras.first;
// //
// //   runApp(MyApp4(camera: firstCamera));
// // }
// }
