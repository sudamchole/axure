import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../widgets/FABBottomAppBarItem.dart';
import '../widgets/user_card.dart';
import '../widgets/health_advicer_list_items.dart';
import '../widgets/insurance_product_list.dart';
import '../widgets/health_reward.dart';

class BottomBar extends StatefulWidget {
  final int selectedIndex;

  BottomBar({@required this.selectedIndex});

  @override
  State<StatefulWidget> createState() => new _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  String _lastSelected = 'TAB: 0';
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  Position _currentPosition;
  String _currentAddress="Address";

  void _selectedTab(int index) {
    setState(() {
      _lastSelected = 'TAB: $index';
    });
  }

  void _selectedFab(int index) {
    setState(() {
      _lastSelected = 'FAB: $index';
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          _currentAddress,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _modalBottomSheetMenu();
        },
        tooltip: 'Increment',
        child: Icon(
          Icons.home,
          color: Colors.black,
        ),
        elevation: 5.0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              UserCard(),
              Container(
                  margin: const EdgeInsets.all(16),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Health Advisor',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                height: 190,
                child: ListView.builder(
                    padding: EdgeInsets.only(right: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: HealthAdviserListItems(),
                      );
                    }),
              ),
              Container(
                  margin: const EdgeInsets.all(16),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Health Rewards',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )),
              HealthReward(),
              Container(
                  margin: const EdgeInsets.all(16),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Explore our Insurance Product',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )),
              ListView.builder(
                itemCount: 3,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, int index) {
                  return InsuranceProduct();
                },
              )
            ],
          ),
        ),
      ),
      /*Center(
        child: Text(
          _lastSelected,
          style: TextStyle(fontSize: 32.0),
        ),
      ),*/
      bottomNavigationBar: FABBottomAppBar(
        color: Colors.blueGrey,
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(
              iconData: Icons.insert_drive_file, text: 'My\nPolicies'),
          FABBottomAppBarItem(
              iconData: Icons.local_hospital, text: 'Locate\nHospital'),
          FABBottomAppBarItem(
              iconData: Icons.filter_frames, text: 'Raise\nClaim'),
          FABBottomAppBarItem(
              iconData: Icons.supervised_user_circle, text: 'Book\nServices'),
        ],
      ),
    );
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return new Container(
            height: 420.0,
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
                margin: EdgeInsets.only(bottom: 130),
                decoration: new BoxDecoration(
                    color: Colors.white70,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(90.0),
                        topRight: const Radius.circular(90.0))),
                child: new Center(
                  child: _gridOptions(context),
                )),
          );
        });
  }
  Widget _gridOptions(context) {
    return Container(
      child: GridView.count(
        padding: EdgeInsets.only(left: 15,right: 15),
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        childAspectRatio: 1.9,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        children: new List<Widget>.generate(4, (index) {
          return new GridTile(
              child: new InkResponse(
                  enableFeedback: true,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: GestureDetector(
                        onTap: () {

                        },
                        child: new Card(
                          color: Colors.white,
                          elevation: 5,
                          clipBehavior: Clip.hardEdge,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'option ${index+1}',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20)),
                                padding: EdgeInsets.only(top:16,left: 16),
                                alignment: Alignment.centerLeft,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 16,left: 16),
                                alignment: Alignment.bottomLeft,
                                  child: Icon(Icons.cloud_circle),
                                  // borde width
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                  )),
                            ],
                          ),
                        )),
                  )));
        }),
      ),
    );
  }
  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
        "${place.locality}, ${place.subAdministrativeArea}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }
}
