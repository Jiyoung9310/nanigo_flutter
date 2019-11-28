import 'package:flutter/material.dart';

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
        children: <Widget>[
          SizedBox(height: tabHeight + 12,),
          Image.asset('assets/images/bg_speaker.png'),
          SizedBox(height: 9.0,),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('내 확성기', style: theme.textTheme.title),
              Text('5', style: theme.textTheme.title.copyWith(color: Color(0xFF27d1ff), fontSize: 54.0)),
              Text('개', style: theme.textTheme.title),
            ],
          ),
          Text('확성기 게이지', style : theme.textTheme.body1),
          Container(
            
          ),
        ],
      )
    );
  }
}
