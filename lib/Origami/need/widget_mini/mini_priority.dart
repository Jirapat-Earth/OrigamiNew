import 'dart:async';
import 'dart:convert';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../../../Language/translate.dart';
import '../../../Login/login.dart';
import '../need_detail.dart';

class MiniPriority extends StatefulWidget {
  const MiniPriority({Key? key, required this.callback, required this.employee, required this.callbackId}) : super(key: key);
  final String Function(String) callback;
  final String Function(String) callbackId;
  final Employee employee;

  @override
  _MiniPriorityState createState() => _MiniPriorityState();
}

class _MiniPriorityState extends State<MiniPriority> {
  TextEditingController _searchPriority = TextEditingController();
  String _searchText = '';
  bool _showDown = false;

  @override
  void initState() {
    super.initState();
    _searchPriority.addListener(() {
      print("Current text: ${_searchPriority.text}");
    });
    fetchPriority(Priority_number, Priority_name);
  }

  @override
  void dispose() {
    _searchPriority.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Card(color: Colors.orange.shade500,child: Padding(padding: EdgeInsets.only(left: 40,right: 40,top: 8)),),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: Colors.orange.shade500,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: TextField(
                        controller: _searchPriority,
                        decoration: InputDecoration(
                          hintText: '$Search...',
                          hintStyle: GoogleFonts.openSans(color: Color(0xFF555555),),
                          labelStyle: GoogleFonts.openSans(color: Color(0xFF555555),),
                          border: InputBorder.none,
                          icon: Icon(Icons.search,color: Colors.orange.shade500,),
                          suffixIcon: Card(
                            elevation: 0,
                            color: Colors.orange,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                Priority_name = _searchPriority.text;
                                _showDown = true;
                                fetchPriority(int_Priority, Priority_name);
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                width: 80,
                                child: Center(
                                    child: Text('$Search',
                                        style: GoogleFonts.openSans(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ))),
                              ),
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            Priority_name = value;
                            fetchPriority(int_Priority, Priority_name);
                            _searchText = value;
                            // filterData_Priority();
                          });
                        },
                      ),
                    ),
                  ),
                ),
                (_searchText == '')
                    ? Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$SearchFor',
                        style: GoogleFonts.openSans(
                          fontSize: 16,
                          color: Color(0xFF555555),
                        ),
                      ),
                      SizedBox(height: 8,),
                      InkWell(
                        onTap: (){
                          setState(() {
                            _showDown = true;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'แสดงโครงการทั้งหมด',
                              style: GoogleFonts.openSans(
                                fontSize: 18,
                                decoration: TextDecoration.underline,
                                // color: Colors.orange,
                              ),),
                            SizedBox(width: 8,),
                            Icon(Icons.arrow_drop_down,color:Color(0xFF555555),)
                          ],
                        ),
                      )
                    ],
                  ),
                )
                    : Expanded(
                  child: ListView.builder(
                    itemCount: PriorityList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                Priority_name =
                                    PriorityList[index].priority_name ?? '';
                                widget.callback(Priority_name ?? '');
                                data_Id = PriorityList[index].priority_id ?? '';
                                widget.callbackId(data_Id ?? '');
                                Navigator.pop(context, Priority_name);
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                "${PriorityList[index].priority_name ?? ''}",
                                style: GoogleFonts.openSans(
                                  fontSize: 16,
                                  color: Color(0xFF555555),
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16),
                            child: Divider(),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          // int_project = int_project - 2;
                          // fetchProject(int_project.toString(), "");
                          Navigator.pop(context);
                        });
                      },
                      child: Row(
                        children: [
                          Icon(Icons.navigate_before,color: Colors.orange,),
                          Text(
                            "$Back",
                            style: GoogleFonts.openSans(
                              color: Color(0xFF555555),
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    // Text(
                    //   '',
                    //   style: GoogleFonts.openSans(
                    //       fontSize: 24,
                    //       color: Color(0xFF555555),
                    //       fontWeight: FontWeight.bold),
                    // ),
                    // TextButton(
                    //   onPressed: () {
                    //     setState(() {
                    //       int_project = int_project++;
                    //       fetchProject(int_project.toString(), "");
                    //       // Navigator.pop(context);
                    //     });
                    //   },
                    //   child: Row(
                    //     children: [
                    //       Text(
                    //         "ถัดไป",
                    //         style: GoogleFonts.openSans(
                    //           fontSize: 16,
                    //           color: Color(0xFF555555),
                    //         ),
                    //         overflow: TextOverflow.ellipsis,
                    //         maxLines: 1,
                    //       ),
                    //       Icon(Icons.navigate_next,color: Colors.orange,),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  //fillter
  List<PriorityData> PriorityOption = [];
  List<PriorityData> PriorityList = [];
  int int_Priority = 0;
  bool is_Priority = false;
  String? Priority_number = "";
  String? Priority_name = "";
  String? data_Id = "";
  Future<void> fetchPriority(Priority_number, Priority_name) async {
    final uri = Uri.parse(
        'https://www.origami.life/api/origami/need/priority.php?page=$Priority_number&search=$Priority_name');
    try {
      final response = await http.post(
        uri,
        body: {
          'comp_id': widget.employee.comp_id,
          'emp_id': widget.employee.emp_id,
        },
      );
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        if (jsonResponse['status'] == true) {
          final List<dynamic> PriorityJson = jsonResponse['priority_data'];
          setState(() {
            final priorityRespond = PriorityRespond.fromJson(jsonResponse);

            int_Priority = priorityRespond.next_page_number ?? 0;
            is_Priority = priorityRespond.next_page ?? false;
            PriorityOption = PriorityJson
                .map(
                  (json) => PriorityData.fromJson(json),
            )
                .toList();
            PriorityList = PriorityOption;
          });
        } else {
          throw Exception(
              'Failed to load personal data: ${jsonResponse['message']}');
        }
      } else {
        throw Exception(
            'Failed to load personal data: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to load personal data: $e');
    }
  }
}
