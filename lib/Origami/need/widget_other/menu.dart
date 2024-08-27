// import 'package:flutter/material.dart';
// import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:origami/Language/translate.dart';
// import 'package:origami/Origami/setting_translate.dart';
//
// import '../Login/login.dart';
// import 'academy/academy.dart';
// import 'job/job.dart';
// import 'need/need_approve.dart';
// import 'need/need.dart';
//
// class HomeScreen5 extends StatefulWidget {
//   const HomeScreen5({Key? key, required this.employee}) : super(key: key);
//   final Employee employee;
//   @override
//   HomeScreen5State createState() => HomeScreen5State();
// }
//
// class HomeScreen5State extends State<HomeScreen5> {
//   final GlobalKey<SliderDrawerState> _sliderDrawerKey =
//       GlobalKey<SliderDrawerState>();
//   late String title;
//
//   @override
//   void initState() {
//     title = "Home";
//     super.initState();
//     // TranslatePage();
//   }
//
//   bool isNeed = false;
//   int _index = 0;
//   static var optionStyle =
//       GoogleFonts.openSans(fontSize: 24, fontWeight: FontWeight.bold);
//   int _selectedValue = 1;
//
//   void _handleRadioValueChange(int? value) {
//     setState(() {
//       _selectedValue = value!;
//       // id_translate = _selectedValue;
//       // TranslatePage();
//       // widget.callback(translate?.id_translate??0);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SliderDrawer(
//         appBar: SliderAppBar(
//           appBarHeight : 100,
//           appBarColor: Colors.orange,
//           title: Row(
//             children: [
//               Text(
//                 // _listTitle[_index],
//                 (_index == 0)
//                     ? "$need"
//                     : (_index == 1)
//                     ? "$request"
//                     : (_index == 2)
//                     ? "$academy"
//                     : (_index == 3)
//                     ? "$language"
//                     : (_index == 4)
//                     ? "$job"
//                     : "$logout",
//                 style: GoogleFonts.openSans(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),
//               ),
//             ],
//           ),
//         ),
//         key: _sliderDrawerKey,
//         sliderOpenSize: 179,
//         slider: Card(
//           elevation: 2,
//           child: Container(
//             color: Colors.white,
//             padding: const EdgeInsets.only(top: 30),
//             child: ListView(
//               children: <Widget>[
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 CircleAvatar(
//                   radius: 65,
//                   backgroundColor: Colors.grey,
//                   child: CircleAvatar(
//                     radius: 60,
//                     backgroundImage: Image.network(
//                             'https://nikhilvadoliya.github.io/assets/images/nikhil_1.webp')
//                         .image,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 const Text(
//                   'Nick',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 30,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Column(
//                   children: [
//                     ListTile(
//                       trailing: (isNeed == false)
//                           ? Icon(Icons.arrow_drop_down_outlined)
//                           : Icon(Icons.file_copy_outlined),
//                       title: Text(
//                         '$need',
//                         style: GoogleFonts.openSans(),
//                       ),
//                       selected: _index == 0,
//                       onTap: () {
//                         setState(() {
//                           (isNeed == true) ? _index = 0 : _index = _index;
//                           (isNeed == true) ? isNeed = false : isNeed = true;
//                         });
//                       },
//                     ),
//                     (isNeed == true)
//                         ? Container()
//                         : Container(
//                             padding: EdgeInsets.only(left: 16),
//                             child: Column(
//                               children: [
//                                 ListTile(
//                                   trailing: Icon(Icons.file_present_outlined),
//                                   title: Text(
//                                     '$need',
//                                     style: GoogleFonts.openSans(),
//                                   ),
//                                   selected: _index == 0,
//                                   onTap: () {
//                                     setState(() {
//                                       _index = 0;
//                                     });
//                                     Navigator.pop(context);
//                                   },
//                                 ),
//                                 ListTile(
//                                   trailing: Icon(Icons.done_all),
//                                   title: Text(
//                                     '$request',
//                                     style: GoogleFonts.openSans(),
//                                   ),
//                                   selected: _index == 1,
//                                   onTap: () {
//                                     // setState(() {
//                                     //   _index = 1;
//                                     // });
//                                     // _reloadData;
//                                     Navigator.pop(context);
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),
//                   ],
//                 ),
//                 ListTile(
//                   trailing: Icon(Icons.home_repair_service),
//                   title: Text(
//                     '$academy',
//                     style: GoogleFonts.openSans(),
//                   ),
//                   selected: _index == 2,
//                   onTap: () {
//                     setState(() {
//                       _index = 2;
//                     });
//                     Navigator.pop(context);
//                   },
//                 ),
//                 ListTile(
//                   trailing: Icon(Icons.language),
//                   title: Text(
//                     '$language',
//                     style: GoogleFonts.openSans(),
//                   ),
//                   selected: _index == 3,
//                   onTap: () {
//                     setState(() {
//                       _index = 3;
//                     });
//                     Navigator.pop(context);
//                   },
//                 ),
//                 ListTile(
//                   trailing: Icon(Icons.person_outline),
//                   title: Text(
//                     '$job',
//                     style: GoogleFonts.openSans(),
//                   ),
//                   selected: _index == 4,
//                   onTap: () {
//                     setState(() {
//                       _index = 4;
//                     });
//                     Navigator.pop(context);
//                   },
//                 ),
//                 ListTile(
//                   trailing: Icon(Icons.output),
//                   title: Text(
//                     '$logout',
//                     style: GoogleFonts.openSans(),
//                   ),
//                   selected: _index == 5,
//                   onTap: () {
//                     showDialog(
//                       context: context,
//                       builder: (BuildContext dialogContext) {
//                         return AlertDialog(
//                           title: Icon(
//                             Icons.info_outline,
//                             size: 64,
//                             color: Colors.red,
//                           ),
//                           content: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                   'คุณต้องการออกจากระบบใช่หรือไม่?',
//                                   style: GoogleFonts.openSans(
//                                       fontSize: 16,
//                                       // fontWeight: FontWeight.bold,
//                                       color: Colors.black),
//                                   maxLines: 2,
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           actions: <Widget>[
//                             TextButton(
//                               child: Text(
//                                 'ยกเลิก',
//                                 style: GoogleFonts.openSans(
//                                   color: Colors.black38,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   Navigator.of(dialogContext).pop();
//                                   // Navigator.pop(context);
//                                 });
//                               },
//                             ),
//                             TextButton(
//                               child: Text(
//                                 'ออกจากระบบ',
//                                 style: GoogleFonts.openSans(
//                                   color: Colors.orange,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                               onPressed: () {
//                                 Navigator.pushReplacement(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => LoginPage(
//                                       num: 1,
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//         child: Center(
//           child: _index == 0
//               ? NeedsView(
//                   employee: widget.employee,
//                 )
//               : _index == 1
//                   ? NeedRequest(
//                       employee: widget.employee,
//                     )
//                   : _index == 2
//                       ? AcademyPage(
//                           employee: widget.employee,
//                         )
//                       : _index == 3
//                           ? TranslatePage(employee: widget.employee,)
//                           : _index == 4
//                               ? JobPage(
//                                   employee: widget.employee,
//                                 )
//                               : _index == 5
//                                   ? Text(
//                                       'Index 5: Approval',
//                                       style: optionStyle,
//                                     )
//                                   : _index == 6
//                                       ? Text(
//                                           'Index 6: Overtime',
//                                           style: optionStyle,
//                                         )
//                                       : _index == 7
//                                           ? JobPage(
//                                               employee: widget.employee,
//                                             )
//                                           : _index == 8
//                                               ? Text(
//                                                   'Index 8: SignOut',
//                                                   style: optionStyle,
//                                                 )
//                                               : Container(),
//         ),
//       ),
//     );
//   }
// }
//
// class _SliderView extends StatefulWidget {
//   final Function(String)? onItemClick;
//   const _SliderView({Key? key, this.onItemClick}) : super(key: key);
//
//   @override
//   State<_SliderView> createState() => _SliderViewState();
// }
//
// class _SliderViewState extends State<_SliderView> {
//   bool isNeed = false;
//   int _index = 0;
//   static var optionStyle =
//       GoogleFonts.openSans(fontSize: 24, fontWeight: FontWeight.bold);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       padding: const EdgeInsets.only(top: 30),
//       child: ListView(
//         children: <Widget>[
//           const SizedBox(
//             height: 30,
//           ),
//           CircleAvatar(
//             radius: 65,
//             backgroundColor: Colors.grey,
//             child: CircleAvatar(
//               radius: 60,
//               backgroundImage: Image.network(
//                       'https://nikhilvadoliya.github.io/assets/images/nikhil_1.webp')
//                   .image,
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           const Text(
//             'Nick',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//               fontSize: 30,
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Column(
//             children: [
//               ListTile(
//                 trailing: (isNeed == false)
//                     ? Icon(Icons.arrow_drop_down_outlined)
//                     : Icon(Icons.file_copy_outlined),
//                 title: Text(
//                   '$need',
//                   style: GoogleFonts.openSans(),
//                 ),
//                 selected: _index == 0,
//                 onTap: () {
//                   setState(() {
//                     (isNeed == true) ? _index = 0 : _index = _index;
//                     (isNeed == true) ? isNeed = false : isNeed = true;
//                   });
//                 },
//               ),
//               (isNeed == true)
//                   ? Container()
//                   : Container(
//                       padding: EdgeInsets.only(left: 16),
//                       child: Column(
//                         children: [
//                           ListTile(
//                             trailing: Icon(Icons.file_present_outlined),
//                             title: Text(
//                               '$need',
//                               style: GoogleFonts.openSans(),
//                             ),
//                             selected: _index == 0,
//                             onTap: () {
//                               setState(() {
//                                 _index = 0;
//                               });
//                               Navigator.pop(context);
//                             },
//                           ),
//                           ListTile(
//                             trailing: Icon(Icons.done_all),
//                             title: Text(
//                               '$request',
//                               style: GoogleFonts.openSans(),
//                             ),
//                             selected: _index == 1,
//                             onTap: () {
//                               // setState(() {
//                               //   _index = 1;
//                               // });
//                               // _reloadData;
//                               Navigator.pop(context);
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//             ],
//           ),
//           ListTile(
//             trailing: Icon(Icons.home_repair_service),
//             title: Text(
//               '$academy',
//               style: GoogleFonts.openSans(),
//             ),
//             selected: _index == 2,
//             onTap: () {
//               setState(() {
//                 _index = 2;
//               });
//               Navigator.pop(context);
//             },
//           ),
//           ListTile(
//             trailing: Icon(Icons.language),
//             title: Text(
//               '$language',
//               style: GoogleFonts.openSans(),
//             ),
//             selected: _index == 3,
//             onTap: () {
//               setState(() {
//                 _index = 3;
//               });
//               Navigator.pop(context);
//             },
//           ),
//           ListTile(
//             trailing: Icon(Icons.person_outline),
//             title: Text(
//               '$job',
//               style: GoogleFonts.openSans(),
//             ),
//             selected: _index == 4,
//             onTap: () {
//               setState(() {
//                 _index = 4;
//               });
//               Navigator.pop(context); // _onItemTapped(7);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _SliderMenuItem extends StatelessWidget {
//   final String title;
//   final IconData iconData;
//   final Function(String)? onTap;
//
//   const _SliderMenuItem(
//       {Key? key,
//       required this.title,
//       required this.iconData,
//       required this.onTap})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//         title: Text(title,
//             style: const TextStyle(
//                 color: Colors.black, fontFamily: 'BalsamiqSans_Regular')),
//         leading: Icon(iconData, color: Colors.black),
//         onTap: () => onTap?.call(title));
//   }
// }
//
// class _AuthorList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     List<Quotes> quotesList = [];
//     quotesList.add(Quotes(Colors.amber, 'Amelia Brown',
//         'Life would be a great deal easier if dead things had the decency to remain dead.'));
//     quotesList.add(Quotes(Colors.orange, 'Olivia Smith',
//         'That proves you are unusual," returned the Scarecrow'));
//     quotesList.add(Quotes(Colors.deepOrange, 'Sophia Jones',
//         'Her name badge read: Hello! My name is DIE, DEMIGOD SCUM!'));
//     quotesList.add(Quotes(Colors.red, 'Isabella Johnson',
//         'I am about as intimidating as a butterfly.'));
//     quotesList.add(Quotes(Colors.purple, 'Emily Taylor',
//         'Never ask an elf for help; they might decide your better off dead, eh?'));
//     quotesList
//         .add(Quotes(Colors.green, 'Maya Thomas', 'Act first, explain later'));
//
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       child: ListView.separated(
//           scrollDirection: Axis.vertical,
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//           itemBuilder: (builder, index) {
//             return LimitedBox(
//               maxHeight: 150,
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: quotesList[index].color,
//                     borderRadius: const BorderRadius.all(
//                       Radius.circular(10.0),
//                     )),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.all(12),
//                       child: Text(
//                         quotesList[index].author,
//                         style: const TextStyle(
//                             fontFamily: 'BalsamiqSans_Blod',
//                             fontSize: 30,
//                             color: Colors.white),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(10),
//                       child: Text(
//                         quotesList[index].quote,
//                         style: const TextStyle(
//                             fontFamily: 'BalsamiqSans_Regular',
//                             fontSize: 15,
//                             color: Colors.white),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             );
//           },
//           separatorBuilder: (builder, index) {
//             return const Divider(
//               height: 10,
//               thickness: 0,
//             );
//           },
//           itemCount: quotesList.length),
//     );
//   }
// }
//
// class Quotes {
//   final MaterialColor color;
//   final String author;
//   final String quote;
//
//   Quotes(this.color, this.author, this.quote);
// }
//
// class Menu {
//   final IconData iconData;
//   final String title;
//
//   Menu(this.iconData, this.title);
// }
