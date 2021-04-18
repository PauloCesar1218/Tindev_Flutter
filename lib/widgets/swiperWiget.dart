import 'package:flutter/material.dart';
import 'package:flutter_tindev/models/person_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SwipeWiget extends StatefulWidget {
  @override
  SwipeWigetState createState() => SwipeWigetState();
}

BuildContext context;

Widget _createPersonCard(Person person, BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.80,
    width: MediaQuery.of(context).size.width,
    child: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(person.imageUrl, fit: BoxFit.cover),
        ),
        Positioned(
          bottom: 15.0,
          left: 20.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(person.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontFamily: 'Roboto',
                          fontSize: 30.0,
                          letterSpacing: 1.0)),
                  SizedBox(width: 10.0),
                  Text(person.age,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontFamily: 'Roboto',
                          fontSize: 30.0)),
                  SizedBox(width: 10.0),
                  Icon(
                    FontAwesomeIcons.infoCircle,
                    size: 15.0,
                    color: Colors.white,
                  )
                ],
              ),
              SizedBox(height: 5.0),
              Row(
                children: <Widget>[
                  Icon(FontAwesomeIcons.graduationCap,
                      color: Colors.white, size: 10.0),
                  SizedBox(width: 10.0),
                  Text(person.university,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontFamily: 'Roboto',
                          fontSize: 16.0)),
                ],
              ),
              SizedBox(height: 5.0),
              Row(
                children: <Widget>[
                  Icon(FontAwesomeIcons.mapMarkerAlt,
                      color: Colors.white, size: 10.0),
                  SizedBox(width: 10.0),
                  Text(person.location,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontFamily: 'Roboto',
                          fontSize: 16.0)),
                ],
              ),
            ],
          ),
        ),
        // Visibility(
        //   visible: person.likeIcon,
        //   child: Positioned(
        //     top: 80.0,
        //     left: 40.0,
        //     child: Transform.rotate(
        //       angle: -0.4,
        //       child: Container(
        //         padding: EdgeInsets.all(2.0),
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(20.0),
        //             border: Border.all(
        //                 color: Colors.green,
        //                 width: 8.0,
        //                 style: BorderStyle.solid)),
        //         child: Text('LIKE',
        //             style: TextStyle(
        //                 color: Colors.green,
        //                 fontSize: 60.0,
        //                 fontWeight: FontWeight.bold,
        //                 decoration: TextDecoration.none)),
        //       ),
        //     ),
        //   ),
        // ),
        // Visibility(
        //   visible: person.dislikeIcon,
        //   child: Positioned(
        //     top: 80.0,
        //     right: 40.0,
        //     child: Transform.rotate(
        //       angle: 0.4,
        //       child: Container(
        //         padding: EdgeInsets.all(2.0),
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(20.0),
        //             border: Border.all(
        //                 color: Colors.red,
        //                 width: 8.0,
        //                 style: BorderStyle.solid)),
        //         child: Text('NOPE',
        //             style: TextStyle(
        //                 color: Colors.red,
        //                 fontSize: 60.0,
        //                 fontWeight: FontWeight.bold,
        //                 decoration: TextDecoration.none)),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    ),
  );
}

class SwipeWigetState extends State<SwipeWiget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    new BoxShadow(
                        blurRadius: 5.0,
                        color: Color.fromRGBO(215, 215, 215, 1),
                        offset: Offset(0.0, 5.0))
                  ],
                ),
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 4.0),
                height: MediaQuery.of(context).size.height * 0.80,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                    fit: StackFit.expand,
                    children: people.asMap().entries.map((person) {
                      return Draggable<Person>(
                        data: person.value,
                        feedback: _createPersonCard(person.value, context),
                        child: _createPersonCard(person.value, context),
                        childWhenDragging: Container(),
                      );
                    }).toList()),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          color: Colors.white,
                          boxShadow: [
                            new BoxShadow(
                                blurRadius: 10.0,
                                color: Color.fromRGBO(215, 215, 215, 1),
                                offset: Offset(0.0, 10.0))
                          ],
                        ),
                        child: Icon(FontAwesomeIcons.redo,
                            size: 22.0,
                            color: Color.fromRGBO(215, 215, 215, 0.6)),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          color: Colors.white,
                          boxShadow: [
                            new BoxShadow(
                              blurRadius: 10.0,
                              color: Color.fromRGBO(215, 215, 215, 0.6),
                              offset: new Offset(0.0, 10.0),
                            )
                          ],
                        ),
                        child: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return RadialGradient(
                              center: Alignment.topRight,
                              radius: 1.3,
                              colors: <Color>[
                                Colors.pink,
                                Colors.redAccent[200],
                              ],
                              tileMode: TileMode.clamp,
                            ).createShader(bounds);
                          },
                          child: Icon(FontAwesomeIcons.times,
                              size: 32.0, color: Colors.white),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          color: Colors.white,
                          boxShadow: [
                            new BoxShadow(
                              blurRadius: 10.0,
                              color: Color.fromRGBO(215, 215, 215, 0.6),
                              offset: new Offset(0.0, 10.0),
                            )
                          ],
                        ),
                        child: Icon(FontAwesomeIcons.solidStar,
                            size: 22.0,
                            color: Color.fromRGBO(47, 193, 255, 0.9)),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          color: Colors.white,
                          boxShadow: [
                            new BoxShadow(
                              blurRadius: 10.0,
                              color: Color.fromRGBO(215, 215, 215, 0.6),
                              offset: new Offset(0.0, 10.0),
                            )
                          ],
                        ),
                        child: Icon(FontAwesomeIcons.solidHeart,
                            size: 32.0,
                            color: Color.fromRGBO(50, 205, 50, 0.7)),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          color: Colors.white,
                          boxShadow: [
                            new BoxShadow(
                              blurRadius: 10.0,
                              color: Color.fromRGBO(215, 215, 215, 0.6),
                              offset: new Offset(0.0, 10.0),
                            )
                          ],
                        ),
                        child: Icon(Icons.flash_on,
                            size: 22.0,
                            color: Color.fromRGBO(75, 30, 255, 0.9)),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.80,
                    width: MediaQuery.of(context).size.width * 0.25,
                    padding: EdgeInsets.all(10.0),
                    child: DragTarget<Person>(
                      onAccept: (data) {
                        print(people.indexOf(data));
                        int index = people.indexOf(data);
                        setState(() {
                          // people.removeAt(index);
                          data.dislikeIcon = true;
                        });
                      },
                      onWillAccept: (data) {
                        print(people.indexOf(data));
                        setState(() {
                          data.dislikeIcon = true;
                          // _isNopeVisible = true;
                        });
                        return true;
                      },
                      builder: (context, candidateData, rejectedData) {
                        return Container(
                          // color: Colors.red,
                          height: MediaQuery.of(context).size.height * 0.80,
                          width: MediaQuery.of(context).size.width,
                        );
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.80,
                    width: MediaQuery.of(context).size.width * 0.25,
                    padding: EdgeInsets.all(10.0),
                    child: DragTarget<Person>(
                      onAccept: (data) {
                        print(people.indexOf(data));
                        int index = people.indexOf(data);
                        setState(() {
                          // people.removeAt(index);
                          data.likeIcon = true;
                        });
                      },
                      onWillAccept: (data) {
                        print(people.indexOf(data));
                        // setState(() {
                        //   data.likeIcon = true;
                        // });
                        return true;
                      },
                      builder: (context, candidateData, rejectedData) {
                        return Container(
                          // color: Colors.green,
                          height: MediaQuery.of(context).size.height * 0.80,
                          width: MediaQuery.of(context).size.width,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
