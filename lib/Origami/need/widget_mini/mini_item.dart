import 'dart:async';
import 'dart:convert';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../../../Language/translate.dart';
import '../../../Login/login.dart';
import '../need_detail.dart';

class MiniItem extends StatefulWidget {
  const MiniItem({Key? key,required this.Item_type_id, required this.employee, required this.callbackID, required this.callbackNAME}) : super(key: key);
  final String Function(String) callbackID;
  final String Function(String) callbackNAME;
  final String Item_type_id;
  final Employee employee;

  @override
  _MiniItemState createState() => _MiniItemState();
}

class _MiniItemState extends State<MiniItem> {
  TextEditingController _searchItem = TextEditingController();
  String _searchText = '';
  bool _showDown = false;

  @override
  void initState() {
    super.initState();
    _searchItem.addListener(() {
      print("Current text: ${_searchItem.text}");
    });
    fetchItem(Item_number, Item_name,);
  }

  @override
  void dispose() {
    _searchItem.dispose();
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
                        controller: _searchItem,
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
                                Item_name = _searchItem.text;
                                _showDown = true;
                                fetchItem(int_Item, Item_name);
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
                            Item_name = value;
                            fetchItem(int_Item, Item_name);
                            _searchText = value;
                            // filterData_Item();
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
                      // InkWell(
                      //   onTap: (){
                      //     setState(() {
                      //       _showDown = true;
                      //     });
                      //   },
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Text(
                      //         'รายการทั้งหมด',
                      //         style: GoogleFonts.openSans(
                      //           fontSize: 18,
                      //           decoration: TextDecoration.underline,
                      //           // color: Colors.orange,
                      //         ),),
                      //       SizedBox(width: 8,),
                      //       Icon(Icons.arrow_drop_down,color:Color(0xFF555555),)
                      //     ],
                      //   ),
                      // )
                    ],
                  ),
                )
                    : Expanded(
                  child: ListView.builder(
                    itemCount: ItemOption.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                Item_name =
                                    ItemOption[index].item_name ?? '';
                                Item_id =
                                    ItemOption[index].item_id ?? '';
                                widget.callbackNAME(Item_name ?? '',);
                                widget.callbackID(Item_id ?? '',);
                                Navigator.pop(context);
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                "${ItemOption[index].item_name ?? ''}",
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
  List<ItemData> ItemOption = [];
  List<ItemData> ItemList = [];
  int int_Item = 0;
  bool is_Item = false;
  String? Item_number = "";
  String? Item_name = "";
  String? Item_id = "";
  String? Item_type_id = "";
  Future<void> fetchItem(item_number, item_name) async {
    final uri = Uri.parse(
        'https://www.origami.life/api/origami/need/item.php?page=$item_number&search=$item_name&need_type=${widget.Item_type_id}');
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
          final List<dynamic> ItemtJson = jsonResponse['item_data'];
          setState(() {
            final itemRespond = ItemRespond.fromJson(jsonResponse);

            int_Item = itemRespond.next_page_number ?? 0;
            is_Item = itemRespond.next_page ?? false;
            ItemOption = ItemtJson
                .map(
                  (json) => ItemData.fromJson(json),
            )
                .toList();
            ItemList = ItemOption;
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