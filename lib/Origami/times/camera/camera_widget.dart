import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

List<CameraDescription> cameras = [];

class CameraApp extends StatefulWidget {
  const CameraApp({
    Key? key,
    // required this.callback,
  }) : super(key: key);
  // final VoidCallback callback;
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  late String startTime;
  String time = "";
  @override
  void initState() {
    super.initState();
    _controller = CameraController(cameras[0], ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white60,
        // appBar: AppBar(
        //   title: Text(''),
        // ),
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: FutureBuilder<void>(
                future: _initializeControllerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return CameraPreview(_controller);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            Divider(),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'ยกเลิก',
                        style: GoogleFonts.openSans(
                          fontSize: 25.0,
                          // color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  IconButton(
                    icon: Icon(Icons.camera), // Icon to display
                    onPressed: () async {
                      try {
                        await _initializeControllerFuture;
                        final image = await _controller.takePicture();
                        // Do something with the captured image
                      } catch (e) {
                        print(e);
                      }
                    },
                    tooltip: 'Favorite',
                    color: Colors.black,
                    iconSize: 48,
                  ),
                  TextButton(
                      onPressed: (){},
                      child: Text(
                        'ตกลง',
                        style: GoogleFonts.openSans(
                          fontSize: 25.0,
                          // color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   child: Row(
        //     children: [
        //       Icon(Icons.camera),
        //       Icon(Icons.camera),
        //       Icon(Icons.camera),
        //     ],
        //   ),
        //   onPressed: () async {
        //     try {
        //       await _initializeControllerFuture;
        //       final image = await _controller.takePicture();
        //       // Do something with the captured image
        //     } catch (e) {
        //       print(e);
        //     }
        //   },
        // ),
      ),
    );
  }
}
