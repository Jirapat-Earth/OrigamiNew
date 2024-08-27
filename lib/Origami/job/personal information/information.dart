import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/cupertino.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';

import '../job.dart';

class Information extends StatefulWidget {
  Information({super.key, required this.personal, required this.personalList});
  final PersonalData? personal;
  final List<PersonalData>? personalList;
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  bool _isLoading = true;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 1;
  }

  @override
  void dispose() {
    super.dispose();
  }

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Personal Information',
          style: GoogleFonts.openSans(
            fontSize: 20,
            color: Colors.black,
            // fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: condition(),
      // bottomNavigationBar: BottomBarInspiredInside(
      //   items: [
      //     TabItem(
      //       icon: Icons.check,
      //       title: 'Interrested',
      //     ),
      //     TabItem(
      //       icon: Icons.list_alt,
      //       title: 'Origami',
      //     ),
      //     TabItem(
      //       icon: Icons.close,
      //       title: 'Not Interrested',
      //     ),
      //   ],
      //   colorSelected: Colors.white,
      //   backgroundColor: Colors.white,
      //   color: Colors.amber,
      //   indexSelected: _selectedIndex,
      //   onTap: _onItemTapped,
      //   chipStyle: const ChipStyle(convexBridge: true),
      //   itemStyle: ItemStyle.hexagon,
      //   // chipStyle:const ChipStyle(drawHexagon: true),
      //   // itemStyle: ItemStyle.circle,
      //   animated: false,
      // ),
    );
  }

  Widget condition() {
    return persernalData();
  }

  final CarouselController _carouselController = CarouselController();
  Widget persernalData() {
    return Stack(
      alignment: Alignment.center,
      children: [
        CarouselSlider.builder(
          carouselController: _carouselController,
          itemCount: 5,
          options: CarouselOptions(
            height: double.infinity,
            initialPage: _currentIndex,
            viewportFraction: 1,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) {
            return Stack(
              children: [
                // Image
                Container(
                  margin: EdgeInsets.all(1.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    child: Stack(
                      children: [
                        _showSlide(),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            // width: double.infinity,
                            padding: EdgeInsets.only(
                                top: 220, left: 1000, right: 1000),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.transparent, Colors.black],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0.7, 1],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Click left-right
                Positioned.fill(
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            _carouselController.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                          child: Container(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            _carouselController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                          child: Container(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Name and other details
                Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Spacer(),
                      _buildOther(widget.personal, itemIndex),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        Positioned(
          top: 16,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedSmoothIndicator(
              activeIndex: _currentIndex,
              count: 5,
              effect: ScrollingDotsEffect(
                activeDotColor: Colors.amber,
                dotColor: Colors.white,
                dotWidth: 35,
                dotHeight: 10,
                spacing: 16,
              ),
              onDotClicked: (index) {
                _carouselController.animateToPage(index);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _showSlide() {
    return Image.network(
      ("${widget.personal?.profileAvatar ?? ''}"),
      // 'assets/images/celebrity/bella6.jpg',
      fit: BoxFit.fill,
      height: double.infinity,
    );
  }

  Widget _buildName(List<EducationData> eduData, int itemIndex) {
    return (itemIndex == 0)
        ? Container(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'ชื่อ : ',
                    style: GoogleFonts.openSans(color: Colors.white, fontSize: 20),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        setState(
                          () {
                            showModalBottomSheet<void>(
                              barrierColor: Colors.black12,
                              backgroundColor: Colors.transparent,
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return _showModal(itemIndex);
                              },
                            );
                          },
                        );
                      },
                      icon: Icon(
                        Icons.expand_circle_down,
                        size: 35,
                        color: Colors.white,
                      ))
                ],
              ),
              Text(
                'ที่อยู่ : ',
                style: GoogleFonts.openSans(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'น้ำหนัก :  ส่วนสูง : ',
                style: GoogleFonts.openSans(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ))
        : (itemIndex == 1)
            ? Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ระดับการศึกษา : aa',
                      style: GoogleFonts.openSans(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'คณะ : ',
                      style: GoogleFonts.openSans(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'มหาวิทยาลัย : ',
                      style: GoogleFonts.openSans(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            : (itemIndex == 2)
                ? Container(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'สถานะการทำงาน :}',
                        style: GoogleFonts.openSans(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Have no experience',
                        style: GoogleFonts.openSans(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ))
                : (itemIndex == 3)
                    ? Container(
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ทักษะความสามารถ : ',
                            style: GoogleFonts.openSans(
                              fontSize: 18.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'ภาษา.....',style: GoogleFonts.openSans(color: Color(0xFF555555),),
                          ),
                        ],
                      ))
                    : (itemIndex == 4)
                        ? Container(
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'กรุ๊ปเลือด :',
                                    style: GoogleFonts.openSans(
                                      fontSize: 18.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {
                                        setState(
                                          () {
                                            showModalBottomSheet<void>(
                                              barrierColor: Colors.black12,
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              isScrollControlled: true,
                                              builder: (BuildContext context) {
                                                return _showModal(itemIndex);
                                              },
                                            );
                                          },
                                        );
                                      },
                                      icon: Icon(
                                        Icons.expand_circle_down,
                                        size: 35,
                                        color: Colors.white,
                                      ))
                                ],
                              ),
                              Text(
                                'สถานะ : ',
                                style: GoogleFonts.openSans(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ))
                        : Container(
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'ชื่อ : ',
                                    style: GoogleFonts.openSans(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.expand_circle_down,
                                        size: 35,
                                        color: Colors.white,
                                      ))
                                ],
                              ),
                              Text(
                                'ที่อยู่ : ',
                                style: GoogleFonts.openSans(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'น้ำหนัก :  ส่วนสูง : ',
                                style: GoogleFonts.openSans(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ));
  }

  Widget _buildOther(PersonalData? personal, int itemIndex) {
    return (itemIndex == 0)
        ? Row(
            children: [
              Expanded(
                child: Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ชื่อ : ${personal?.personalName??''}',
                      style: GoogleFonts.openSans(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      'ที่อยู่ : ${personal?.provinceName??''}',
                      style: GoogleFonts.openSans(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      'น้ำหนัก : ${personal?.personalWeight??''} ส่วนสูง : ${personal?.personalHeight??''}',
                      style: GoogleFonts.openSans(color: Colors.white, fontSize: 20),
                    ),
                  ],
                )),
              ),
              SizedBox(width: 8,),
              IconButton(
                  onPressed: () {
                    setState(
                      () {
                        showModalBottomSheet<void>(
                          barrierColor: Colors.black12,
                          backgroundColor: Colors.transparent,
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return _showModal(itemIndex);
                          },
                        );
                      },
                    );
                  },
                  icon: Icon(
                    Icons.expand_circle_down,
                    size: 35,
                    color: Colors.white,
                  ))
            ],
          )
        : (itemIndex == 1)
            ? Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'ระดับการศึกษา : ${personal?.eduData?[0].level??''}',
                            style: GoogleFonts.openSans(color: Colors.white, fontSize: 20),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1),
                        Text('คณะ : ${personal?.eduData?[0].major??''}',
                            style: GoogleFonts.openSans(color: Colors.white, fontSize: 20),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1),
                        Text(
                            'มหาวิทยาลัย : ${personal?.eduData?[0].academy??''}',
                            style: GoogleFonts.openSans(color: Colors.white, fontSize: 20),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1),

                      ],
                    ),
                  ),
                  SizedBox(width: 8,),
                  IconButton(
                      onPressed: () {
                        setState(
                          () {
                            showModalBottomSheet<void>(
                              barrierColor: Colors.black12,
                              backgroundColor: Colors.transparent,
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return _showModal(itemIndex);
                              },
                            );
                          },
                        );
                      },
                      icon: Icon(
                        Icons.expand_circle_down,
                        size: 35,
                        color: Colors.white,
                      ))
                ],
              )
            : (itemIndex == 2)
                ? Row(
                    children: [
                      Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('สถานะการทำงาน :  ${personal?.currentStatus}',
                              style:
                                  GoogleFonts.openSans(color: Colors.white, fontSize: 20),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1),
                          Text('Have no experience',
                              style:
                                  GoogleFonts.openSans(color: Colors.white, fontSize: 20),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1),
                        ],
                      )),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            setState(
                              () {
                                showModalBottomSheet<void>(
                                  barrierColor: Colors.black12,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (BuildContext context) {
                                    return _showModal(itemIndex);
                                  },
                                );
                              },
                            );
                          },
                          icon: Icon(
                            Icons.expand_circle_down,
                            size: 35,
                            color: Colors.white,
                          ))
                    ],
                  )
                : (itemIndex == 3)
                    ? Row(
                        children: [
                          Container(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'ทักษะความสามารถ :  ${personal?.provinceName ?? ''}',
                                  style: GoogleFonts.openSans(
                                      color: Colors.white, fontSize: 20),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1),
                              Text('ภาษา.....',
                                  style: GoogleFonts.openSans(
                                      color: Colors.white, fontSize: 20),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1),
                            ],
                          )),
                          Spacer(),
                          IconButton(
                              onPressed: () {
                                setState(
                                  () {
                                    showModalBottomSheet<void>(
                                      barrierColor: Colors.black12,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (BuildContext context) {
                                        return _showModal(itemIndex);
                                      },
                                    );
                                  },
                                );
                              },
                              icon: Icon(
                                Icons.expand_circle_down,
                                size: 35,
                                color: Colors.white,
                              ))
                        ],
                      )
                    : (itemIndex == 4)
                        ? Row(
                            children: [
                              Container(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('กรุ๊ปเลือด : A',
                                      style: GoogleFonts.openSans(
                                          color: Colors.white, fontSize: 20),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1),
                                  Text('สถานะ : โสด',
                                      style: GoogleFonts.openSans(
                                          color: Colors.white, fontSize: 20),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1),
                                ],
                              )),
                              Spacer(),
                              IconButton(
                                  onPressed: () {
                                    setState(
                                      () {
                                        showModalBottomSheet<void>(
                                          barrierColor: Colors.black12,
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (BuildContext context) {
                                            return _showModal(itemIndex);
                                          },
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(
                                    Icons.expand_circle_down,
                                    size: 35,
                                    color: Colors.white,
                                  ))
                            ],
                          )
                        : Row(
                            children: [
                              Container(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Finish',
                                      style: GoogleFonts.openSans(
                                          color: Colors.white, fontSize: 20),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1),
                                ],
                              )),
                              Spacer(),
                              IconButton(
                                  onPressed: () {
                                    setState(
                                      () {
                                        showModalBottomSheet<void>(
                                          barrierColor: Colors.black12,
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (BuildContext context) {
                                            return _showModal(itemIndex);
                                          },
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(
                                    Icons.expand_circle_down,
                                    size: 35,
                                    color: Colors.white,
                                  ))
                            ],
                          );
  }

  Widget _showModal(int itemIndex) {
    return Container(
      color: Colors.white,
      child: FractionallySizedBox(
        heightFactor: 0.4,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Center(
                child: Text('ข้อมูลส่วนบุคคล',
                    style: GoogleFonts.openSans(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1),
              ),
            ),
            body: _personal(widget.personal, itemIndex),
          ),
        ),
      ),
    );
  }

  Widget _personal(PersonalData? personal, int itemIndex) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text('ชื่อ : ',
                    style: GoogleFonts.openSans(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1),
                Text('${personal?.personalName}',
                    style: GoogleFonts.openSans(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text('เพศ : ',
                          style: GoogleFonts.openSans(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1),
                      Text(
                        '${personal?.personalGender}',
                        style: GoogleFonts.openSans(
                          fontSize: 16.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Text('อายุ : ',
                          style: GoogleFonts.openSans(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1),
                      Text('${personal?.personalAge}',
                          style: GoogleFonts.openSans(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text('น้ำหนัก : ',
                          style: GoogleFonts.openSans(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1),
                      Text('${personal?.personalWeight}',
                          style: GoogleFonts.openSans(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Text('ส่วนสูง : ',
                          style: GoogleFonts.openSans(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1),
                      Text('${personal?.personalHeight}',
                          style: GoogleFonts.openSans(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text('จังหวัด : ',
                    style: GoogleFonts.openSans(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1),
                Text('${personal?.provinceName}',
                    style: GoogleFonts.openSans(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Divider(
              color: Colors.amber,
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text('สถานะปัจจุบัน : ',
                    style: GoogleFonts.openSans(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1),
                Text('${personal?.currentStatus}',
                    style: GoogleFonts.openSans(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text('บริษัท : ',
                    style: GoogleFonts.openSans(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1),
                Text('${personal?.workData?[0].companyName}',
                    style: GoogleFonts.openSans(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text('ตำแหน่งงาน : ',
                    style: GoogleFonts.openSans(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1),
                Text('${personal?.workData?[0].position}',
                    style: GoogleFonts.openSans(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text('ประสบการณ์ : ',
                    style: GoogleFonts.openSans(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1),
                Text('null',
                    style: GoogleFonts.openSans(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Divider(
              color: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _loadMoreNews() async {
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(Duration(seconds: 1));
  }
}
