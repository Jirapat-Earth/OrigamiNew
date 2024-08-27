// import 'dart:async';
// import 'dart:math';
// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:slide_digital_clock/slide_digital_clock.dart';
//
// import 'camera/camera_widget.dart';
//
//
// class TimesView extends StatefulWidget {const TimesView({Key? key,}) : super(key: key);
//
//   @override
//   _TimesViewState createState() => _TimesViewState();
// }
//
// class _TimesViewState extends State<TimesView> {
//   // final Completer<GoogleMapController> _controllerMap =
//   // Completer<GoogleMapController>();
//
//   int check = 0;
//   late String startTime;
//   late String stopTime;
//   String timeIn = '';
//   String timeOut = '';
//
//   GoogleMapController? mapController;
//
//   final LatLng _center = const LatLng(45.521563, -122.677433);
//
//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.amber,
//       //   appBar: AppBar(
//       //     title: Text('Message'),
//       //     actions: [],
//       //   ),
//         body: _getContentWidget());
//   }
//
//   late GoogleMapController _controllerMap;
//   Widget _getContentWidget() {
//     return SafeArea(
//       child: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(width: 8,),
//                   // Text(
//                   //   "น.",
//                   //   style: Theme.of(context)
//                   //       .textTheme
//                   //       .subtitle1!
//                   //       .copyWith(color: Colors.white,fontSize: 50),
//                   // ),
//                 ],
//               ),
//               SizedBox(height: 16,),
//               Row(
//                 children: [
//                   Icon(Icons.location_on,color: Colors.white,size: 24,),
//                   SizedBox(width: 8,),
//                   Text('Allable Co.,Ltd (Head office)',
//                     style: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),),
//                 ],
//               ),
//               SizedBox(height: 16,),
//               Row(
//                 children: [
//                   const Expanded(
//                     child: Text('เข้า :'),
//                       // style: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),),
//                   ),
//                   Expanded(
//                     child: Text(timeIn,),
//                       // style: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),),
//                   ),
//                   Expanded(
//                     child: Text('ออก :',
//                       style: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),),
//                   ),
//                   Expanded(
//                     child: Text(timeOut,
//                       style: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),),
//                   ),
//
//                 ],
//               ),
//               SizedBox(height: 16,),
//               Container(
//                 color: Colors.white60,
//                 height: 400,
//                 child: GoogleMap(
//                   onMapCreated: _onMapCreated,
//                   initialCameraPosition: CameraPosition(
//                     target: _center,
//                     zoom: 11.0,
//                   ),
//                 ),
//                 // floatingActionButton: FloatingActionButton.extended(
//                 //   onPressed: _goToTheLake,
//                 //   label: const Text('To the lake!'),
//                 //   icon: const Icon(Icons.directions_boat),
//                 // ),
//               ),
//               SizedBox(height: 16,),
//               InkWell(
//                 onTap: () async {
//                   setState(() {
//                     int index = 0;
//                     if(check == 0) {
//                       check = index + 1;
//                       startTime =
//                           DateFormat('HH:mm:ss').format(DateTime.now());
//                     }else{
//                       check = check + 1;
//                       stopTime = DateFormat('HH:mm:ss').format(DateTime.now());
//                     }
//                   });
//                   if(check == 1){
//                     timeIn = startTime;
//                     WidgetsFlutterBinding.ensureInitialized();
//                     cameras = await availableCameras();
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => CameraApp()),
//                     );
//                   }else if(check == 2 ){
//                     timeOut = stopTime;
//                   }
//
//                   // Navigator.push(
//                   //     context,
//                   //     MaterialPageRoute(builder: (context) => CameraApp()));
//                 },
//                 child: (check == 0)
//                     ?Card(
//                   color: Colors.transparent,
//                   child: Padding(
//                     padding: EdgeInsets.all(16.0),
//                     child: Text('Check In',
//                       style: GoogleFonts.openSans(fontSize: 50, fontWeight: FontWeight.bold,color: Colors.white),),
//                   ),
//                 )
//                     :Card(
//                   color: Colors.transparent,
//                   child: Padding(
//                     padding: EdgeInsets.all(16.0),
//                     child: Text('Check Out',
//                       style: GoogleFonts.openSans(fontSize: 50, fontWeight: FontWeight.bold,color: Colors.white),),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   // Future<void> _goToTheLake() async {
//   //   final GoogleMapController controller = await _controllerMap.future;
//   //   await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   // }
// }
