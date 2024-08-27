import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../../../Login/login.dart';
import '../need_detail.dart';
import '../need.dart';

class DeleteView extends StatefulWidget {
  const DeleteView({
    super.key,
    required this.needList,
    required this.NeedTypeItemOption,
    required this.employee,
    required this.indexI,
    required this.isLoading,
  });
  final List<NeedRespond> needList;
  final List<NeedTypeItemRespond> NeedTypeItemOption;
  final Employee employee;
  final int indexI;
  final bool isLoading;

  @override
  State<DeleteView> createState() => DeleteViewState();
}

class DeleteViewState extends State<DeleteView> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: widget.needList.length,
      itemBuilder: (context, indexNl) {
        if (indexNl == (widget.needList.length)) {
          return widget.isLoading
              ? Container()
              : Center(
                  child: CircularProgressIndicator(),
                );
        }
        return Column(
          children: [
            Card(
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: InkWell(
                onTap: () {
                  showModalBottomSheet<void>(
                    barrierColor: Colors.black87,
                    backgroundColor: Colors.transparent,
                    context: context,
                    isScrollControlled: true,
                    isDismissible: false,
                    enableDrag: false,
                    builder: (BuildContext context) {
                      // fetchDetail('edit', needList[index].mny_request_id??'' , '');
                      return Container(
                        color: Colors.white,
                        child: FractionallySizedBox(
                          heightFactor: 0.96,
                          child: Scaffold(
                            backgroundColor: Colors.transparent,
                            body: NeedDetail(
                              needTypeItem:
                                  widget.NeedTypeItemOption[widget.indexI],
                              employee: widget.employee,
                              request_id:
                                  widget.needList[indexNl].mny_request_id ?? '',
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: ListTile(
                  title: Text(
                    widget.needList[indexNl].need_subject ?? '',
                    style: GoogleFonts.openSans(
                      fontSize: 18.0,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  subtitle: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 8),
                            Text(
                              '${widget.needList[indexNl].mny_type_name ?? ''} - ${widget.needList[indexNl].mny_request_generate_code ?? ''}',
                              style: GoogleFonts.openSans(
                                fontSize: 14.0,
                                color: Color(0xFF555555),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Date : ${widget.needList[indexNl].create_date ?? ''} ",
                              style: GoogleFonts.openSans(
                                fontSize: 14.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Amount : ${widget.needList[indexNl].need_amount ?? ''} Baht",
                              style: GoogleFonts.openSans(
                                fontSize: 14.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Status : ${widget.needList[indexNl].need_status ?? ''}",
                                    style: GoogleFonts.openSans(
                                      fontSize: 14.0,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                              height: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Icon(
                                null,
                                color: Color(0xFF555555),
                                size: 30,
                              )),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                              height: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Icon(
                                null,
                                color: Color(0xFF555555),
                                size: 30,
                              )),
                          SizedBox(
                            height: 8,
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  fetchDelete(
                                      widget.needList[indexNl].mny_request_id ??
                                          '');
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DeleteView(
                                              needList: widget.needList,
                                              NeedTypeItemOption: widget.NeedTypeItemOption,
                                              employee: widget.employee,
                                              indexI: widget.indexI,
                                              isLoading: widget.isLoading,
                                            )),
                                  );
                                });
                              },
                              icon: Icon(
                                Icons.delete_outline,
                                color: Colors.redAccent,
                                size: 34,
                              ))
                        ],
                      ),
                    ],
                  ),
                  // Add more details as needed
                ),
              ),
            ),
            Divider(
              color: Colors.amber,
            ),
          ],
        );
      },
    );
  }

  Future<void> fetchDelete(request_id) async {
    final uri =
        Uri.parse('https://www.origami.life/api/origami/need/delete.php');
    try {
      final response = await http.post(
        uri,
        body: {
          'comp_id': widget.employee.comp_id,
          'emp_id': widget.employee.emp_id,
          'request_id': "$request_id",
        },
      );
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        if (jsonResponse['status'] == true) {
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
