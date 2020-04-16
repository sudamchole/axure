import 'package:flutter/material.dart';

class HealthAdviserListItems extends StatefulWidget {
  @override
  _HealthAdviserListItemsState createState() => _HealthAdviserListItemsState();
}

class _HealthAdviserListItemsState extends State<HealthAdviserListItems> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width/1.3,
      child: Card(
        margin: EdgeInsets.only(left: 16,bottom: 16),
        elevation: 5,
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Expanded(
                  child: Column(
                    children: <Widget>[
                      Expanded(child: Container(padding: EdgeInsets.only(left: 16,right: 16),child: Text('From treatment guidance to post hospitalization care...'))),
                      Container(
                        height: 32,
                      ),
                      Container(padding:EdgeInsets.only(left: 16,right: 16),alignment:Alignment.centerLeft,child: RaisedButton( onPressed: () => {},
                          textColor: Colors.white,
                          color: Colors.blue,
                          child: Text('Get in touch')))
                    ],
                  ),
                ),
              ),
              Icon(Icons.present_to_all,size: 60,)
            ],
          ),
        ),
      ),
    );
  }
}
