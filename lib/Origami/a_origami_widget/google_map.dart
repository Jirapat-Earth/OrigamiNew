

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMap2 extends StatefulWidget {
  @override
  _GoogleMap2State createState() => _GoogleMap2State();
}

class _GoogleMap2State extends State<GoogleMap2> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Maps Sample App'),
            backgroundColor: Colors.green[700],
          ),
          body: Stack(
            children: <Widget>[
              GoogleMap(initialCameraPosition: CameraPosition(target:
              LatLng(-33.870840,151.206286),
                  zoom: 12)
              )
            ],
          )
      ),
    );
  }
}