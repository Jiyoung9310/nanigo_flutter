import 'package:flutter/material.dart';
import 'package:nanigo_flutter/custom/bar_chart.dart';
import 'package:nanigo_flutter/res/colors.dart';

class SpeakerScreen extends StatefulWidget {
  final double tabHeight;
  SpeakerScreen(this.tabHeight);
  
  @override
  _SpeakerScreenState createState() => _SpeakerScreenState(tabHeight);
}

class _SpeakerScreenState extends State<SpeakerScreen> {
  var tabHeight;

  _SpeakerScreenState(this.tabHeight);
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: tabHeight + 12,),
          Image.asset('assets/images/bg_speaker.png'),
          SizedBox(height: 9.0,),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('내 확성기', style: theme.textTheme.title),
              SizedBox(width: 7.5,),
              Text('5', style: theme.textTheme.title.copyWith(color: Color(0xFF27d1ff), fontSize: 54.0)),
              Text('개', style: theme.textTheme.title),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(49.0, 29.0, 0, 0),
            child: Text('확성기 게이지', style : theme.textTheme.body1),
          ),
          SizedBox(height: 10.0,),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 49.0),
            child: Stack(
              children: <Widget>[
                CustomPaint(
                    size: Size(double.infinity, 0.0),
                    painter: BarChart(percentage : 60)
                ),
                Positioned(
                  child: Text('New 1개',
                    style: TextStyle(
                        color: kContentsExtraTextColor,
                        fontSize: 15.0),
                  ),
                ),
              ],
            )
          ),
        ],
      )
    );
  }
}
