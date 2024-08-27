import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenPage extends StatefulWidget {
  @override
  _HomeScreenPageState createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MAIN'),
        elevation: 0,
      ),
      body: cardItem(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: 'Page1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Page2',
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget cardItem(int i) {
    if (i == 0) {
      return GridView.count(
        crossAxisCount: 3,
        children: List<Widget>.generate(100, (int index) {
          return GridTile(
            child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 4.0,
                child: Column(
                  children: <Widget>[
                    Expanded(
                        child: Image.network(
                            'https://www.thaihealth.or.th/data/content/26220/cms/e_bcdijkluwyz2.jpg')),
                    Text('Item - $index', style: GoogleFonts.openSans(color: Color(0xFF555555),)),
                  ],
                )),
          );
        }),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Item',
                  style: GoogleFonts.openSans(fontSize: 16,fontWeight: FontWeight.bold),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      50,
                          (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              'https://www.thaihealth.or.th/data/content/26220/cms/e_bcdijkluwyz2.jpg',
                              // height: 120,
                              width: 120,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Categories',
                  style: GoogleFonts.openSans(fontSize: 16,fontWeight: FontWeight.bold),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      50,
                          (index) {
                        // double drawerWidth = MediaQuery.of(context).size.width * 1;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  'https://www.thaihealth.or.th/data/content/26220/cms/e_bcdijkluwyz2.jpg',
                                  // height: 120,
                                  width: 150,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    // border: Border.all(color: Colors.orange),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  width: 150,
                                  padding: EdgeInsets.only(top: 8,bottom: 8),
                                  child: Center(
                                    child: Text(
                                      'Categories',
                                      style: GoogleFonts.openSans(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8,),
          Container(
            color: Colors.grey,
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Suggested products',
                  style: GoogleFonts.openSans(fontSize: 16,fontWeight: FontWeight.bold),
                ),
                Spacer(),
                // TextButton(
                //   Text('View all',style: GoogleFonts.openSans(fontSize: 16,),)
                //
                // ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Item Details',
                        style: GoogleFonts.openSans(fontSize: 16,fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: List.generate(
                          50,
                              (index) {
                            // double drawerWidth = MediaQuery.of(context).size.width * 1;
                            return Card(
                              elevation: 2,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image.network(
                                              'https://www.thaihealth.or.th/data/content/26220/cms/e_bcdijkluwyz2.jpg',
                                              // height: 120,
                                              width: 100,
                                            ),
                                          ),
                                          SizedBox(width: 16,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Item ${index+1}',
                                                style: GoogleFonts.openSans(fontSize: 16,),
                                              ),
                                              SizedBox(height: 8,),
                                              Text(
                                                'Details',
                                                style: GoogleFonts.openSans(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),


                                    IconButton(onPressed: (){},
                                      icon: Icon(Icons.mark_chat_read,size: 30,),
                                    )
                                    
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }
  }
}
