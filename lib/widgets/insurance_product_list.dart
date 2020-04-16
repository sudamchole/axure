import 'package:flutter/material.dart';

class InsuranceProduct extends StatefulWidget {
  @override
  _InsuranceProductState createState() => _InsuranceProductState();
}

class _InsuranceProductState extends State<InsuranceProduct> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Card(
        margin: EdgeInsets.only(left: 16,right: 16,bottom: 16),
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(
                Icons.present_to_all,
                size: 60,
              ),
              Container(
                child: Expanded(
                  child: Column(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(left: 16, right: 16),
                          child: Text('Health Insurance redefined',maxLines: 1,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18,color: Colors.grey),)),
                      Expanded(
                          child: Container(
                              padding: EdgeInsets.only(left: 16, right: 16),
                              alignment: Alignment.centerLeft,
                              child: Text('Lorem ipsum dolor sitamet is a placeholder text....',maxLines: 2,)))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
