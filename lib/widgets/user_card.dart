import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserCard extends StatefulWidget {
  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {

  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Card(
        margin: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(32))
        ),
        child: Container(
          child: Row(children: <Widget>[
            GestureDetector(
              onTap: (){
                getImage();
              },
              child: _image == null
                  ? Icon(Icons.supervised_user_circle,size: 90,)
                  : CircleAvatar(
                  backgroundImage: FileImage(_image),
                  radius: 56.0,
                  backgroundColor: Colors.blue[50]),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 16),
                   child: Text('Jenifer Wilson',style: TextStyle(fontSize: 24,color: Colors.grey),),
                ),
                Container(
                  child:FlatButton.icon(onPressed:null,label:Text('Mumbai India',style: TextStyle(fontSize: 17,color: Colors.black87),),icon: Icon(Icons.location_on),),
                ),
                Container(
                  child:FlatButton.icon(onPressed: null, icon:Icon(Icons.calendar_today), label:Text('12-april-1990',style: TextStyle(fontSize: 15,color: Colors.black87),)),
                )
              ],
            )
          ],),
        ),
      ),
    );
  }
}
