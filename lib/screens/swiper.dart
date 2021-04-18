import 'dart:async';
import 'package:flutter_tindev/widgets/swiperWiget.dart';
import 'package:flutter_tindev/widgets/matchesWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindev/models/person_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_tindev/models/slide_model.dart';

class SwiperScreen extends StatefulWidget {

  @override
  _SwiperScreenState createState() => _SwiperScreenState();
}

class _SwiperScreenState extends State<SwiperScreen> {
  PageController _pageController = PageController(initialPage: 1, keepPage: false);
  PageController _pageControllerSlides = PageController(initialPage: 0, keepPage: false);
  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color.fromRGBO(253, 41, 123, 1), Color.fromRGBO(255, 101, 91, 1)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  int currentPage = 0;
  int currentPageView = 1;
  bool _isNopeVisible = false;
  bool _isLikeVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
    .addPostFrameCallback((_) {
      Timer.periodic(Duration(seconds: 3), (Timer timer) {
        if (currentPage < Slides.length-1 && _pageController.page == 0) {
          currentPage++;
        } else if(_pageController.page == 0 || (currentPage != 0 && _pageController.page != 0)) {
          currentPage = 0;
        }

        if (_pageController.page == 0) {
          _pageControllerSlides.animateToPage(
            currentPage,
            duration: Duration(milliseconds: 450),
            curve: Curves.easeInExpo,
          );
        }
      });
    });
  }

  Widget _createBullet(int index, int currentSlide) {
    Slide _slide = Slides[index];
    return Row(
      children: <Widget>[
        SizedBox(width: 2.0,),
        Container(
          height: 6.0,
          width: 6.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            color: index == currentSlide ? _slide.color : Colors.black12,
          ),
        ),
        SizedBox(width: 2.0,),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        actions: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Icon(Icons.person, color: currentPageView == 0 ? Colors.redAccent: Color.fromRGBO(215, 215, 215, 1), size: 27.0),
                Icon(FontAwesomeIcons.fire, color: currentPageView == 1 ? Colors.redAccent: Color.fromRGBO(215, 215, 215, 1), size: 27.0),
                Icon(Icons.chat, color: currentPageView == 2 ? Colors.redAccent: Color.fromRGBO(215, 215, 215, 1), size: 27.0),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        color: Color.fromRGBO(215, 215, 215, 0.1),
        child: PageView(
          controller: _pageController,
          children: <Widget>[
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 180.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(700.0, 200.0), bottomRight:  Radius.elliptical(700.0, 200.0)),
                    boxShadow: [
                      new BoxShadow(
                        blurRadius: 2.0,
                        color: Color.fromRGBO(215, 215, 215, 0.4),
                        offset: new Offset(0.0, 1.0),
                      )
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 15),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child:  Image.asset("assets/images/me.jpg", fit: BoxFit.cover, height: 135.0, width: 135.0),
                      ),
                      SizedBox(height: 15),
                      Text('Paulo, 20', style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.7
                      )),
                      SizedBox(height: 6),
                      Text('Web Developer at Accenture', style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal
                      )),
                      SizedBox(height: 6),
                      Text('UMC - Sistemas de Informação', style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal
                      )),
                      SizedBox(height: 10),
                      Row( 
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(15.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.0),
                                  color: Color.fromRGBO(215, 215, 215, 0.3), 
                                ),
                                child: Icon(FontAwesomeIcons.cog, color: Color.fromRGBO(215, 215, 215, 1), size: 27.0),
                              ),
                              SizedBox(height: 7),
                              Text('SETTINGS', style: TextStyle(
                                color: Color.fromRGBO(215, 215, 215, 1),
                                fontSize: 12,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.bold
                              )),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: 40),
                              Stack(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(15.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100.0),
                                      gradient: LinearGradient(
                                        colors: <Color>[Color.fromRGBO(253, 41, 123, 1), Color.fromRGBO(255, 101, 91, 1)],
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                      ),
                                      boxShadow: [
                                        new BoxShadow(
                                          color: Color.fromRGBO(215, 215, 215, 0.4  ),
                                          offset: new Offset(0.0, 1.5),
                                        )
                                      ],
                                    ),
                                    child: Center(
                                      child: Column(
                                        children: <Widget>[
                                          Icon(FontAwesomeIcons.camera, color: Colors.white, size: 35.0),
                                          SizedBox(height: 2)
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0.0,
                                    right: 0.0,
                                    child: Container(
                                      padding: EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100.0),
                                        color: Colors.white, 
                                        boxShadow: [
                                          new BoxShadow(
                                            color: Color.fromRGBO(215, 215, 215, 0.6),
                                            offset: new Offset(0.0, 2.0),
                                          )
                                        ],
                                      ),
                                      child: Center(
                                        child: Icon(FontAwesomeIcons.plus, size: 10.0, color: Colors.redAccent),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text('ADD MEDIA', style: TextStyle(
                                color: Color.fromRGBO(215, 215, 215, 1),
                                fontSize: 12,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.bold
                              )),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(15.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.0),
                                  color: Color.fromRGBO(215, 215, 215, 0.3), 
                                ),
                                child: Icon(FontAwesomeIcons.pen, color: Color.fromRGBO(215, 215, 215, 1), size: 27.0),
                              ),
                              SizedBox(height: 7),
                              Text('EDIT INFO', style: TextStyle(
                                color: Color.fromRGBO(215, 215, 215, 1),
                                fontSize: 12,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.bold
                              )),
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                ),
                Expanded(
                  child: Container(
                    // color: Colors.blue,
                    // height: 140.0,
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 70.0,
                          // color: Colors.blue,
                          child: PageView.builder(
                            controller: _pageControllerSlides,
                            itemCount: Slides.length,
                            itemBuilder:  (BuildContext context, int index) {
                              Slide _slide = Slides[index];
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(_slide.icon, color: _slide.color, size: 27.0),
                                      SizedBox(width: 12.0),
                                      Text(_slide.title, style: TextStyle(
                                        fontWeight: FontWeight.bold, 
                                        fontSize: 20.0,
                                        color: Color.fromRGBO(0, 0, 0, 0.7)
                                      )),
                                    ],
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(_slide.text, style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16.0,
                                    color: Colors.black
                                  )),
                                ],
                              );
                            },
                            onPageChanged: (value) {
                              setState(() {
                                currentPage = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 6.0),
                        // _buildBullets(currentPage),
                        Container(
                          // color: Colors.amberAccent,
                          height: 20.0,
                          width: MediaQuery.of(context).size.width / 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: Slides
                              .asMap()
                              .entries
                              .map((MapEntry map) => _createBullet(map.key, currentPage))
                              .toList()
                          )
                        ),
                        SizedBox(height: 10.0),
                        RaisedButton(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0),
                          elevation: 1.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.horizontal(left: Radius.circular(100.0), right: Radius.circular(100.0))
                          ),
                          child: Text('BUY TINDER PLUS', style: TextStyle(
                            foreground: Paint()..shader = linearGradient,
                            fontSize: 16.0,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.bold
                          )),
                          onPressed: () {
                            print('buy');
                          },
                        ),
                      ],
                    ),
                  ),  
                ),  
              ],
            ),
            SwipeWiget(),
            MatchesWidget(),
          ],
          onPageChanged: (value) {
            setState(() {
              currentPageView = value;
            });
          },
        ),
      ),
    );
  }
}