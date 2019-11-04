import 'package:flutter/material.dart';
import 'package:snaplist/snaplist.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(initialIndex: 1, length: 3, vsync: this);
  }


  @override
  void dispose() {
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.speaker),),
              Tab(text : 'Nanigo'),
              Tab(icon: Icon(Icons.account_circle)),
            ],
            controller: _tabController,
            indicatorColor: Colors.transparent,
          ),
          body: _cardListWidget(context)),
    );
  }

  Widget _cardListWidget(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return SnapList(
      sizeProvider: (index, data) => Size(width, height * 0.8),
      separatorProvider: (index, data) => Size(0.0, 130.0),
      builder: (context, index, data) => _cardWidget(width * 0.8, height * 0.6),
      count: 10,
      axis: Axis.vertical,
    );
  }

  Center _cardWidget(double cwidth, double cheight) {
    return Center(
      child: Container(
        width: cwidth,
        height: cheight,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0))
            ]),
      ),
    );
  }
}
