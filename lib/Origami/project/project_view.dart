
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_maps_widget/google_maps_widget.dart';

class ProjectView extends StatefulWidget {
  const ProjectView({
    Key? key,
  }) : super(key: key);

  @override
  _ProjectViewState createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {
  TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  DateTime now = DateTime.now();

  get mapsWidgetController => null;
  // String DateFormat = DateFormat.Hm(now);

  List<projectNew> activity = [
    projectNew(
      'Origami Application',
      'ACRM',),
    projectNew(
      'HR Activity',
      'Trandar international',),
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
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        body: _getContentWidget()
    );
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
                            child: Image.asset(
                                'assets/images/cartoon-man.jpg',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            )
                            // Image.network(
                            //   'assets/images/tranda.png', // Replace with your image URL
                            //   width: 50,
                            //   height: 50,
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                          SizedBox(width: 8,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                activity[index].department,
                                style: GoogleFonts.openSans(
                                  fontSize: 18.0,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                activity[index].works,
                                style: GoogleFonts.openSans(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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

class projectNew {
  String department;
  String works;
  
  projectNew(
      this.department,
      this.works,
      );
}
