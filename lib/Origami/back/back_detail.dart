// import 'dart:convert';
// import 'dart:io';
//
// import 'package:camera_camera/camera_camera.dart';
// import 'package:carousel_slider/carousel_controller.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
// import 'package:origami/Origami/need/widget_mini/mini_account.dart';
// import 'package:origami/Origami/need/widget_mini/mini_asset.dart';
// import 'package:origami/Origami/need/widget_mini/mini_contact.dart';
// import 'package:origami/Origami/need/widget_mini/mini_department.dart';
// import 'package:origami/Origami/need/widget_mini/mini_division.dart';
// import 'package:origami/Origami/need/widget_mini/mini_employee.dart';
// import 'package:origami/Origami/need/widget_mini/mini_item.dart';
// import 'package:origami/Origami/need/widget_mini/mini_project.dart';
// import 'package:origami/Origami/need/widget_mini/mini_unit.dart';
// import 'package:origami/Origami/need/widget_other/date_other.dart';
// import 'package:origami/Origami/need/widget_other/dropdown_need.dart';
// import 'package:http/http.dart' as http;
// import '../../Login/login.dart';
// import 'need.dart';
//
// class NeedDetailBack extends StatefulWidget {
//   const NeedDetailBack({
//     super.key,
//     required this.needTypeItem,
//     required this.employee,
//     required this.request_id,
//     required this.detailItem, // required this.detailItem,
//   });
//   final NeedTypeItemRespond needTypeItem;
//   final Employee employee;
//   final String request_id;
//   final NeedData detailItem;
//
//   @override
//   _NeedDetailBackState createState() => _NeedDetailBackState();
// }
//
// class _NeedDetailBackState extends State<NeedDetailBack> {
//   @override
//   TextEditingController _subjectController = TextEditingController();
//   TextEditingController _noteController = TextEditingController();
//   TextEditingController _detailController = TextEditingController();
//   TextEditingController _amountController = TextEditingController();
//   TextEditingController _priceController = TextEditingController();
//
//   static var optionStyle =
//   GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.bold);
//
//   DateTime _selectedEffective = DateTime.now();
//   DateTime _selectedReturn = DateTime.now();
//   DateTime _selectedItem = DateTime.now();
//
//   String _effective = '';
//   String _return = '';
//   String _itemdate = '';
//   String long = '';
//
//   Future<void> _effectiveDate(BuildContext context) async {
//     await showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return Theme(
//           data: ThemeData(
//             primaryColor: Colors.teal,
//             colorScheme: ColorScheme.light(
//               primary: Colors.orange,
//               onPrimary: Colors.white,
//               onSurface: Colors.teal,
//             ),
//             dialogBackgroundColor: Colors.teal[50],
//           ),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 CalendarDatePicker(
//                   initialDate: _selectedEffective,
//                   firstDate: DateTime(2000),
//                   lastDate: DateTime(2101),
//                   onDateChanged: (DateTime newDate) {
//                     setState(() {
//                       _selectedEffective = newDate;
//                       DateFormat formatter = DateFormat('dd/MM/yyyy');
//                       _effective = formatter.format(_selectedEffective);
//                     });
//                     Navigator.pop(context);
//                   },
//                 ),
//                 TextButton(
//                   child: Text(
//                     'Close',
//                     style: GoogleFonts.openSans(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.teal),
//                   ),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//                 SizedBox(
//                   height: 16,
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Future<void> _returnDate(BuildContext context) async {
//     await showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return Theme(
//           data: ThemeData(
//             primaryColor: Colors.teal,
//             colorScheme: ColorScheme.light(
//               primary: Colors.orange,
//               onPrimary: Colors.white,
//               onSurface: Colors.teal,
//             ),
//             dialogBackgroundColor: Colors.teal[50],
//           ),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 CalendarDatePicker(
//                   initialDate: _selectedReturn,
//                   firstDate: DateTime(2000),
//                   lastDate: DateTime(2101),
//                   onDateChanged: (DateTime newDate) {
//                     setState(() {
//                       _selectedReturn = newDate;
//                       DateFormat formatter = DateFormat('dd/MM/yyyy');
//                       _return = formatter.format(_selectedReturn);
//                     });
//                     Navigator.pop(context);
//                   },
//                 ),
//                 TextButton(
//                   child: Text(
//                     'Close',
//                     style: GoogleFonts.openSans(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.teal),
//                   ),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//                 SizedBox(
//                   height: 16,
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   void Day() {
//     DateFormat formatter = DateFormat('dd/MM/yyyy');
//     // DateFormat formatter2 = DateFormat('yyyy/MM/dd');
//     // long = formatter2.format(_selectedEffective);
//     _effective = formatter.format(_selectedEffective);
//     _return = formatter.format(_selectedReturn);
//
//     print(long);
//     // _effective = formatter.format(_selectedEffective);
//     // _return = formatter.format(_selectedReturn);
//     if (widget.needTypeItem.type_id == "ADV" ||
//         widget.needTypeItem.type_id == "EP") {
//       _itemdate = '';
//     } else {
//       _itemdate = formatter.format(_selectedItem);
//     }
//     if ((widget.needTypeItem.type_id != "ASS")) {
//       _return = '';
//     }
//   }
//
//   void needEdit() {
//     // if (widget.request_id != '') {
//     //   _searchSubject = widget.detailItem.needSubject;
//     //   _reson = widget.detailItem.needReason ?? '';
//     //   editpriorityText = widget.detailItem.priorityName;
//     //   _effective = widget.detailItem.effectiveDate;
//     //   editDepartmentText = widget.detailItem.departmentName;
//     //   editDivisionText = widget.detailItem.divisionName ?? '';
//     //   editEmployeeText = widget.detailItem.paytoEmpName;
//     //   editprojectText = widget.detailItem.projectName ?? '';
//     //   editAssetText = widget.detailItem.assetName ?? '';
//     //   editAccountText = widget.detailItem.accountName ?? '';
//     //   editContactText = widget.detailItem.contactName ?? '';
//     //   saveItem = widget.detailItem.itemData;
//     // }
//   }
//
//   void inputAPI() {
//     fetchProject(project_number, project_name);
//     fetchAccount(account_number, account_name);
//     fetchContact(contact_number, contact_name);
//     fetchDepartment(department_number, department_name);
//     fetchAsset(asset_number, asset_name);
//     fetchDivision(division_number, division_name);
//     fetchEmployee(employee_number, employee_name);
//     fetchItem(item_number, item_name);
//     fetchUnit(unit_number, unit_name);
//     fetchPriority(priority_number, priority_name);
//   }
//
//   NeedData? detailItem;
//
//   @override
//   void initState() {
//     super.initState();
//     Day();
//     needEdit();
//     inputAPI();
//     detailItem = widget.detailItem;
//     Item_type_id = widget.needTypeItem.type_id ?? '';
//
//     // _searchProject.addListener(() {
//     //   print("Current text: ${_searchProject.text}");
//     // });
//   }
//
//   @override
//   void dispose() {
//     // _searchProject.dispose();
//     super.dispose();
//   }
//
//   // เพิ่มกล้อง
//   late var selectedImages = <File>[];
//   bool image = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         foregroundColor: Colors.white,
//         title: Row(
//           children: [
//             Container(
//               child: Text(
//                 widget.needTypeItem.type_name ?? '',
//                 style: GoogleFonts.openSans(
//                     fontWeight: FontWeight.bold, color: Colors.white),
//               ),
//             ),
//             Spacer(),
//             Row(
//               children: [
//                 // IconButton(
//                 //   onPressed: () => _pickImage(),
//                 //   icon: Icon(
//                 //     Icons.camera_alt_outlined,
//                 //     color: Colors.white,
//                 //   ),
//                 // ),
//                 // SizedBox(
//                 //   width: 8,
//                 // ),
//                 InkWell(
//                   onTap: () {
//                     showModalBottomSheet<void>(
//                       barrierColor: Colors.black87,
//                       backgroundColor: Colors.transparent,
//                       context: context,
//                       isScrollControlled: true,
//                       builder: (BuildContext context) {
//                         return _bill();
//                       },
//                     );
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Icon(
//                       Icons.photo_album_outlined,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 8,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     // setState(() {
//                     //   editItem_id = '';
//                     //   edititemText = '';
//                     //   _detailController.text = '';
//                     //   _amountController.text = '';
//                     //   _priceController.text = '';
//                     //   editunitText = '';
//                     //   sumT = '';
//                     // });
//                     showModalBottomSheet<void>(
//                       barrierColor: Colors.black87,
//                       backgroundColor: Colors.transparent,
//                       context: context,
//                       isScrollControlled: true,
//                       isDismissible: false,
//                       enableDrag: false,
//                       builder: (BuildContext context) {
//                         return _item();
//                       },
//                     );
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Icon(
//                       Icons.file_present,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//         actions: [],
//         backgroundColor: Colors.orange,
//       ),
//       body: _getContentWidget(),
//     );
//   }
//
//   String? selectedValue = '';
//   String _searchSubject = '';
//   String _reson = '';
//   Widget _getContentWidget() {
//     return SafeArea(
//       child: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16),
//           child: Column(
//             children: [
//               Container(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           'เรื่อง ',
//                           style: optionStyle,
//                         ),
//                         Text(
//                           '***',
//                           style: GoogleFonts.openSans(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.red),
//                         ),
//                       ],
//                     ),
//                     // Divider(),
//                     Container(
//                       height: 48,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         border: Border.all(
//                           color: Colors.orange.shade500,
//                           width: 2.0,
//                         ),
//                       ),
//                       child: TextFormField(
//                         keyboardType: TextInputType.text,
//                         controller: _subjectController,
//                         style: GoogleFonts.openSans(
//                             color: Colors.black, fontSize: 14),
//                         decoration: InputDecoration(
//                           labelStyle: GoogleFonts.openSans(color: Colors.blue),
//                           filled: true,
//                           fillColor: Colors.white,
//                           hintText: (widget.request_id == '')
//                               ? 'Subject'
//                               : _searchSubject,
//                           hintStyle: GoogleFonts.openSans(
//                               fontSize: 14,
//                               color: (_searchSubject == '')
//                                   ? Colors.black38
//                                   : Colors.black),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15),
//                             borderSide: BorderSide.none,
//                           ),
//                         ),
//                         onChanged: (value) {
//                           _searchSubject = value;
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 8,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'เหตุผล',
//                     style: optionStyle,
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       border: Border.all(
//                         color: Colors.orange.shade500,
//                         width: 2.0,
//                       ),
//                     ),
//                     child: TextFormField(
//                       minLines: 5,
//                       maxLines: null,
//                       keyboardType: TextInputType.text,
//                       controller: _noteController,
//                       style: GoogleFonts.openSans(
//                           color: Colors.black, fontSize: 14),
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Colors.white,
//                         hintText:
//                         (widget.request_id == '') ? 'Reson...' : _reson,
//                         hintStyle: GoogleFonts.openSans(
//                             fontSize: 14,
//                             color:
//                             (_reson == '') ? Colors.black38 : Colors.black),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15),
//                           borderSide: BorderSide.none,
//                         ),
//                       ),
//                       onChanged: (value) {
//                         _reson = value;
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 8,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.only(left: 8),
//                     child: Text(
//                       'ระดับความสำคัญ',
//                       style: optionStyle,
//                     ),
//                   ),
//                   _priority(priorityOption),
//                 ],
//               ),
//               SizedBox(
//                 height: 8,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'วันที่มีผล',
//                           style: optionStyle,
//                         ),
//                         Container(
//                           height: 48,
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15),
//                             border: Border.all(
//                               color: Colors.orange.shade500,
//                               width: 2.0,
//                             ),
//                           ),
//                           child: InkWell(
//                             onTap: () {
//                               setState(() {
//                                 _effectiveDate(context);
//                               });
//                             },
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Row(
//                                 children: [
//                                   Text(
//                                     (_effective == '')
//                                         ? detailItem?.effectiveDate ?? ''
//                                         : _effective,
//                                     style: GoogleFonts.openSans(
//                                         fontSize: 14, color: Colors.black),
//                                   ),
//                                   Spacer(),
//                                   Icon(Icons.calendar_month),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(width: 8),
//                   (widget.needTypeItem.type_id == "ASS")
//                       ? Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'วันที่กลับ',
//                           style: optionStyle,
//                         ),
//                         Container(
//                           height: 48,
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15),
//                             border: Border.all(
//                               color: Colors.orange.shade500,
//                               width: 2.0,
//                             ),
//                           ),
//                           child: InkWell(
//                             onTap: () {
//                               setState(() {
//                                 _returnDate(context);
//                               });
//                             },
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Row(
//                                 children: [
//                                   Text(
//                                     (_return == '')
//                                         ? detailItem?.returnDate ?? ''
//                                         : _return,
//                                     style: GoogleFonts.openSans(
//                                         fontSize: 14,
//                                         color: Colors.black),
//                                   ),
//                                   Spacer(),
//                                   Icon(Icons.calendar_month),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                       : Expanded(child: Container())
//                 ],
//               ),
//               SizedBox(
//                 height: 8,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'ฝ่าย',
//                           style: optionStyle,
//                         ),
//                         _department(departmentOption)
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     width: 8,
//                   ),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'แผนก',
//                           style: optionStyle,
//                         ),
//                         _division(DivisionOption),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 8,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'ชำระเงินที่',
//                     style: optionStyle,
//                   ),
//                   _employee(employeeOption),
//                 ],
//               ),
//               SizedBox(
//                 height: 8,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'โครงการ',
//                     style: optionStyle,
//                   ),
//                   _project(projectList),
//                 ],
//               ),
//               SizedBox(
//                 height: 8,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'ลูกค้า',
//                     style: optionStyle,
//                   ),
//                   _account(accountOption),
//                 ],
//               ),
//               SizedBox(
//                 height: 8,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'สินทรัพย์',
//                     style: optionStyle,
//                   ),
//                   _asset(assetOption),
//                 ],
//               ),
//               SizedBox(
//                 height: 8,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'ติดต่อ',
//                     style: optionStyle,
//                   ),
//                   _contact(contactOption),
//                 ],
//               ),
//               SizedBox(
//                 height: 16,
//               ),
//               InkWell(
//                 onTap: () {
//                   setState(() {
//                     if (_subjectController.text == '' && _effective == '' && editEmployeeText == '') {
//                       showDialog(
//                         context: context,
//                         builder: (BuildContext dialogContext) {
//                           return AlertDialog(
//                             title: Icon(
//                               Icons.info_outline,
//                               size: 64,
//                               color: Colors.red,
//                             ),
//                             content: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   'กรุณาระบุหัวข้อเรื่องก่อนบันทึกข้อมูล',
//                                   style: GoogleFonts.openSans(
//                                       fontSize: 16,
//                                       // fontWeight: FontWeight.bold,
//                                       color: Colors.black),
//                                 ),
//                               ],
//                             ),
//                             actions: <Widget>[
//                               TextButton(
//                                 child: Text(
//                                   'Colse',
//                                   style: GoogleFonts.openSans(
//                                     color: Colors.orange,
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 onPressed: () {
//                                   // Navigator.of(dialogContext).pop();
//                                   Navigator.pop(context);
//                                 },
//                               ),
//                             ],
//                           );
//                         },
//                       );
//                     } else {
//                       // save post
//                       SaveItemId = addItemId;
//                       SaveItemDate = addItemDate;
//                       SaveItemNote = addItemNote;
//                       SaveItemQuantity = addItemQuantity;
//                       SaveItemPrice = addItemPrice;
//                       SaveItemUnit = addItemUnit;
//                       fetchSave(
//                         _searchSubject,
//                         editpriorityText,
//                         _reson,
//                         _effective,
//                         editDepartmentText,
//                         editDivisionText,
//                         editEmployeeText,
//                         editprojectText,
//                         editAssetText,
//                         editAccountText,
//                         editContactText,
//                         imageItem,
//
//                         SaveItemId,
//                         SaveItemDate,
//                         SaveItemNote,
//                         SaveItemQuantity,
//                         SaveItemPrice,
//                         SaveItemUnit,
//                       );
//                     }
//                   });
//
//                   Navigator.pop(context);
//
//                 },
//                 child: Card(
//                   color: Colors.orange.shade500,
//                   child: Container(
//                     width: double.infinity,
//                     height: 50,
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.all(16),
//                     child: Text(
//                       'SAVE',
//                       style: GoogleFonts.openSans(
//                         fontSize: 16.0,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   String editpriorityText = '';
//   String priorityId = '';
//   PriorityData? _selectedPriority;
//   Widget _priority(List<PriorityData> _priority) {
//     editpriorityText = _selectedPriority?.priority_name ?? '';
//     priorityId = _selectedPriority?.priority_id ?? '';
//     return Container(
//       height: 48,
//       // width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15),
//         border: Border.all(
//           color: Colors.orange.shade500,
//           width: 2.0,
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.only(right: 8.0),
//         child: SizedBox(
//           width: double.infinity,
//           child: DropdownButtonHideUnderline(
//             child: DropdownButton2<PriorityData>(
//               isExpanded: true,
//               hint: Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 8, bottom: 8),
//                     child: Container(
//                       color: Colors.green,
//                       // color: Color(int.parse(
//                       //     '0xFF${this.detailItem?.priorityColor??''}')),
//                       padding: EdgeInsets.all(2),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 8,
//                   ),
//                   Text(
//                     (widget.request_id == '')
//                         ? detailItem?.priorityName ?? ''
//                         : editpriorityText,
//                     style:
//                     GoogleFonts.openSans(fontSize: 14, color: Colors.black),
//                   ),
//                   // Spacer(),
//                   // Icon(Icons.arrow_drop_down)
//                 ],
//               ),
//               value: _selectedPriority,
//               style: GoogleFonts.openSans(fontSize: 14, color: Colors.black),
//               underline: Container(
//                 height: 1,
//                 color: Colors.transparent,
//               ),
//               items: priorityOption.map((PriorityData priority) {
//                 return DropdownMenuItem<PriorityData>(
//                   value: priority,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(top: 6, bottom: 6),
//                             child: Container(
//                               color: Colors.green,
//                               // color: Color(int.parse(
//                               //     '0xFF${this.detailItem?.priorityColor??''}')),
//                               padding: EdgeInsets.only(
//                                   top: 14, bottom: 14, left: 2, right: 2),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(25),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 8,
//                           ),
//                           Text(
//                             priority.priority_name ?? '',
//                             style: GoogleFonts.openSans(
//                               fontSize: 14,
//                               color: Colors.black,
//                             ),
//                           ),
//                           // Spacer(),
//                           // Icon(Icons.arrow_drop_down)
//                         ],
//                       ),
//                     ],
//                   ),
//                 );
//               }).toList(),
//               onChanged: (PriorityData? newValue) {
//                 setState(() {
//                   _selectedPriority = newValue;
//                 });
//               },
//               iconStyleData: IconStyleData(
//                 icon: Icon(Icons.arrow_drop_down),
//                 iconEnabledColor: Colors.black,
//                 iconDisabledColor: Colors.black,
//                 iconSize: 24,
//               ),
//               dropdownStyleData: DropdownStyleData(
//                 elevation: 1,
//                 decoration: BoxDecoration(
//                   color: Colors.white, // สีพื้นหลังของเมนู dropdown
//                   borderRadius: BorderRadius.only(
//                     bottomLeft:Radius.circular(15),
//                     bottomRight:Radius.circular(15),
//                   ),
//                 ),
//               ),
//               // buttonStyleData: ButtonStyleData(
//               //   height: 50,
//               //   decoration: BoxDecoration(
//               //     color: Colors.white, // สีพื้นหลังของปุ่ม
//               //     borderRadius: BorderRadius.circular(15),
//               //   ),
//               //   padding: EdgeInsets.symmetric(horizontal: 16),
//               // ),
//             ),
//           ),
//         ),
//       ),
//     );
//     // DropdownButton<PriorityData>(
//     //   value: _selectedPriority,
//     //   hint: Padding(
//     //     padding: const EdgeInsets.only(left: 16),
//     //     child: Row(
//     //       children: [
//     //         Padding(
//     //           padding: const EdgeInsets.only(top: 6, bottom: 6),
//     //           child: Container(
//     //             color: Colors.green,
//     //             // color: Color(int.parse(
//     //             //     '0xFF${this.detailItem?.priorityColor??''}')),
//     //             padding: EdgeInsets.all(2),
//     //             decoration: BoxDecoration(
//     //               borderRadius: BorderRadius.circular(25),
//     //             ),
//     //           ),
//     //         ),
//     //         SizedBox(
//     //           width: 8,
//     //         ),
//     //         Text(
//     //           detailItem?.priorityName ?? '',
//     //           style: GoogleFonts.openSans(fontSize: 14, color: Colors.black),
//     //         ),
//     //       ],
//     //     ),
//     //   ),
//     //   onChanged: (PriorityData? newPriority) {
//     //     setState(() {
//     //       _selectedPriority = newPriority;
//     //       editpriorityText = newPriority?.priority_name ?? '';
//     //     });
//     //   },
//     //   items: _priority
//     //       .map<DropdownMenuItem<PriorityData>>((PriorityData priority) {
//     //     return DropdownMenuItem<PriorityData>(
//     //       value: priority,
//     //       child: Padding(
//     //         padding: const EdgeInsets.only(left: 16),
//     //         child: Column(
//     //           children: [
//     //             Row(
//     //               children: [
//     //                 Padding(
//     //                   padding: const EdgeInsets.only(top: 6, bottom: 6),
//     //                   child: Container(
//     //                     color: Colors.green,
//     //                     // color: Color(int.parse(
//     //                     //     '0xFF${this.detailItem?.priorityColor??''}')),
//     //                     padding: EdgeInsets.all(2),
//     //                     decoration: BoxDecoration(
//     //                       borderRadius: BorderRadius.circular(25),
//     //                     ),
//     //                   ),
//     //                 ),
//     //                 SizedBox(
//     //                   width: 8,
//     //                 ),
//     //                 Text(
//     //                   priority.priority_name ?? '',
//     //                   style: GoogleFonts.openSans(
//     //                     fontSize: 14,
//     //                     color: Colors.black,
//     //                   ),
//     //                 ),
//     //               ],
//     //             ),
//     //             Divider()
//     //           ],
//     //         ),
//     //       ),
//     //     );
//     //   }).toList(),
//     //   icon: Icon(Icons.arrow_drop_down_outlined),
//     //   iconSize: 24,
//     //   elevation: 0,
//     //   style: GoogleFonts.openSans(fontSize: 14, color: Colors.black),
//     //   underline: Container(
//     //     height: 2,
//     //     color: Colors.transparent,
//     //   ),
//     //   dropdownColor: Colors.orange.shade50,
//     //   borderRadius: BorderRadius.circular(15),
//     //   padding: EdgeInsets.only(top: 4, bottom: 4, right: 8),
//     //   isExpanded: true,
//     // ),
//   }
//
//   String editprojectText = '';
//   String projectId = '';
//   Widget _project(List<ProjectData> _project) {
//     return DropdownNeed(
//       title: editprojectText,
//       textTitle: detailItem?.projectName ?? '',
//       onTap: () {
//         setState(() {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => MiniProject(
//                 callback: (String value) => editprojectText = value,
//                 employee: widget.employee, callbackId: (String value) => projectId = value,
//               ),
//             ),
//           );
//         });
//       },
//       textTitleNull: 'Project',
//     );
//   }
//
//   List<DepartmentData> filteredDepartment = [];
//   String editDepartmentText = '';
//   String departmentId = '';
//   Widget _department(List<DepartmentData> departmentOption) {
//     return DropdownNeed(
//       title: editDepartmentText,
//       textTitle: detailItem?.departmentName ?? '',
//       onTap: () {
//         setState(() {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => MiniDepartment(
//                 callback: (String value) => editDepartmentText = value,
//                 employee: widget.employee, callbackId: (String value) => departmentId = value,
//               ),
//             ),
//           );
//         });
//       },
//       textTitleNull: 'Department',
//     );
//   }
//
//   List<DivisionData> filteredDivision = [];
//   String editDivisionText = '';
//   String divisionId = '';
//   Widget _division(List<DivisionData> divisionOption) {
//     return DropdownNeed(
//       title: editDivisionText,
//       textTitle: detailItem?.divisionName ?? '',
//       onTap: () {
//         setState(() {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => MiniDivision(
//                 callback: (String value) => editDivisionText = value,
//                 employee: widget.employee, callbackId: (String value) => divisionId = value,
//               ),
//             ),
//           );
//         });
//       },
//       textTitleNull: 'Division',
//     );
//   }
//
//   List<EmployeeData> filteredEmployee = [];
//   String editEmployeeText = '';
//   String employeeId = '';
//   Widget _employee(List<EmployeeData> employeeOption) {
//     return DropdownNeed(
//       title: editEmployeeText,
//       textTitle: detailItem?.paytoEmpName ?? '',
//       onTap: () {
//         setState(() {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => MiniEmployee(
//                 callback: (String value) => editEmployeeText = value,
//                 employee: widget.employee, callbackId: (String value) => employeeId = value,
//               ),
//             ),
//           );
//         });
//       },
//       textTitleNull: 'Employee',
//     );
//   }
//
//   List<AccountData> filteredAccount = [];
//   String editAccountText = '';
//   String accountId = '';
//   Widget _account(List<AccountData> accountOption) {
//     return DropdownNeed(
//       title: editAccountText,
//       textTitle: detailItem?.accountName ?? '',
//       onTap: () {
//         setState(() {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => MiniAccount(
//                 callback: (String value) => editAccountText = value,
//                 employee: widget.employee, callbackId: (String value) => accountId = value,
//               ),
//             ),
//           );
//         });
//       },
//       textTitleNull: 'Account',
//     );
//   }
//
//   List<AssetData> filteredAsset = [];
//   String editAssetText = '';
//   String assetId = '';
//   Widget _asset(List<AssetData> assetOption) {
//     return DropdownNeed(
//       title: editAssetText,
//       textTitle: detailItem?.assetName ?? '',
//       onTap: () {
//         setState(() {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => MiniAsset(
//                 callback: (String value) => editAssetText = value,
//                 employee: widget.employee, callbackId: (String value) => assetId = value,
//               ),
//             ),
//           );
//         });
//       },
//       textTitleNull: 'Asset',
//     );
//   }
//
//   List<ContactData> filteredContact = [];
//   String editContactText = '';
//   String contactId = '';
//   Widget _contact(List<ContactData> contactOption) {
//     return DropdownNeed(
//       title: editContactText,
//       textTitle: detailItem?.contactName ?? '',
//       onTap: () {
//         setState(() {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => MiniContact(
//                 callback: (String value) => editContactText = value,
//                 employee: widget.employee, callbackId: (String value) => contactId = value,
//               ),
//             ),
//           );
//         });
//       },
//       textTitleNull: 'Contact',
//     );
//   }
//
//   List<ItemData> filteredItem = [];
//   String edititemText = 'item';
//   String selectItemId = '';
//   Widget _selectItem(List<ItemData> itemOption) {
//     return DropdownNeed(
//       title: edititemText,
//       textTitle: edititemText,
//       onTap: () {
//         setState(() {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => MiniItem(
//                 callbackID: (String value) => selectItemId = value,
//                 callbackNAME: (String value) => edititemText = value,
//                 employee: widget.employee,
//                 Item_type_id: widget.needTypeItem.type_id ?? '',
//               ),
//             ),
//           );
//         });
//       },
//       textTitleNull: 'Item',
//     );
//     //   Center(
//     //     child: Container(
//     //   height: 48,
//     //   width: double.infinity,
//     //   decoration: BoxDecoration(
//     //     borderRadius: BorderRadius.circular(15),
//     //     border: Border.all(
//     //       color: Colors.orange.shade500,
//     //       width: 2.0,
//     //     ),
//     //   ),
//     //   child: InkWell(
//     //     onTap: () {
//     //       setState(() {
//     //         Navigator.push(
//     //           context,
//     //           MaterialPageRoute(
//     //             builder: (context) => MiniItem(
//     //               callback: (String value) => edititemText = value,
//     //               employee: widget.employee,
//     //               Item_type_id: widget.needTypeItem.type_id ?? '',
//     //             ),
//     //           ),
//     //         );
//     //       });
//     //     },
//     //     child: Padding(
//     //       padding: const EdgeInsets.all(8.0),
//     //       child: Row(
//     //         children: [
//     //           Expanded(
//     //             child: Text(
//     //               (edititemText == '')
//     //                   ? 'item'
//     //                   : (edititemText != '')
//     //                       ? edititemText
//     //                       : 'null',
//     //               style: GoogleFonts.openSans(
//     //                   fontSize: 14,
//     //                   color:
//     //                       (edititemText == '') ? Colors.black38 : Colors.black),
//     //               overflow: TextOverflow.ellipsis,
//     //               maxLines: 1,
//     //             ),
//     //           ),
//     //           Icon(Icons.arrow_drop_down_outlined),
//     //         ],
//     //       ),
//     //     ),
//     //   ),
//     // ));
//   }
//
//   // String editassetItem = '';
//   // Widget _selectAsset(List<AssetData> assetOption) {
//   //   return DropdownNeed(
//   //     title: editassetItem,
//   //     textTitle: detailItem?.assetName ?? '',
//   //     onTap: () {
//   //       setState(() {
//   //         Navigator.push(
//   //           context,
//   //           MaterialPageRoute(
//   //             builder: (context) => MiniAsset(
//   //               callback: (String value) => editassetItem = value,
//   //               employee: widget.employee,
//   //             ),
//   //           ),
//   //         );
//   //       });
//   //     },
//   //     textTitleNull: 'AssetItem',
//   //   );
//   // }
//
//   List<ItemData> filteredUnit = [];
//   String editunitText = 'unti';
//   String editunit_id = '';
//   Widget _selectUnit(List<UnitData> unitOption) {
//     return DropdownNeed(
//       title: editunitText,
//       textTitle: editunitText,
//       onTap: () {
//         setState(() {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => MiniUnit(
//                 callbackName: (String value) => editunitText = value,
//                 callbackId: (String value) => editunit_id = value,
//                 employee: widget.employee,
//               ),
//             ),
//           );
//         });
//       },
//       textTitleNull: 'Unit',
//     );
//   }
//
//   String quantityT = '';
//   String priceT = '';
//   String sumT = '';
//   String _detail = '';
//   int quantity = 0;
//   int price = 0;
//   int sum = 0;
//
//   List<NeedItemData> saveItem = [];
//   void addSaveItem(
//       String saveId,
//       String saveName,
//       String saveQuantity,
//       String savePrice,
//       String saveunitCode,
//       String saveunitDesc,
//       String saveAmount,
//       String saveNote,
//       String saveDate,
//       ) {
//     saveItem.add(NeedItemData(
//       itemId: saveId,
//       itemName: saveName,
//       itemQuantity: saveQuantity,
//       itemPrice: savePrice,
//       unitCode: saveunitCode,
//       unitDesc: saveunitDesc,
//       itemAmount: saveAmount,
//       itemNote: saveNote,
//       itemDate: saveDate,
//     ));
//     // return saveItem;
//   }
//
//   Widget _item() {
//     return Container(
//       color: Colors.white,
//       child: FractionallySizedBox(
//         heightFactor: 0.8,
//         child: MaterialApp(
//           debugShowCheckedModeBanner: false,
//           home: Scaffold(
//             backgroundColor: Colors.white,
//             appBar: AppBar(
//               backgroundColor: Colors.white,
//               title: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Icon(null),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 6),
//                     child: Center(
//                       child: Text(
//                         'รายการ',
//                         style: GoogleFonts.openSans(),
//                       ),
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       if (saveItem.length == 0) {
//                         return;
//                       } else {
//                         showModalBottomSheet<void>(
//                           barrierColor: Colors.black87,
//                           backgroundColor: Colors.transparent,
//                           context: context,
//                           isScrollControlled: true,
//                           builder: (BuildContext context) {
//                             return _listItem();
//                           },
//                         );
//                       }
//                     },
//                     child: Stack(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(top: 6, right: 4),
//                           child: Icon(
//                             Icons.library_books_outlined,
//                           ),
//                         ),
//                         Positioned(
//                           right: 0,
//                           child: Container(
//                             width: 16,
//                             height: 16,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(25),
//                               color: Colors.orange.shade300,
//                               // border: Border.all(
//                               //   color: Colors.red,
//                               //   width: 2.0,
//                               // ),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 '${saveItem.length}',
//                                 style: GoogleFonts.openSans(
//                                     color: Colors.black,
//                                     fontSize: 10,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             body: Expanded(
//               child: Container(
//                 padding: EdgeInsets.all(16.0),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           (widget.needTypeItem.type_id == "ADV" ||
//                               widget.needTypeItem.type_id == "EP")
//                               ? Container()
//                               : Column(
//                             children: [
//                               DateOrder(
//                                 firstDay: (String value) =>
//                                 _itemdate = value,
//                                 getfirstDay: _itemdate,
//                               ),
//                               SizedBox(
//                                 height: 8,
//                               ),
//                               Divider(),
//                               SizedBox(
//                                 height: 8,
//                               ),
//                             ],
//                           ),
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 padding: EdgeInsets.only(top: 16),
//                                 child: Text(
//                                   'รายการ : ',
//                                   style: optionStyle,
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Column(
//                                   children: [
//                                     _selectItem(itemOption),
//                                     // SizedBox(
//                                     //   height: 8,
//                                     // ),
//                                     // _selectAsset(assetOption),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 8,
//                           ),
//                           Divider(),
//                           SizedBox(
//                             height: 8,
//                           ),
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Container(
//                                 child: Text(
//                                   'รายละเอียด : ',
//                                   style: optionStyle,
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(
//                                       left: 16, right: 16),
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(15.0),
//                                       border: Border.all(
//                                         color: Colors.orange.shade500,
//                                         width: 2.0,
//                                       ),
//                                     ),
//                                     child: TextFormField(
//                                       minLines: 2,
//                                       maxLines: null,
//                                       keyboardType: TextInputType.text,
//                                       controller: _detailController,
//                                       style: GoogleFonts.openSans(
//                                           color: Colors.black, fontSize: 14),
//                                       decoration: InputDecoration(
//                                         filled: true,
//                                         fillColor: Colors.white,
//                                         hintText: 'Detail...',
//                                         hintStyle: GoogleFonts.openSans(
//                                             fontSize: 14,
//                                             color:
//                                             (_detailController.text == '')
//                                                 ? Colors.black38
//                                                 : Colors.black),
//                                         border: OutlineInputBorder(
//                                           borderRadius:
//                                           BorderRadius.circular(15),
//                                           borderSide: BorderSide.none,
//                                         ),
//                                       ),
//                                       onChanged: (value) {
//                                         _detail = value;
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 8,
//                           ),
//                           Divider(),
//                           SizedBox(
//                             height: 8,
//                           ),
//                           Row(
//                             // crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'ปริมาณ : ',
//                                 style: optionStyle,
//                               ),
//                               Expanded(
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(
//                                       left: 16.0, right: 16),
//                                   child: Container(
//                                     height: 48,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(15.0),
//                                       border: Border.all(
//                                         color: Colors.orange.shade500,
//                                         width: 2.0,
//                                       ),
//                                     ),
//                                     child: TextFormField(
//                                       keyboardType: TextInputType.number,
//                                       controller: _amountController,
//                                       decoration: InputDecoration(
//                                         filled: true,
//                                         fillColor: Colors.white,
//                                         hintText: '0',
//                                         hintStyle: GoogleFonts.openSans(
//                                             fontSize: 14,
//                                             color:
//                                             (_amountController.text == '')
//                                                 ? Colors.black38
//                                                 : Colors.black),
//                                         border: OutlineInputBorder(
//                                           borderRadius:
//                                           BorderRadius.circular(15),
//                                           borderSide: BorderSide.none,
//                                         ),
//                                       ),
//                                       onChanged: (value) {
//                                         setState(() {
//                                           quantityT = value;
//                                           quantity = int.parse(value);
//                                           sum = ((priceT == '') ? 0 : price) *
//                                               int.parse(value);
//                                           sumT = sum.toString();
//                                           print(sumT);
//                                         });
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Expanded(child: _selectUnit(unitOption)),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 8,
//                           ),
//                           Divider(),
//                           SizedBox(
//                             height: 8,
//                           ),
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'ราคา : ',
//                                 style: optionStyle,
//                               ),
//                               Expanded(
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(
//                                       left: 16, right: 16),
//                                   child: Container(
//                                     height: 48,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(15.0),
//                                       border: Border.all(
//                                         color: Colors.orange.shade500,
//                                         width: 2.0,
//                                       ),
//                                     ),
//                                     child: TextFormField(
//                                       keyboardType: TextInputType.number,
//                                       controller: _priceController,
//                                       decoration: InputDecoration(
//                                         filled: true,
//                                         fillColor: Colors.white,
//                                         hintText: '0',
//                                         hintStyle: GoogleFonts.openSans(
//                                             fontSize: 14,
//                                             color: (_priceController.text == '')
//                                                 ? Colors.black38
//                                                 : Colors.black),
//                                         border: OutlineInputBorder(
//                                           borderRadius:
//                                           BorderRadius.circular(15),
//                                           borderSide: BorderSide.none,
//                                         ),
//                                       ),
//                                       onChanged: (value) {
//                                         setState(() {
//                                           priceT = value;
//                                           price = int.parse(value);
//                                           sum = ((quantityT == '')
//                                               ? 0
//                                               : quantity) *
//                                               int.parse(value);
//                                           sumT = sum.toString();
//                                           print(sumT);
//                                         });
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 8,
//                           ),
//                           Divider(),
//                           SizedBox(
//                             height: 8,
//                           ),
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text(
//                                 'ราคา/หน่วย : ',
//                                 style: optionStyle,
//                               ),
//                               Expanded(
//                                 child: Text(
//                                   (_amountController.text == '' ||
//                                       _priceController.text == '')
//                                       ? '0'
//                                       : '${sumT}',
//                                   style: GoogleFonts.openSans(
//                                     fontSize: 16,
//                                     color: (_amountController.text == '' ||
//                                         _priceController.text == '')
//                                         ? Colors.black38
//                                         : Colors.black,
//                                   ),
//                                 ),
//                               ),
//                               Card(
//                                 elevation: 0,
//                                 color: Colors.orange,
//                                 shape: const RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.all(
//                                     Radius.circular(25),
//                                   ),
//                                 ),
//                                 child: InkWell(
//                                   onTap: () {
//                                     setState(() {
//                                       sum = quantity * price;
//                                     });
//                                   },
//                                   child: Container(
//                                     alignment: Alignment.centerRight,
//                                     width: 80,
//                                     height: 40,
//                                     child: Center(
//                                       child: Text(
//                                         'คำนวน',
//                                         style: GoogleFonts.openSans(
//                                             color: Colors.white,
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 16),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 8,
//                           ),
//                           Divider(),
//                           SizedBox(
//                             height: 16,
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 foregroundColor: Colors.white,
//                                 backgroundColor: Colors.orange.shade500,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(15.0),
//                                 ),
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   if (edititemText == '' &&
//                                       _detailController.text == '' &&
//                                       _amountController.text == '' &&
//                                       _priceController.text == '' &&
//                                       editunit_id == '') {
//                                     showDialog(
//                                       context: context,
//                                       builder: (BuildContext dialogContext) {
//                                         return AlertDialog(
//                                           title: Icon(
//                                             Icons.info_outline,
//                                             size: 64,
//                                             color: Colors.red,
//                                           ),
//                                           content: Row(
//                                             mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                             children: [
//                                               Text(
//                                                 'กรุณากรอกข้อมูลให้ครบตามรายการ',
//                                                 style: GoogleFonts.openSans(),
//                                               ),
//                                             ],
//                                           ),
//                                           actions: <Widget>[
//                                             TextButton(
//                                               child: Text(
//                                                 'Colse',
//                                                 style: GoogleFonts.openSans(
//                                                   color: Colors.orange,
//                                                   fontSize: 16,
//                                                 ),
//                                               ),
//                                               onPressed: () {
//                                                 // Navigator.of(dialogContext).pop();
//                                                 Navigator.pop(context);
//                                               },
//                                             ),
//                                           ],
//                                         );
//                                       },
//                                     );
//                                   } else {
//                                     setState(() {
//                                       // addSaveItem(
//                                       //   selectItemId,
//                                       //   edititemText,
//                                       //   quantityT,
//                                       //   priceT,
//                                       //   editunit_id,
//                                       //   editunitText,
//                                       //   sumT,
//                                       //   _detail,
//                                       //   _itemdate,
//                                       // );
//                                       addItemId.add(selectItemId);
//                                       addItemDate.add(_itemdate);
//                                       addItemNote.add(_detail);
//                                       addItemQuantity.add(quantityT);
//                                       addItemPrice.add(priceT);
//                                       addItemUnit.add(editunit_id);
//
//                                       selectItemId = '';
//                                       edititemText = '';
//                                       _detailController.text = '';
//                                       _amountController.text = '';
//                                       _priceController.text = '';
//                                       editunit_id = '';
//                                       editunitText = '';
//                                       sumT = '';
//                                     });
//                                   }
//                                 });
//                               },
//                               child: Container(
//                                 padding: EdgeInsets.all(14),
//                                 width: double.infinity,
//                                 child: Center(
//                                   child: Text(
//                                     '+ Add Item',
//                                     style: GoogleFonts.openSans(fontSize: 16.0),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 16,
//                           ),
//                           Expanded(
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 foregroundColor: Colors.white,
//                                 backgroundColor: Colors.orange.shade500,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(15.0),
//                                 ),
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   Navigator.pop(context);
//                                   selectItemId = '';
//                                   edititemText = '';
//                                   _detailController.text = '';
//                                   _amountController.text = '';
//                                   _priceController.text = '';
//                                   editunitText = '';
//                                   sumT = '';
//                                 });
//                               },
//                               child: Container(
//                                 padding: EdgeInsets.all(14),
//                                 width: double.infinity,
//                                 child: Center(
//                                   child: Text(
//                                     'Close Item',
//                                     style: GoogleFonts.openSans(fontSize: 16.0),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _listItem() {
//     return Container(
//       color: Colors.white,
//       child: FractionallySizedBox(
//         // heightFactor: 0.8,
//         child: MaterialApp(
//           debugShowCheckedModeBanner: false,
//           home: Scaffold(
//             backgroundColor: Colors.grey.shade50,
//             appBar: AppBar(
//               backgroundColor: Colors.white,
//               title: Text(
//                 '',
//                 style: GoogleFonts.openSans(),
//               ),
//             ),
//             body: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: Column(
//                   children: List.generate(
//                     saveItem.length,
//                         (index) {
//                       return Column(
//                         children: [
//                           Card(
//                             elevation: 0,
//                             color: Colors.white,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child: ListTile(
//                               // title: Text(
//                               //   saveItem[index].itemItem ?? '',
//                               //   style: GoogleFonts.openSans(
//                               //     fontSize: 18.0,
//                               //     color: Colors.orange,
//                               //     fontWeight: FontWeight.bold,
//                               //   ),
//                               //   overflow: TextOverflow.ellipsis,
//                               //   maxLines: 1,
//                               // ),
//                               subtitle: Row(
//                                 children: [
//                                   Expanded(
//                                     child: Column(
//                                       mainAxisAlignment:
//                                       MainAxisAlignment.start,
//                                       crossAxisAlignment:
//                                       CrossAxisAlignment.start,
//                                       children: [
//                                         (saveItem[index].itemName == '')
//                                             ? Container()
//                                             : Column(
//                                           children: [
//                                             SizedBox(height: 8),
//                                             Text(
//                                               saveItem[index].itemName ??
//                                                   '',
//                                               style: GoogleFonts.openSans(
//                                                 fontSize: 18.0,
//                                                 color: Colors.orange,
//                                                 fontWeight:
//                                                 FontWeight.bold,
//                                               ),
//                                               overflow:
//                                               TextOverflow.ellipsis,
//                                               maxLines: 1,
//                                             ),
//                                           ],
//                                         ),
//                                         SizedBox(height: 8),
//                                         (saveItem[index].itemDate == '')
//                                             ? Container()
//                                             : Column(
//                                           children: [
//                                             Text(
//                                               'วันที่ : ${saveItem[index].itemDate ?? ''}',
//                                               style: GoogleFonts.openSans(
//                                                 fontSize: 14.0,
//                                                 color: Colors.black,
//                                                 fontWeight:
//                                                 FontWeight.bold,
//                                               ),
//                                             ),
//                                             SizedBox(height: 8),
//                                           ],
//                                         ),
//                                         Text(
//                                           "รายละเอียด : ${(saveItem[index].itemNote == '') ? '-' : saveItem[index].itemNote ?? ''}",
//                                           style: GoogleFonts.openSans(
//                                             fontSize: 14.0,
//                                             color: Colors.black,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                           overflow: TextOverflow.ellipsis,
//                                           maxLines: 2,
//                                         ),
//                                         SizedBox(height: 8),
//                                         Row(
//                                           children: [
//                                             Text(
//                                               "ปริมาณ : ${(saveItem[index].itemQuantity == '') ? '0' : saveItem[index].itemQuantity ?? '0'} ${(saveItem[index].unitDesc == '') ? 'unit' : saveItem[index].unitDesc ?? ''}",
//                                               style: GoogleFonts.openSans(
//                                                 fontSize: 14.0,
//                                                 color: Colors.black,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             SizedBox(width: 8),
//                                             Text(
//                                               "ราคา : ${(saveItem[index].itemPrice == '') ? '0' : saveItem[index].itemPrice ?? '0'} บาท",
//                                               style: GoogleFonts.openSans(
//                                                 fontSize: 14.0,
//                                                 color: Colors.black,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         SizedBox(height: 8),
//                                       ],
//                                     ),
//                                   ),
//                                   InkWell(
//                                       borderRadius: BorderRadius.circular(20),
//                                       splashColor: Colors.black12,
//                                       onTap: () {
//                                         setState(() {
//                                           saveItem.removeAt(index);
//                                           Navigator.pop(context);
//                                         });
//                                       },
//                                       child: Container(
//                                           alignment: Alignment.bottomRight,
//                                           height: 25,
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                             BorderRadius.circular(20),
//                                           ),
//                                           child: Icon(
//                                             Icons.delete_outline,
//                                             color: Colors.grey,
//                                             size: 30,
//                                           ))),
//                                 ],
//                               ),
//                               // Add more details as needed
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 16, right: 16),
//                             child: Divider(
//                               color: Colors.amber,
//                             ),
//                           ),
//                         ],
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//     // (widget.needTypeItem.type_id == '')
//     //     ?Column(
//     //   children: List.generate(
//     //     detailItem?.itemData.length??0,
//     //         (index) {
//     //       return Column(
//     //         children: [
//     //           Card(
//     //             elevation: 0,
//     //             color: Colors.white,
//     //             shape: RoundedRectangleBorder(
//     //               borderRadius: BorderRadius.circular(15),
//     //             ),
//     //             child: ListTile(
//     //               // title: Text(
//     //               //   saveItem[index].itemItem ?? '',
//     //               //   style: GoogleFonts.openSans(
//     //               //     fontSize: 18.0,
//     //               //     color: Colors.orange,
//     //               //     fontWeight: FontWeight.bold,
//     //               //   ),
//     //               //   overflow: TextOverflow.ellipsis,
//     //               //   maxLines: 1,
//     //               // ),
//     //               subtitle: Row(
//     //                 children: [
//     //                   Expanded(
//     //                     child: Column(
//     //                       mainAxisAlignment:
//     //                       MainAxisAlignment.start,
//     //                       crossAxisAlignment:
//     //                       CrossAxisAlignment.start,
//     //                       children: [
//     //                         (detailItem?.itemData[index].itemName == '')
//     //                             ? Container()
//     //                             : Column(
//     //                           children: [
//     //                             SizedBox(height: 8),
//     //                             Text(
//     //                               detailItem?.itemData[index].itemName ??
//     //                                   '',
//     //                               style: GoogleFonts.openSans(
//     //                                 fontSize: 18.0,
//     //                                 color: Colors.orange,
//     //                                 fontWeight:
//     //                                 FontWeight.bold,
//     //                               ),
//     //                               overflow:
//     //                               TextOverflow.ellipsis,
//     //                               maxLines: 1,
//     //                             ),
//     //                           ],
//     //                         ),
//     //                         SizedBox(height: 8),
//     //                         (detailItem?.itemData[index].itemDate == '')
//     //                             ?Container()
//     //                             :Column(
//     //                           children: [
//     //                             Text(
//     //                               'วันที่ : ${detailItem?.itemData[index].itemDate ?? ''}',
//     //                               style: GoogleFonts.openSans(
//     //                                 fontSize: 14.0,
//     //                                 color: Colors.black,
//     //                                 fontWeight: FontWeight.bold,
//     //                               ),
//     //                             ),
//     //                             SizedBox(height: 8),
//     //                           ],
//     //                         ),
//     //                         Text(
//     //                           "รายละเอียด : ${(detailItem?.itemData[index].itemNote == '') ? '-' : detailItem?.itemData[index].itemNote ?? ''}",
//     //                           style: GoogleFonts.openSans(
//     //                             fontSize: 14.0,
//     //                             color: Colors.black,
//     //                             fontWeight: FontWeight.bold,
//     //                           ),
//     //                           overflow: TextOverflow.ellipsis,
//     //                           maxLines: 2,
//     //                         ),
//     //                         SizedBox(height: 8),
//     //                         Row(
//     //                           children: [
//     //                             Text(
//     //                               "ปริมาณ : ${(detailItem?.itemData[index].itemQuantity == '') ? '0' : detailItem?.itemData[index].itemQuantity ?? '0'} ${(saveItem[index].unitDesc == '') ? 'unit' : saveItem[index].unitDesc ?? ''}",
//     //                               style: GoogleFonts.openSans(
//     //                                 fontSize: 14.0,
//     //                                 color: Colors.black,
//     //                                 fontWeight: FontWeight.bold,
//     //                               ),
//     //                             ),
//     //                             SizedBox(width: 8),
//     //                             Text(
//     //                               "ราคา : ${(detailItem?.itemData[index].itemPrice == '') ? '0' : detailItem?.itemData[index].itemPrice ?? '0'} บาท",
//     //                               style: GoogleFonts.openSans(
//     //                                 fontSize: 14.0,
//     //                                 color: Colors.black,
//     //                                 fontWeight: FontWeight.bold,
//     //                               ),
//     //                             ),
//     //                           ],
//     //                         ),
//     //                         SizedBox(height: 8),
//     //                       ],
//     //                     ),
//     //                   ),
//     //                   InkWell(
//     //                       borderRadius: BorderRadius.circular(20),
//     //                       splashColor: Colors.black12,
//     //                       onTap: () {
//     //                         setState(() {
//     //                           detailItem?.itemData.removeAt(index);
//     //                           Navigator.pop(context);
//     //                         });
//     //                       },
//     //                       child: Container(
//     //                           alignment: Alignment.bottomRight,
//     //                           height: 25,
//     //                           decoration: BoxDecoration(
//     //                             borderRadius:
//     //                             BorderRadius.circular(20),
//     //                           ),
//     //                           child: Icon(
//     //                             Icons.delete_outline,
//     //                             color: Colors.grey,
//     //                             size: 30,
//     //                           ))),
//     //                 ],
//     //               ),
//     //               // Add more details as needed
//     //             ),
//     //           ),
//     //           Padding(
//     //             padding: const EdgeInsets.only(left: 16, right: 16),
//     //             child: Divider(
//     //               color: Colors.amber,
//     //             ),
//     //           ),
//     //         ],
//     //       );
//     //     },
//     //   ),
//     // )
//     //     :
//   }
//
//   bool _isLoading = false;
//   Widget _bill() {
//     return Container(
//       color: Colors.white,
//       child: FractionallySizedBox(
//         heightFactor: 0.8,
//         child: MaterialApp(
//           debugShowCheckedModeBanner: false,
//           home: Scaffold(
//               backgroundColor: Colors.transparent,
//               appBar: AppBar(
//                 backgroundColor: Colors.white,
//                 title: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     InkWell(
//                       onTap: () => _pickImage(),
//                       child: Icon(
//                         Icons.camera_alt_outlined,
//                         color: Colors.black,
//                       ),
//                     ),
//                     Text(
//                       'บิล',
//                       style: GoogleFonts.openSans(),
//                     ),
//                     InkWell(
//                       onTap: () => getImages(),
//                       child: Icon(Icons.photo_album_outlined),
//                     ),
//                   ],
//                 ),
//               ),
//               body: selectedImages.isNotEmpty
//                   ? SingleChildScrollView(child: photoIn())
//                   : photoIn()
//             // floatingActionButton: Column(
//             //   mainAxisAlignment: MainAxisAlignment.center,
//             //   children: <Widget>[
//             //     _image == null
//             //         ? Text('No image selected.')
//             //         : Image.file(File(_image!.path)),
//             //     SizedBox(height: 20),
//             //     ElevatedButton(
//             //       onPressed: _pickImage,
//             //       child: Text('Capture Image'),
//             //     ),
//             //   ],
//             // ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   List<String> myList = [];
//   List<String> imageItem = [];
//
//   final CarouselController _carouselController = CarouselController();
//   int _currentIndex = 0;
//   Widget photoIn() {
//     return Column(
//       children: [
//         selectedImages.isNotEmpty
//             ? Column(
//           children: [
//             SizedBox(
//               height: 16,
//             ),
//             CarouselSlider.builder(
//               carouselController: _carouselController,
//               itemCount: selectedImages.length,
//               itemBuilder: (context, index, realIndex) {
//                 return Expanded(
//                   child: Column(
//                     children: [
//                       Expanded(
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15),
//                             border: Border.all(
//                               color: Colors.orange.shade300,
//                               width: 2.0,
//                             ),
//                           ),
//                           child: kIsWeb
//                               ? ClipRRect(
//                               borderRadius: BorderRadius.circular(12),
//                               child: Image.network(
//                                   selectedImages[index].path))
//                               : ClipRRect(
//                             borderRadius: BorderRadius.circular(12),
//                             child: Image.file(
//                               selectedImages[index],
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       (selectedImages.length <= 2)
//                           ? Container()
//                           : Row(
//                         children: List.generate(
//                             selectedImages.length, (indexImage) {
//                           final base64String = imageToBase64(
//                               selectedImages[indexImage].path);
//                           print(base64String);
//                           return Expanded(
//                             child: InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   _currentIndex = indexImage;
//                                 });
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius:
//                                   BorderRadius.circular(0),
//                                   border: Border.all(
//                                     color: (index == indexImage)
//                                         ? Colors.orange.shade500
//                                         : Colors.transparent,
//                                     width: 2.0,
//                                   ),
//                                 ),
//                                 child: kIsWeb
//                                     ? Image.network(
//                                   selectedImages[indexImage]
//                                       .path,
//                                   fit: BoxFit.cover,
//                                   height:
//                                   MediaQuery.of(context)
//                                       .size
//                                       .height *
//                                       0.08,
//                                 )
//                                     : Image.file(
//                                   selectedImages[indexImage],
//                                   fit: BoxFit.cover,
//                                   height:
//                                   MediaQuery.of(context)
//                                       .size
//                                       .height *
//                                       0.08,
//                                 ),
//                               ),
//                             ),
//                           );
//                         }),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//               options: CarouselOptions(
//                 height: MediaQuery.of(context).size.height * 0.64,
//                 autoPlay: false,
//                 autoPlayInterval: Duration(seconds: 3),
//                 enlargeCenterPage: true,
//                 aspectRatio: 16 / 9,
//                 viewportFraction:
//                 (selectedImages.length <= 2) ? 0.75 : 0.65,
//                 initialPage: _currentIndex,
//                 onPageChanged: (index, reason) {
//                   setState(() {
//                     _currentIndex = index;
//                   });
//                 },
//               ),
//             ),
//           ],
//         )
//             : Expanded(child: Center(child: Text('No images selected.'))),
//         SizedBox(
//           height: 4,
//         ),
//         Row(
//           children: [
//             Expanded(
//               child: InkWell(
//                 onTap: () {
//                   imageItem = myList;
//                   Navigator.pop(context);
//                 },
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 16, right: 16),
//                   child: Card(
//                     color: Colors.orange.shade500,
//                     child: Container(
//                       width: double.infinity,
//                       height: 50,
//                       alignment: Alignment.center,
//                       padding: EdgeInsets.all(16),
//                       child: Text(
//                         'SAVE',
//                         style: GoogleFonts.openSans(
//                           fontSize: 16.0,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: InkWell(
//                 onTap: () {
//                   selectedImages = [];
//                   myList = [];
//                   Navigator.pop(context);
//                 },
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 16, right: 16),
//                   child: Card(
//                     color: Colors.orange.shade500,
//                     child: Container(
//                       width: double.infinity,
//                       height: 50,
//                       alignment: Alignment.center,
//                       padding: EdgeInsets.all(16),
//                       child: Text(
//                         'Close',
//                         style: GoogleFonts.openSans(
//                           fontSize: 16.0,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 8,
//         ),
//       ],
//     );
//   }
//
//   Future<String> imageToBase64(String imagePath) async {
//     // Read the image file as bytes
//     final file = File(imagePath);
//     final imageBytes = await file.readAsBytes();
//
//     // Convert the bytes to a Base64 string
//     final base64String = base64Encode(imageBytes);
//
//     myList.add(base64String);
//     myList = myList.toSet().toList();
//     // Print the list for debugging purposes
//     print(myList);
//
//     return base64String;
//   }
//
//   final ImagePicker picker = ImagePicker();
//
//   void _pickImage() async {
//     setState(() {
//       _isLoading = true;
//     });
//     try {
//       final XFile? image = await picker.pickImage(source: ImageSource.camera);
//       if (image != null) {
//         setState(() {
//           selectedImages.add(File(image.path));
//           Navigator.pop(context);
//           setState(() {
//             showModalBottomSheet<void>(
//               barrierColor: Colors.black12,
//               backgroundColor: Colors.transparent,
//               context: context,
//               isScrollControlled: true,
//               builder: (BuildContext context) {
//                 return _bill();
//               },
//             );
//           });
//         });
//       }
//     } catch (e) {
//       print('Error picking image: $e');
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }
//
//   void openCamera(int num) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (_) {
//         return SafeArea(
//           child: Stack(
//             children: [
//               CameraCamera(
//                 onFile: (file) {
//                   Navigator.pop(context);
//                   selectedImages.add(file);
//                   if (num >= 1) {
//                     Navigator.pop(context);
//                   }
//                   setState(() {
//                     showModalBottomSheet<void>(
//                       barrierColor: Colors.black12,
//                       backgroundColor: Colors.transparent,
//                       context: context,
//                       isScrollControlled: true,
//                       builder: (BuildContext context) {
//                         return _bill();
//                       },
//                     );
//                   });
//                 },
//                 resolutionPreset: ResolutionPreset.veryHigh,
//                 enableAudio: true,
//                 flashModes: FlashMode.values,
//                 mode: CameraMode.ratio16s9,
//               ),
//               Positioned(
//                 child: Center(
//                   child:
//                   // Image.asset(
//                   //   'assets/images/logoOrigami/ogm_logo.png',
//                   //   height: 150,
//                   //   width: 150,
//                   // ),
//                   Container(
//                     padding: EdgeInsets.only(
//                         left: 150, right: 150, top: 280, bottom: 280),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(25),
//                       border: Border.all(
//                         color: Colors.white,
//                         width: 3.0,
//                       ),
//                     ),
//                     child: Text(
//                       '',
//                       style: GoogleFonts.openSans(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                         fontSize: 32,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }
//
//   void getImages() async {
//     final pickedFile = await picker.pickMultiImage(
//         requestFullMetadata: true,
//         imageQuality: 100,
//         maxHeight: 1000,
//         maxWidth: 1000);
//     List<XFile> xfilePick = pickedFile;
//
//     setState(
//           () {
//         if (xfilePick.isNotEmpty) {
//           for (var i = 0; i < xfilePick.length; i++) {
//             selectedImages.add(
//               File(xfilePick[i].path),
//             );
//             Navigator.pop(context);
//             setState(() {
//               showModalBottomSheet<void>(
//                 barrierColor: Colors.black12,
//                 backgroundColor: Colors.transparent,
//                 context: context,
//                 isScrollControlled: true,
//                 builder: (BuildContext context) {
//                   return _bill();
//                 },
//               );
//             });
//           }
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             // is this context <<<
//             SnackBar(
//               content: Text(
//                 'Nothing is selected',
//                 style: GoogleFonts.openSans(),
//               ),
//             ),
//           );
//         }
//       },
//     );
//   }
//
//   //fillter
//   List<ProjectData> projectOption = [];
//   List<ProjectData> projectList = [];
//   int int_project = 0;
//   bool is_project = false;
//   String? project_number = "";
//   String? project_name = "";
//   Future<void> fetchProject(project_number, project_name) async {
//     final uri = Uri.parse(
//         'https://www.origami.life/api/origami/need/project.php?page=$project_number&search=$project_name');
//     try {
//       final response = await http.post(
//         uri,
//         body: {
//           'comp_id': widget.employee.comp_id,
//           'emp_id': widget.employee.emp_id,
//         },
//       );
//       if (response.statusCode == 200) {
//         final jsonResponse = jsonDecode(response.body);
//         if (jsonResponse['status'] == true) {
//           final List<dynamic> projectJson = jsonResponse['project_data'];
//           setState(() {
//             final projectRespond = ProjectRespond.fromJson(jsonResponse);
//             int_project = projectRespond.next_page_number ?? 0;
//             is_project = projectRespond.next_page ?? false;
//             projectOption = projectJson
//                 .map(
//                   (json) => ProjectData.fromJson(json),
//             )
//                 .toList();
//             projectList = projectOption;
//           });
//         } else {
//           throw Exception(
//               'Failed to load personal data: ${jsonResponse['message']}');
//         }
//       } else {
//         throw Exception(
//             'Failed to load personal data: ${response.reasonPhrase}');
//       }
//     } catch (e) {
//       throw Exception('Failed to load personal data: $e');
//     }
//   }
//
//   List<AccountData> accountOption = [];
//   int int_account = 0;
//   bool is_account = false;
//   String? account_number = "";
//   String? account_name = "";
//   Future<void> fetchAccount(account_number, account_name) async {
//     final uri = Uri.parse(
//         'https://www.origami.life/api/origami/need/account.php?page=$account_number&search=$account_name');
//     try {
//       final response = await http.post(
//         uri,
//         body: {
//           'comp_id': widget.employee.comp_id,
//           'emp_id': widget.employee.emp_id,
//         },
//       );
//       if (response.statusCode == 200) {
//         final jsonResponse = jsonDecode(response.body);
//         if (jsonResponse['status'] == true) {
//           final List<dynamic> accountJson = jsonResponse['account_data'];
//           final accountRespond = AccountRespond.fromJson(jsonResponse);
//           int_account = accountRespond.next_page_number ?? 0;
//           setState(() {
//             accountOption = accountJson
//                 .map(
//                   (json) => AccountData.fromJson(json),
//             )
//                 .toList();
//           });
//         } else {
//           throw Exception(
//               'Failed to load personal data: ${jsonResponse['message']}');
//         }
//       } else {
//         throw Exception(
//             'Failed to load personal data: ${response.reasonPhrase}');
//       }
//     } catch (e) {
//       throw Exception('Failed to load personal data: $e');
//     }
//   }
//
//   List<ContactData> contactOption = [];
//   int int_contact = 0;
//   bool is_contact = false;
//   String? contact_number = "";
//   String? contact_name = "";
//   Future<void> fetchContact(contact_number, contact_name) async {
//     final uri = Uri.parse(
//         'https://www.origami.life/api/origami/need/contact.php?page=$contact_number&search=$contact_name');
//     try {
//       final response = await http.post(
//         uri,
//         body: {
//           'comp_id': widget.employee.comp_id,
//           'emp_id': widget.employee.emp_id,
//         },
//       );
//       if (response.statusCode == 200) {
//         final jsonResponse = jsonDecode(response.body);
//         if (jsonResponse['status'] == true) {
//           final List<dynamic> contactJson = jsonResponse['contact_data'];
//           final contactRespond = AccountRespond.fromJson(jsonResponse);
//           int_contact = contactRespond.next_page_number ?? 0;
//           setState(() {
//             contactOption = contactJson
//                 .map(
//                   (json) => ContactData.fromJson(json),
//             )
//                 .toList();
//           });
//         } else {
//           throw Exception(
//               'Failed to load personal data: ${jsonResponse['message']}');
//         }
//       } else {
//         throw Exception(
//             'Failed to load personal data: ${response.reasonPhrase}');
//       }
//     } catch (e) {
//       throw Exception('Failed to load personal data: $e');
//     }
//   }
//
//   List<DepartmentData> departmentOption = [];
//   int int_department = 0;
//   bool is_department = false;
//   String? department_number = "";
//   String? department_name = "";
//   Future<void> fetchDepartment(department_number, department_name) async {
//     final uri = Uri.parse(
//         'https://www.origami.life/api/origami/need/department.php?page=$department_number&search=$department_name');
//     try {
//       final response = await http.post(
//         uri,
//         body: {
//           'comp_id': widget.employee.comp_id,
//           'emp_id': widget.employee.emp_id,
//         },
//       );
//       if (response.statusCode == 200) {
//         final jsonResponse = jsonDecode(response.body);
//         if (jsonResponse['status'] == true) {
//           final List<dynamic> departmentJson = jsonResponse['department_data'];
//           final departmentRespond = DepartmentRespond.fromJson(jsonResponse);
//           int_department = departmentRespond.next_page_number ?? 0;
//           setState(() {
//             departmentOption = departmentJson
//                 .map(
//                   (json) => DepartmentData.fromJson(json),
//             )
//                 .toList();
//           });
//         } else {
//           throw Exception(
//               'Failed to load personal data: ${jsonResponse['message']}');
//         }
//       } else {
//         throw Exception(
//             'Failed to load personal data: ${response.reasonPhrase}');
//       }
//     } catch (e) {
//       throw Exception('Failed to load personal data: $e');
//     }
//   }
//
//   List<AssetData> assetOption = [];
//   int int_asset = 0;
//   String page_asset = '';
//   bool is_asset = false;
//   String? asset_number = "";
//   String? asset_name = "";
//   Future<void> fetchAsset(asset_number, asset_name) async {
//     final uri = Uri.parse(
//         'https://www.origami.life/api/origami/need/asset.php?page=$asset_number&search=$asset_name');
//     try {
//       final response = await http.post(
//         uri,
//         body: {
//           'comp_id': widget.employee.comp_id,
//           'emp_id': widget.employee.emp_id,
//         },
//       );
//       if (response.statusCode == 200) {
//         final jsonResponse = jsonDecode(response.body);
//         if (jsonResponse['status'] == true) {
//           final List<dynamic> assetJson = jsonResponse['asset_data'];
//           final assetRespond = AssetRespond.fromJson(jsonResponse);
//           int_asset = assetRespond.next_page_number ?? 0;
//           setState(() {
//             assetOption = assetJson
//                 .map(
//                   (json) => AssetData.fromJson(json),
//             )
//                 .toList();
//           });
//         } else {
//           throw Exception(
//               'Failed to load personal data: ${jsonResponse['message']}');
//         }
//       } else {
//         throw Exception(
//             'Failed to load personal data: ${response.reasonPhrase}');
//       }
//     } catch (e) {
//       throw Exception('Failed to load personal data: $e');
//     }
//   }
//
//   List<DivisionData> DivisionOption = [];
//   int int_division = 0;
//   String page_division = '';
//   bool is_division = false;
//   String? division_number = "";
//   String? division_name = "";
//   Future<void> fetchDivision(division_number, division_name) async {
//     final uri = Uri.parse(
//         'https://www.origami.life/api/origami/need/division.php?page=$division_number&search=$division_name');
//     try {
//       final response = await http.post(
//         uri,
//         body: {
//           'comp_id': widget.employee.comp_id,
//           'emp_id': widget.employee.emp_id,
//         },
//       );
//       if (response.statusCode == 200) {
//         final jsonResponse = jsonDecode(response.body);
//         if (jsonResponse['status'] == true) {
//           final List<dynamic> divisionJson = jsonResponse['division_data'];
//           final divisionRespond = DivisionRespond.fromJson(jsonResponse);
//           int_division = divisionRespond.next_page_number ?? 0;
//           setState(() {
//             DivisionOption = divisionJson
//                 .map(
//                   (json) => DivisionData.fromJson(json),
//             )
//                 .toList();
//           });
//         } else {
//           throw Exception(
//               'Failed to load personal data: ${jsonResponse['message']}');
//         }
//       } else {
//         throw Exception(
//             'Failed to load personal data: ${response.reasonPhrase}');
//       }
//     } catch (e) {
//       throw Exception('Failed to load personal data: $e');
//     }
//   }
//
//   List<EmployeeData> employeeOption = [];
//   int int_employee = 0;
//   String page_employee = '';
//   bool is_employee = false;
//   String? employee_number = "";
//   String? employee_name = "";
//   Future<void> fetchEmployee(employee_number, employee_name) async {
//     final uri = Uri.parse(
//         'https://www.origami.life/api/origami/need/employee.php?page=$employee_number&search=$employee_name');
//     try {
//       final response = await http.post(
//         uri,
//         body: {
//           'comp_id': widget.employee.comp_id,
//           'emp_id': widget.employee.emp_id,
//         },
//       );
//       if (response.statusCode == 200) {
//         final jsonResponse = jsonDecode(response.body);
//         if (jsonResponse['status'] == true) {
//           final List<dynamic> employeeJson = jsonResponse['employee_data'];
//           final employeeRespond = EmployeeRespond.fromJson(jsonResponse);
//           int_employee = employeeRespond.next_page_number ?? 0;
//           setState(() {
//             employeeOption = employeeJson
//                 .map(
//                   (json) => EmployeeData.fromJson(json),
//             )
//                 .toList();
//           });
//         } else {
//           throw Exception(
//               'Failed to load personal data: ${jsonResponse['message']}');
//         }
//       } else {
//         throw Exception(
//             'Failed to load personal data: ${response.reasonPhrase}');
//       }
//     } catch (e) {
//       throw Exception('Failed to load personal data: $e');
//     }
//   }
//
//   List<ItemData> itemOption = [];
//   int int_item = 0;
//   String page_item = '';
//   bool is_item = false;
//   String? item_number = "";
//   String? item_name = "";
//   String? Item_type_id = "";
//   Future<void> fetchItem(item_number, item_name) async {
//     final uri = Uri.parse(
//         'https://www.origami.life/api/origami/need/item.php?page=$item_number&search=$item_name&need_type=$Item_type_id');
//     try {
//       final response = await http.post(
//         uri,
//         body: {
//           'comp_id': widget.employee.comp_id,
//           'emp_id': widget.employee.emp_id,
//         },
//       );
//       if (response.statusCode == 200) {
//         final jsonResponse = jsonDecode(response.body);
//         if (jsonResponse['status'] == true) {
//           final List<dynamic> itemJson = jsonResponse['item_data'];
//           final itemRespond = ItemRespond.fromJson(jsonResponse);
//           int_item = itemRespond.next_page_number ?? 0;
//           setState(() {
//             itemOption = itemJson
//                 .map(
//                   (json) => ItemData.fromJson(json),
//             )
//                 .toList();
//           });
//         } else {
//           throw Exception(
//               'Failed to load personal data: ${jsonResponse['message']}');
//         }
//       } else {
//         throw Exception(
//             'Failed to load personal data: ${response.reasonPhrase}');
//       }
//     } catch (e) {
//       throw Exception('Failed to load personal data: $e');
//     }
//   }
//
//   List<UnitData> unitOption = [];
//   int int_unit = 0;
//   String page_unit = '';
//   bool is_unit = false;
//   String? unit_number = "";
//   String? unit_name = "";
//   Future<void> fetchUnit(unit_number, unit_name) async {
//     final uri = Uri.parse(
//         'https://www.origami.life/api/origami/need/unit.php?page=$unit_number&search=$unit_name');
//     try {
//       final response = await http.post(
//         uri,
//         body: {
//           'comp_id': widget.employee.comp_id,
//           'emp_id': widget.employee.emp_id,
//         },
//       );
//       if (response.statusCode == 200) {
//         final jsonResponse = jsonDecode(response.body);
//         if (jsonResponse['status'] == true) {
//           final List<dynamic> unitJson = jsonResponse['unit_data'];
//           final unitRespond = UnitRespond.fromJson(jsonResponse);
//           int_unit = unitRespond.next_page_number ?? 0;
//           setState(() {
//             unitOption = unitJson
//                 .map(
//                   (json) => UnitData.fromJson(json),
//             )
//                 .toList();
//           });
//         } else {
//           throw Exception(
//               'Failed to load personal data: ${jsonResponse['message']}');
//         }
//       } else {
//         throw Exception(
//             'Failed to load personal data: ${response.reasonPhrase}');
//       }
//     } catch (e) {
//       throw Exception('Failed to load personal data: $e');
//     }
//   }
//
//   // PriorityRespond
//   List<PriorityData> priorityOption = [];
//   int int_priority = 0;
//   bool is_priority = false;
//   String? priority_number = "";
//   String? priority_name = "";
//   Future<void> fetchPriority(priority_number, priority_name) async {
//     final uri = Uri.parse(
//         'https://www.origami.life/api/origami/need/priority.php?page=$priority_number&search=$priority_name');
//     try {
//       final response = await http.post(
//         uri,
//         body: {
//           'comp_id': widget.employee.comp_id,
//           'emp_id': widget.employee.emp_id,
//         },
//       );
//       if (response.statusCode == 200) {
//         final jsonResponse = jsonDecode(response.body);
//         if (jsonResponse['status'] == true) {
//           final List<dynamic> priorityJson = jsonResponse['priority_data'];
//           final priorityRespond = PriorityRespond.fromJson(jsonResponse);
//           int_priority = priorityRespond.next_page_number ?? 0;
//           setState(() {
//             priorityOption = priorityJson
//                 .map(
//                   (json) => PriorityData.fromJson(json),
//             )
//                 .toList();
//           });
//         } else {
//           throw Exception(
//               'Failed to load personal data: ${jsonResponse['message']}');
//         }
//       } else {
//         throw Exception(
//             'Failed to load personal data: ${response.reasonPhrase}');
//       }
//     } catch (e) {
//       throw Exception('Failed to load personal data: $e');
//     }
//   }
//
//   List<String> addItemId = [];
//   List<String> addItemDate = [];
//   List<String> addItemNote = [];
//   List<String> addItemQuantity = [];
//   List<String> addItemPrice = [];
//   List<String> addItemUnit = [];
//   List<String> SaveItemId = [];
//   List<String> SaveItemDate = [];
//   List<String> SaveItemNote = [];
//   List<String> SaveItemQuantity = [];
//   List<String> SaveItemPrice = [];
//   List<String> SaveItemUnit = [];
//
//   Future<void> fetchSave(
//       need_subject,
//       priority_id,
//       need_reason,
//       effective_date,
//       department_id,
//       division_id,
//       need_payto,
//       project_id,
//       asset_id,
//       account_id,
//       contact_id,
//       // need_item,
//       image_item,
//       item_id,
//       item_date,
//       item_note,
//       item_quantity,
//       item_price,
//       item_unit,
//       ) async {
//     final uri = Uri.parse('https://www.origami.life/api/origami/need/save.php');
//     String jsonImage = jsonEncode(image_item);
//     String jsonItemId = jsonEncode(item_id);
//     String jsonItemDate = jsonEncode(item_date);
//     String jsonItemNote = jsonEncode(item_note);
//     String jsonItemQuantity = jsonEncode(item_quantity);
//     String jsonItemPrice = jsonEncode(item_price);
//     String jsonItemUnit = jsonEncode(item_unit);
//
//     try {
//       final response = await http.post(
//         uri,
//         body: {
//           'comp_id': widget.employee.comp_id,
//           'emp_id': widget.employee.emp_id,
//           'request_id': widget.request_id,
//           'need_type': widget.needTypeItem.type_id,
//           'need_subject': '$need_subject',
//           'priority_id': '$priority_id',
//           'need_reason': '$need_reason',
//           'effective_date': '$effective_date',
//           'department_id': '$department_id',
//           'division_id': '$division_id',
//           'need_payto': '$need_payto',
//           'project_id': '$project_id',
//           'asset_id': '$asset_id',
//           'account_id': '$account_id',
//           'contact_id': '$contact_id',
//           // 'need_item': need_item,
//           // 'image_item': '$jsonImage',
//           // 'item_id': '$jsonItemId',
//           // 'item_date': '$jsonItemDate',
//           // 'item_note': '$jsonItemNote',
//           // 'item_quantity':'$jsonItemQuantity',
//           // 'item_price': '$jsonItemPrice',
//           // 'item_unit': '$jsonItemUnit',
//         },
//       );
//       if (response.statusCode == 200) {
//         final jsonResponse = jsonDecode(response.body);
//         if (jsonResponse['status'] == true) {
//           final List<dynamic> priorityJson = jsonResponse['priority_data'];
//           final priorityRespond = PriorityRespond.fromJson(jsonResponse);
//           int_priority = priorityRespond.next_page_number ?? 0;
//           setState(() {
//             priorityOption = priorityJson
//                 .map(
//                   (json) => PriorityData.fromJson(json),
//             )
//                 .toList();
//           });
//         } else {
//           throw Exception(
//               'Failed to load personal data: ${jsonResponse['message']}');
//         }
//       } else {
//         throw Exception(
//             'Failed to load personal data: ${response.reasonPhrase}');
//       }
//     } catch (e) {
//       throw Exception('Failed to load personal data: $e');
//     }
//   }
// }
//
// //***************** filter ******************//
// class ProjectRespond {
//   final int? project_count;
//   final bool? next_page; //
//   final int? next_page_number;
//   final List<ProjectData>? project_data;
//
//   ProjectRespond({
//     this.project_count,
//     this.next_page,
//     this.next_page_number,
//     this.project_data,
//   });
//
//   factory ProjectRespond.fromJson(Map<String, dynamic> json) {
//     return ProjectRespond(
//       project_count: json['project_count'],
//       next_page: json['next_page'],
//       next_page_number: json['next_page_number'],
//       project_data: (json['project_data'] as List<dynamic>?)
//           ?.map(
//             (e) => ProjectData.fromJson(e),
//       )
//           .toList(),
//     );
//   }
// }
//
// class ProjectData {
//   final String? project_id;
//   final String? project_name;
//
//   ProjectData({
//     this.project_id,
//     this.project_name,
//   });
//
//   factory ProjectData.fromJson(Map<String, dynamic> json) {
//     return ProjectData(
//       project_id: json['project_id'],
//       project_name: json['project_name'],
//     );
//   }
// }
//
// class AccountRespond {
//   final int? account_count;
//   final bool? next_page; //
//   final int? next_page_number;
//   final List<AccountData>? account_data;
//
//   AccountRespond({
//     this.account_count,
//     this.next_page,
//     this.next_page_number,
//     this.account_data,
//   });
//
//   factory AccountRespond.fromJson(Map<String, dynamic> json) {
//     return AccountRespond(
//       account_count: json['account_count'],
//       next_page: json['next_page'],
//       next_page_number: json['next_page_number'],
//       account_data: (json['account_data'] as List<dynamic>?)
//           ?.map(
//             (e) => AccountData.fromJson(e),
//       )
//           .toList(),
//     );
//   }
// }
//
// class AccountData {
//   final String? account_id;
//   final String? account_name;
//
//   AccountData({
//     this.account_id,
//     this.account_name,
//   });
//
//   factory AccountData.fromJson(Map<String, dynamic> json) {
//     return AccountData(
//       account_id: json['account_id'],
//       account_name: json['account_name'],
//     );
//   }
// }
//
// class ContactRespond {
//   final int? contact_count;
//   final bool? next_page; //
//   final int? next_page_number;
//   final List<ContactData>? contact_data;
//
//   ContactRespond({
//     this.contact_count,
//     this.next_page,
//     this.next_page_number,
//     this.contact_data,
//   });
//
//   factory ContactRespond.fromJson(Map<String, dynamic> json) {
//     return ContactRespond(
//       contact_count: json['contact_count'],
//       next_page: json['next_page'],
//       next_page_number: json['next_page_number'],
//       contact_data: (json['contact_data'] as List<dynamic>?)
//           ?.map(
//             (e) => ContactData.fromJson(e),
//       )
//           .toList(),
//     );
//   }
// }
//
// class ContactData {
//   final String? contact_id;
//   final String? contact_name;
//
//   ContactData({
//     this.contact_id,
//     this.contact_name,
//   });
//
//   factory ContactData.fromJson(Map<String, dynamic> json) {
//     return ContactData(
//       contact_id: json['contact_id'],
//       contact_name: json['contact_name'],
//     );
//   }
// }
//
// class DepartmentRespond {
//   final int? department_count;
//   final bool? next_page;
//   final int? next_page_number;
//   final List<DepartmentData>? department_data;
//
//   DepartmentRespond({
//     this.department_count,
//     this.next_page,
//     this.next_page_number,
//     this.department_data,
//   });
//
//   factory DepartmentRespond.fromJson(Map<String, dynamic> json) {
//     return DepartmentRespond(
//       department_count: json['department_count'],
//       next_page: json['next_page'],
//       next_page_number: json['next_page_number'],
//       department_data: (json['department_data'] as List<dynamic>?)
//           ?.map(
//             (e) => DepartmentData.fromJson(e),
//       )
//           .toList(),
//     );
//   }
// }
//
// class DepartmentData {
//   final String? department_id;
//   final String? department_name;
//
//   DepartmentData({
//     this.department_id,
//     this.department_name,
//   });
//
//   factory DepartmentData.fromJson(Map<String, dynamic> json) {
//     return DepartmentData(
//       department_id: json['department_id'],
//       department_name: json['department_name'],
//     );
//   }
// }
//
// class AssetRespond {
//   final int? asset_count;
//   final bool? next_page; //
//   final int? next_page_number;
//   final List<AssetData>? asset_data;
//
//   AssetRespond({
//     this.asset_count,
//     this.next_page,
//     this.next_page_number,
//     this.asset_data,
//   });
//
//   factory AssetRespond.fromJson(Map<String, dynamic> json) {
//     return AssetRespond(
//       asset_count: json['asset_count'],
//       next_page: json['next_page'],
//       next_page_number: json['next_page_number'],
//       asset_data: (json['asset_data'] as List<dynamic>?)
//           ?.map(
//             (e) => AssetData.fromJson(e),
//       )
//           .toList(),
//     );
//   }
// }
//
// class AssetData {
//   final String? asset_id;
//   final String? asset_name;
//
//   AssetData({
//     this.asset_id,
//     this.asset_name,
//   });
//
//   factory AssetData.fromJson(Map<String, dynamic> json) {
//     return AssetData(
//       asset_id: json['asset_id'],
//       asset_name: json['asset_name'],
//     );
//   }
// }
//
// class DivisionRespond {
//   final int? division_count;
//   final bool? next_page; //
//   final int? next_page_number;
//   final List<DivisionData>? division_data;
//
//   DivisionRespond({
//     this.division_count,
//     this.next_page,
//     this.next_page_number,
//     this.division_data,
//   });
//
//   factory DivisionRespond.fromJson(Map<String, dynamic> json) {
//     return DivisionRespond(
//       division_count: json['division_count'],
//       next_page: json['next_page'],
//       next_page_number: json['next_page_number'],
//       division_data: (json['division_data'] as List<dynamic>?)
//           ?.map(
//             (e) => DivisionData.fromJson(e),
//       )
//           .toList(),
//     );
//   }
// }
//
// class DivisionData {
//   final String? division_id;
//   final String? division_name;
//
//   DivisionData({
//     this.division_id,
//     this.division_name,
//   });
//
//   factory DivisionData.fromJson(Map<String, dynamic> json) {
//     return DivisionData(
//       division_id: json['division_id'],
//       division_name: json['division_name'],
//     );
//   }
// }
//
// class EmployeeRespond {
//   final int? employee_count;
//   final bool? next_page; //
//   final int? next_page_number;
//   final List<EmployeeData>? employee_data;
//
//   EmployeeRespond({
//     this.employee_count,
//     this.next_page,
//     this.next_page_number,
//     this.employee_data,
//   });
//
//   factory EmployeeRespond.fromJson(Map<String, dynamic> json) {
//     return EmployeeRespond(
//       employee_count: json['employee_count'],
//       next_page: json['next_page'],
//       next_page_number: json['next_page_number'],
//       employee_data: (json['employee_data'] as List<dynamic>?)
//           ?.map(
//             (e) => EmployeeData.fromJson(e),
//       )
//           .toList(),
//     );
//   }
// }
//
// class EmployeeData {
//   final String? employee_id;
//   final String? employee_name;
//
//   EmployeeData({
//     this.employee_id,
//     this.employee_name,
//   });
//
//   factory EmployeeData.fromJson(Map<String, dynamic> json) {
//     return EmployeeData(
//       employee_id: json['employee_id'],
//       employee_name: json['employee_name'],
//     );
//   }
// }
//
// class ItemRespond {
//   final int? item_count;
//   final String? return_date;
//   final String? request_item_date;
//   final bool? next_page; //
//   final int? next_page_number;
//   final List<ItemData>? item_data;
//
//   ItemRespond({
//     this.item_count,
//     this.return_date,
//     this.request_item_date,
//     this.next_page,
//     this.next_page_number,
//     this.item_data,
//   });
//
//   factory ItemRespond.fromJson(Map<String, dynamic> json) {
//     return ItemRespond(
//       item_count: json['item_count'],
//       return_date: json['return_date'],
//       request_item_date: json['request_item_date'],
//       next_page: json['next_page'],
//       next_page_number: json['next_page_number'],
//       item_data: (json['item_data'] as List<dynamic>?)
//           ?.map(
//             (e) => ItemData.fromJson(e),
//       )
//           .toList(),
//     );
//   }
// }
//
// class ItemData {
//   final String? item_id;
//   final String? item_name;
//
//   ItemData({
//     this.item_id,
//     this.item_name,
//   });
//
//   factory ItemData.fromJson(Map<String, dynamic> json) {
//     return ItemData(
//       item_id: json['item_id'],
//       item_name: json['item_name'],
//     );
//   }
// }
//
// class UnitRespond {
//   final int? unit_count;
//   final bool? next_page; //
//   final int? next_page_number;
//   final List<UnitData>? unit_data;
//
//   UnitRespond({
//     this.unit_count,
//     this.next_page,
//     this.next_page_number,
//     this.unit_data,
//   });
//
//   factory UnitRespond.fromJson(Map<String, dynamic> json) {
//     return UnitRespond(
//       unit_count: json['unit_count'],
//       next_page: json['next_page'],
//       next_page_number: json['next_page_number'],
//       unit_data: (json['unit_data'] as List<dynamic>?)
//           ?.map(
//             (e) => UnitData.fromJson(e),
//       )
//           .toList(),
//     );
//   }
// }
//
// class UnitData {
//   final String? unit_id;
//   final String? unit_name;
//
//   UnitData({
//     this.unit_id,
//     this.unit_name,
//   });
//
//   factory UnitData.fromJson(Map<String, dynamic> json) {
//     return UnitData(
//       unit_id: json['unit_id'],
//       unit_name: json['unit_name'],
//     );
//   }
// }
//
// class PriorityRespond {
//   final int? priority_count;
//   final bool? next_page; //
//   final int? next_page_number;
//   final List<PriorityData>? priority_data;
//
//   PriorityRespond({
//     this.priority_count,
//     this.next_page,
//     this.next_page_number,
//     this.priority_data,
//   });
//
//   factory PriorityRespond.fromJson(Map<String, dynamic> json) {
//     return PriorityRespond(
//       priority_count: json['priority_count'],
//       next_page: json['next_page'],
//       next_page_number: json['next_page_number'],
//       priority_data: (json['priority_data'] as List<dynamic>?)
//           ?.map(
//             (e) => PriorityData.fromJson(e),
//       )
//           .toList(),
//     );
//   }
// }
//
// class PriorityData {
//   final String? priority_id;
//   final String? priority_name;
//
//   PriorityData({
//     this.priority_id,
//     this.priority_name,
//   });
//
//   factory PriorityData.fromJson(Map<String, dynamic> json) {
//     return PriorityData(
//       priority_id: json['priority_id'],
//       priority_name: json['priority_name'],
//     );
//   }
// }
//
// class SaveItem {
//   final String? dateItem;
//   final String? itemItem;
//   final String? assetItem;
//   final String? detailsItem;
//   final String? amountItem;
//   final String? unitItem;
//   final String? priceItem;
//
//   SaveItem({
//     this.dateItem,
//     this.itemItem,
//     this.assetItem,
//     this.detailsItem,
//     this.amountItem,
//     this.unitItem,
//     this.priceItem,
//   });
// }
