
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_maps_widget/google_maps_widget.dart';

class ActivityView extends StatefulWidget {
  const ActivityView({super.key});

  @override
  _ActivityViewState createState() => _ActivityViewState();
}

class _ActivityViewState extends State<ActivityView> {
  TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  DateTime now = DateTime.now();

  get mapsWidgetController => null;
  // String DateFormat = DateFormat.Hm(now);

  List<activityNews> activity = [
    activityNews(
        'Colors Ore',
        'AC-2024-04423',
        'Advance',
        '08/05/2024',
        '450.00',
        'New'),
    activityNews(
        'งานผนัง',
        'AD-2024-00008',
        'Expense',
        '09/05/2024',
        '2500.00',
        'New'),
    activityNews(
        'Test Code',
        'CL-2024-018579',
        'Purchase',
        '15/05/2024',
        '50.00',
        'New'),
    activityNews(
        'Google Map',
        'EE-2024-15234',
        'Asset',
        '17/05/2024',
        '150.00',
        'New'),
    activityNews(
        'Events',
        'CA-2024-17960',
        'Product',
        '17/05/2024',
        '1200.00',
        'New'),
  ];

  void _incrementCounter() {
    setState(() {
      // go to add project page
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Container(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      _searchText = _searchController.text;
                      // Perform search operation with _searchText
                      print('Search: $_searchText');
                    });
                  },
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchText = value;
                  // Perform real-time search operation with _searchText
                  print('Search: $_searchText');
                });
              },
            ),
          ),
        ),
        floatingActionButton: SpeedDial(
            icon: Icons.add,
            backgroundColor: Colors.amberAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // Adjust the border radius as needed
            ),
            children: [
              SpeedDialChild(
                child: Image.asset(
                  'assets/images/advance.jpg',
                  width: 50,
                  height: 50,
                ),
                label: 'Advance',
                labelBackgroundColor:Color(0xFFFD8A8A),
                backgroundColor: Colors.transparent,
                onTap: () {},
              ),
              SpeedDialChild(
                child:  Image.asset(
                  'assets/images/expense.jpg',
                  width: 50,
                  height: 50,
                ),
                label: 'Expense',
                labelBackgroundColor:Color(0xFF8CC0DE),
                backgroundColor: Colors.transparent,
                onTap: () {},
              ),
              SpeedDialChild(
                child:  Image.asset(
                  'assets/images/purchase.jpg',
                  width: 50,
                  height: 50,
                ),
                label: 'Purchase',//Color(0xFFFD8A8A)
                labelBackgroundColor:Color(0xFFFAAB78),
                backgroundColor: Colors.transparent,
                onTap: () {},
              ),
              SpeedDialChild(
                child:  Image.asset(
                  'assets/images/asset.jpg',
                  width: 50,
                  height: 50,
                ),
                label: 'Asset',
                labelBackgroundColor:Color(0xFFB6E2A1),
                backgroundColor: Colors.transparent,
                onTap: () {},
              ),
              SpeedDialChild(
                child:  Image.asset(
                  'assets/images/product.jpg',
                  width: 50,
                  height: 50,
                ),
                label: 'Product',
                labelBackgroundColor:Color(0xFFB2A4FF),
                backgroundColor: Colors.transparent,
                onTap: () {},
              ),

            ]),
        body: _getContentWidget());
  }

  Widget _getContentWidget() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: List.generate(activity.length, (index) {
              return SingleChildScrollView(
                child: Card(
                  elevation: 0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: SingleChildScrollView(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
                            child: Image.network(
                              'https://via.placeholder.com/150', // Replace with your image URL
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 8,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                activity[index].subject,
                                style: GoogleFonts.openSans(
                                  fontSize: 18.0,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                '${activity[index].needs_type} - ${activity[index].document}',
                                style: GoogleFonts.openSans(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Date : ${activity[index].date} ",
                                style: GoogleFonts.openSans(
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Amount : ${activity[index].amount} Baht",
                                style: GoogleFonts.openSans(
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    "Type : ${activity[index].status}",
                                    style: GoogleFonts.openSans(
                                      fontSize: 14.0,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Card(
                                    color: Colors.orangeAccent,
                                      child: Padding(
                                    padding: const EdgeInsets.only(left: 16,right: 16,top: 2,bottom: 2),
                                    child: Text('Close',style: GoogleFonts.openSans(
                                      fontSize: 14.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  ))
                                ],
                              ),
                              Divider(color: Colors.amber,),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class activityNews {
  String subject;
  String document;
  String needs_type;
  String date;
  String amount;
  String status;

  activityNews(
    this.subject,
    this.document,
    this.needs_type,
    this.date,
    this.amount,
    this.status,
  );
}
