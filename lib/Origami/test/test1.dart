import 'package:dynamic_tabbar/dynamic_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Login/login.dart';
import '../academy/evaluate/attach_file/attach_file.dart';
import '../academy/evaluate/certification/certification.dart';
import '../academy/evaluate/curriculum/curriculum.dart';
import '../academy/evaluate/description/description.dart';
import '../academy/evaluate/discussion/discussion.dart';
import '../academy/evaluate/instructors/instructors.dart';

class HoverWidget extends StatefulWidget {
  @override
  _HoverWidgetState createState() => _HoverWidgetState();
}

class _HoverWidgetState extends State<HoverWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: Container(
        width: 200,
        height: 200,
        color: _isHovered ? Colors.blue : Colors.red,
        child: Center(
          child: Text(
            _isHovered ? 'Hovered!' : 'Not Hovered',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}