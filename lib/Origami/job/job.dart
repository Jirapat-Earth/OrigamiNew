import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/cupertino.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_project/Origami/job/personal%20information/information.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import '../../Login/login.dart';

class JobPage extends StatefulWidget {
  JobPage({super.key, required this.employee});
  final Employee employee;

  @override
  _JobPageState createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  bool _isLoading = true;
  List<PersonalData> personal = [];
  List<PersonalData>? personalList = [];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    fetchPerson();
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
      body: condition(),
      bottomNavigationBar: BottomBarInspiredInside(
        items: [
          TabItem(
            icon: Icons.person,
            title: 'Persons',
          ),
          TabItem(
            icon: Icons.check,
            title: 'Interrested',
          ),
          TabItem(
            icon: Icons.image,
            title: 'Origami',
          ),
          TabItem(
            icon: Icons.close,
            title: 'Not Interrested',
          ),
          TabItem(
            icon: Icons.school,
            title: 'LogOut',
          ),
        ],
        colorSelected: Colors.white,
        backgroundColor: Colors.white,
        color: Colors.amber,
        indexSelected: _selectedIndex,
        onTap: _onItemTapped,
        chipStyle: const ChipStyle(convexBridge: true),
        itemStyle: ItemStyle.hexagon,
        // chipStyle:const ChipStyle(drawHexagon: true),
        // itemStyle: ItemStyle.circle,
        animated: false,
      ),
    );
  }

  Widget condition() {
    switch (_selectedIndex) {
      case 0:
        return sliderImage();
      case 1:
        return Container(
          alignment: Alignment.center,
          child: Text(
            'Interrested',
            style: GoogleFonts.openSans(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        );
      case 2:
        return Container(
          alignment: Alignment.center,
          child: Text(
            'Origami',
            style: GoogleFonts.openSans(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        );
      case 3:
        return Container(
          alignment: Alignment.center,
          child: Text(
            'NOT Interrested',
            style: GoogleFonts.openSans(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        );
      case 4:
        return Text(
          'LogOut',
          style: GoogleFonts.openSans(
            fontSize: 18.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ); //LoginPage(num: 1, popPage: 0,);
      default:
        return Container(
          alignment: Alignment.center,
          child: Text(
            'ERROR!',
            style: GoogleFonts.openSans(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        );
    }
  }

  Widget sliderImage() {
    return Stack(
      alignment: Alignment.center,
      children: [
        CarouselSlider.builder(
          carouselController: _carouselController,
          itemCount: personalList!.length,
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
                        _showSlide(personalList?[itemIndex]),
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
                      _buildName(
                        personalList?[itemIndex],
                      ),
                      _buildOther(personalList?[itemIndex]),
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
          top: 16.0,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedSmoothIndicator(
              activeIndex: _currentIndex,
              count: personalList!.length,
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

  Widget _showSlide(PersonalData? personal) {
    return Image.network(
      ("${personal?.profileAvatar ?? ''}"),
      // 'assets/images/celebrity/bella6.jpg',
      fit: BoxFit.fill,
      height: double.infinity,
    );
  }

  Widget _buildName(PersonalData? personal) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Text(
            "${personal?.personalName ?? ''} ${personal?.personalAge ?? ''}",
            style: GoogleFonts.openSans(color: Colors.white, fontSize: 20),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Spacer(),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Information(
                            personal: personal!,
                            personalList: personalList ?? [],
                          )),
                );
              },
              icon: Icon(
                Icons.expand_circle_down,
                size: 35,
                color: Colors.white,
              ))
        ],
      ),
    );
  }

  Widget _buildOther(PersonalData? personal) {
    return Column(
      children: [
        Container(
          child: (personal?.provinceName == null ||
                  (personal?.provinceName ?? '') == "")
              ? Container()
              : Row(
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      personal?.provinceName ?? '',
                      style: GoogleFonts.openSans(color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
        ),
        Row(
          children: [
            Icon(
              Icons.work,
              color: Colors.white,
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Text(
                "ประสบการณ์การทำงาน: ${personal?.workCompany ?? ''}",
                style: GoogleFonts.openSans(color: Colors.white),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ],
    );
  }

  final CarouselController _carouselController = CarouselController();

  Future<void> fetchPerson() async {
    final uri = Uri.parse('https://www.origami.life/api/origami/jobs/personal');
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
          final List<dynamic> personalDataJson = jsonResponse['personal_data'];
          setState(() {
            personal = personalDataJson
                .map((json) => PersonalData.fromJson(json))
                .toList();
            personalList = personal;
          });
          _loadMoreNews();
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

  Future<void> _loadMoreNews() async {
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(Duration(seconds: 1));
  }
}

class PersonalData {
  final String? personalId;
  final String? profileAvatar;
  final String? personalName;
  final String? personalAge;
  final String? personalWeight;
  final String? personalHeight;
  final String? personalGender;
  final String? provinceName;
  final String? currentStatus;
  final String? workCompany;
  final String? workPosition;
  final String? workPeriod;
  final List<EducationData>? eduData;
  final List<WorkData>? workData;

  PersonalData({
    this.personalId,
    this.profileAvatar,
    this.personalName,
    this.personalAge,
    this.personalWeight,
    this.personalHeight,
    this.personalGender,
    this.provinceName,
    this.currentStatus,
    this.workCompany,
    this.workPosition,
    this.workPeriod,
    this.eduData,
    this.workData,
  });

  factory PersonalData.fromJson(Map<String, dynamic> json) {
    return PersonalData(
      personalId: json['personal_id'],
      profileAvatar: json['profile_avatar'],
      personalName: json['personal_name'],
      personalAge: json['personal_age'],
      personalWeight: json['personal_weight'],
      personalHeight: json['personal_height'],
      personalGender: json['personal_gender'],
      provinceName: json['province_name'],
      currentStatus: json['current_status'],
      workCompany: json['work_company'],
      workPosition: json['work_position'],
      workPeriod: json['work_period'],
      eduData: (json['edu_data'] as List<dynamic>?)
          ?.map((e) => EducationData.fromJson(e))
          .toList(),
      workData: (json['work_data'] as List<dynamic>?)
          ?.map((e) => WorkData.fromJson(e))
          .toList(),
    );
  }
}

class EducationData {
  final String? academy;
  final String? major;
  final String? level;
  final String? location;
  final String? grade;
  final String? startDate;
  final String? endDate;

  EducationData({
    this.academy,
    this.major,
    this.level,
    this.location,
    this.grade,
    this.startDate,
    this.endDate,
  });

  factory EducationData.fromJson(Map<String, dynamic> json) {
    return EducationData(
      academy: json['_academy'],
      major: json['_major'],
      level: json['_level'],
      location: json['_location'],
      grade: json['app_register_education_grade'],
      startDate: json['_start'],
      endDate: json['_end'],
    );
  }
}

class WorkData {
  final String? companyName;
  final String? position;
  final String? startDate;
  final String? endDate;
  final String? address;
  final String? reason;

  WorkData({
    this.companyName,
    this.position,
    this.startDate,
    this.endDate,
    this.address,
    this.reason,
  });

  factory WorkData.fromJson(Map<String, dynamic> json) {
    return WorkData(
      companyName: json['_company'],
      position: json['_position'],
      startDate: json['_start'],
      endDate: json['_end'],
      address: json['_address'],
      reason: json['_reason'],
    );
  }
}
