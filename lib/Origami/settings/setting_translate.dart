// Copyright 2019 The FlutterCandies author. All rights reserved.
// Use of this source code is governed by an Apache license that can be found
// in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

import '../../Language/translate.dart';
import '../../Login/login.dart';
import '../origami_view.dart';

class TranslatePage extends StatefulWidget {
  const TranslatePage({
    Key? key, required this.employee,
  }) : super(key: key);
  final Employee employee;

  @override
  _TranslatePageState createState() => _TranslatePageState();
}

class _TranslatePageState extends State<TranslatePage> {



  @override
  void initState() {
    super.initState();
    _loadSelectedRadio();
  }

  // โหลดค่าที่บันทึกไว้
  _loadSelectedRadio() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedRadio = prefs.getInt('selectedRadio') ?? 1;
      Translate();
    });
  }

  // บันทึกค่าเมื่อมีการเปลี่ยนแปลง
  _handleRadioValueChange(int? value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedRadio = value!;
      prefs.setInt('selectedRadio', selectedRadio);
      Translate();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(
            num: 0, popPage: 3,
          ),
        ),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 8,),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/Flag_of_Thailand_%28non-standard_colours%29.svg/180px-Flag_of_Thailand_%28non-standard_colours%29.svg.png',
                          // width: 200,
                          height: 100,
                        ),
                        TextButton(
                            // style:ButtonStyle(shadowColor:Color(colors.)),
                          onPressed: () {
                            _handleRadioValueChange(1);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              (selectedRadio == 1)
                                  ? Icon(Icons.radio_button_on,color: Colors.orange,)
                                  : Icon(Icons.radio_button_off,color: Colors.orange,),
                              SizedBox(width: 8,),
                              Text(
                                'ภาษาไทย',
                                style: GoogleFonts.openSans(
                                    fontSize: 16, color: Color(0xFF555555)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Flag_of_the_United_Kingdom_%281-2%29.svg/1200px-Flag_of_the_United_Kingdom_%281-2%29.svg.png',
                          // width: 200,
                          height: 100,
                        ),
                        TextButton(
                          onPressed: () {
                            _handleRadioValueChange(2);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              (selectedRadio == 2)
                                  ? Icon(Icons.radio_button_on,color: Colors.orange,)
                                  : Icon(Icons.radio_button_off,color: Colors.orange,),
                              SizedBox(width: 8,),
                              Text(
                                'English',
                                style: GoogleFonts.openSans(
                                    fontSize: 16, color: Color(0xFF555555)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Divider(),
            ),
          ],
        ),
      ),
    );
  }
}
int selectedRadio = 2;