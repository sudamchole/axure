import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HealthReward extends StatefulWidget {
  @override
  _HealthRewardState createState() => _HealthRewardState();
}

class _HealthRewardState extends State<HealthReward> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16,right: 16),
      child:LinearPercentIndicator(
        lineHeight: 15.0,
        percent: 0.44,
        center: Text(
          "44%",
          style: new TextStyle(fontSize: 12.0),
        ),
        linearStrokeCap: LinearStrokeCap.roundAll,
        backgroundColor: Colors.grey,
        progressColor: Colors.lightGreen,
      ),
    );
  }
}
