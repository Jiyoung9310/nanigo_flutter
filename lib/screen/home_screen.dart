import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:nanigo_flutter/res/colors.dart';
import 'package:nanigo_flutter/screen/mypage_screen.dart';
import 'package:nanigo_flutter/screen/speaker_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  PageController _pageController;

  int _currentIndex = 0;
  int _currentPageIndex = 1;
  List<int> cardDataList = List(10);
  List<Color> bgcolors = [kBackgroundLightBlue, kBackgroundDeepBlue,
    kBackgroundPurple, kBackgroundViolet, kBackgroundSalmon];


  _changeIndex(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  _changeTabIndex(index) {
    setState(() {
      _currentPageIndex = index;
      _pageController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
    });
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: _currentPageIndex);
  }


  @override
  void dispose() {
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double tabHeight = statusBarHeight + 45.0;
    return SafeArea(
          top: false,
          bottom: false,
          child: Scaffold(
              backgroundColor: bgcolors[_currentIndex % bgcolors.length],
              body: Stack(
                children: <Widget>[
                  PageView(
                    controller: _pageController,
                    children: <Widget>[
                      SpeakerScreen(tabHeight),
                      _cardListWidget(context),
                      MyPageScreen(),
                    ],
                    onPageChanged: (int index) {
                      setState(() {
                        _currentPageIndex = index;
                      });
                    },
                  ),
                  _tabLayout(statusBarHeight),
                ],
              )

      ),
    );
  }

  Positioned _tabLayout(double statusBarHeight) {
    return Positioned(
                  top: statusBarHeight + 5.0,
                  left: 20.0,
                  right: 20.0,
                  height: 40.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _changeTabIndex(0);
                          });
                        },
                        child: Container(
                            child: Image.asset(
                              _currentPageIndex == 0
                                  ? 'assets/images/ic_speaker_dark.png'
                                  : 'assets/images/ic_speaker_grey.png',
                              height: 30.0,
                              width: 30.0,
                            )
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _changeTabIndex(1);
                          });
                        },
                        child: Container(
                            child: Image.asset(
                              _currentPageIndex == 1
                                ? 'assets/images/nanigo_logo_white.png'
                                : 'assets/images/nanigo_logo_grey.png',
                              height: 25.0,
                              width: 80.0,
                            )
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _changeTabIndex(2);
                          });
                        },
                        child: Container(
                            child: Image.asset(
                              _currentPageIndex == 2
                                ? 'assets/images/ic_user_dark.png'
                                : 'assets/images/ic_user_grey.png',
                              height: 30.0,
                              width: 30.0,
                            )
                        ),
                      ),
                    ],
                  ),
                );
  }

  Widget _cardListWidget(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    double softkeyHeight = MediaQuery.of(context).padding.bottom;

    return Stack(
      children: <Widget>[
        Swiper(
          itemCount: cardDataList.length,
          itemBuilder: (context, index) => _cardContainer(width * 0.8, height * 0.6, index),
          scrollDirection: Axis.vertical,
          onIndexChanged: _changeIndex,
          loop: false,
        ),
        Positioned(
          bottom: softkeyHeight + 21.0,
          left: 0.0,
          right: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Image.asset('assets/images/img_o_btn.png'),
                height: 55.0,
                width: 55.0,
              ),
              Container(
                child: Image.asset('assets/images/img_x_btn.png'),
                height: 55.0,
                width: 55.0,
              ),
            ],
          ),
        )
      ],
    );
  }

  Center _cardContainer(double cwidth, double cheight, int index) {
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
                color: kDivider,
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
                          color: kContentsSmallTextColor
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
                              color: kContentsSmallTextColorA
                          ),
                        ),
                        Container(
                          height: 13,
                          width: 2,
                          color: kContentsSmallTextColor,
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
                              color: kContentsSmallTextColorA
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ),
            _cardContents(),
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

  Center _cardContents() {
    return Center(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      'Q.',
                      style: TextStyle(
                          color: bgcolors[_currentIndex % bgcolors.length],
                          fontSize: 26,
                          fontFamily: 'BlackHanSans'
                      ),
                    ),
                    SizedBox(
                      width: 9.0,
                    ),
                    Expanded(
                      child: Text(
                        '스타벅스 이번달 신메뉴 아보카도 블랜드 어때?',
                        style: TextStyle(
                          color: kContentsTextColor,
                          fontSize: 26,
                          fontFamily: 'BlackHanSans',
                        ),
                      ),
                    ),
                  ],
                )
            ),
          );
  }
}
