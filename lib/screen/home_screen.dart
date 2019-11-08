import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  int _currentIndex = 0;
  List<int> cardDataList = List(10);
  List<Color> bgcolors = [Color(0xFF6CD0ED), Color(0xFF51A6E6), Color(0xFF7C76F1), Color(0xFFA469DD), Color(0xFFFE726A)];


  _changeIndex(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  _changeTabIndex(index) {
    setState(() {

    });
  }

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
            backgroundColor: bgcolors[_currentIndex % bgcolors.length],
            appBar: TabBar(
              indicatorColor: Colors.transparent,
              controller: _tabController,
              onTap: _changeTabIndex,
              tabs: <Widget>[
                Tab(icon: Container(
                    child: Image.asset(
                      'assets/images/ic_speaker_grey.png',
                      height: 30.0,
                      width: 30.0,
                    )),
                ),
                Tab(icon: Container(
                    child: Image.asset('assets/images/nanigo_logo_white.png',
                      height: 25.0,
                      width: 80.0,
                    )),
                ),
                Tab(icon: Container(
                    child: Image.asset('assets/images/ic_user_grey.png',
                      height: 30.0,
                      width: 30.0,
                    )),
                ),
              ],
            ),
            body: _cardListWidget(context)
        )
    );
  }

  Widget _cardListWidget(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Swiper(
      itemCount: cardDataList.length,
      itemBuilder: (context, index) => _cardWidget(width * 0.8, height * 0.6, index),
      scrollDirection: Axis.vertical,
      onIndexChanged: _changeIndex,
      loop: false,
    );
  }

  Center _cardWidget(double cwidth, double cheight, int index) {
    return Center(
      child: Container(
        width: cwidth,
        height: cheight,
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 12.0,
                right: 17.0,
                child: Image.asset(
                    'assets/images/ic_menu_horizon.png',
                    height: 30.0,
                    width: 30.0
                ),
            ),
            Positioned(
              bottom: 55.0,
              child: Container(
                height: 2,
                width: cwidth,
                color: Color(0x0C3B464B),
              ),
            ),
            Positioned(
              bottom: 14.0,
              left: 22.5,
              right: 20.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text(
                      '청순한 호랑이',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color(0xFF8799A3)
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Image.asset(
                            'assets/images/ic_view_count.png',
                            height: 30.0,
                            width: 30.0
                        ),
                        Text(
                          '15',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF8799A3)
                          ),
                        ),
                        Container(
                          height: 13,
                          width: 2,
                          color: Color(0xFF8799A3),
                        ),
                        Image.asset(
                            'assets/images/ic_comment_count.png',
                            height: 30.0,
                            width: 30.0
                        ),
                        Text(
                          '15',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF8799A3)
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ),
            Center(
              child: Text(
                '스타벅스 이번달 신메뉴 아보카도 블랜드 어때?',
                style: TextStyle(
                  fontSize: 26,
                  fontFamily: 'BlackHanSans'
                ),
              ),
            ),
          ],
        ),
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
