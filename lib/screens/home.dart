import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset("assets/images/girl.jpg", fit: BoxFit.cover),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Color(0xFFF001117).withOpacity(0.5),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.fire, color: Colors.white, size: 40.0,),
                      SizedBox(width: 10.0),
                      Text('Tindev', style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0 
                      )),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 50.0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  color: Colors.transparent
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'By tapping the button below, you agree with our ',
                          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600, letterSpacing: 1.0),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Terms',
                              style: TextStyle(decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()..onTap = () => print('terms'),
                            ),
                            TextSpan(text: ' and '),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()..onTap = () => print('Privacy Policy'),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xFFF001117).withOpacity(0.5),
                            borderRadius: BorderRadius.horizontal(left: Radius.circular(35.0), right: Radius.circular(35.0)),
                            border: Border.all(width: 2.0, color: Colors.white)
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
                            child: Text('GET STARTED', style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 3.5
                            )),
                          )
                        ),
                        onTap: () {
                          print('Get Started');
                          Navigator.of(context).pushNamed('/login');
                        },
                      ),
                      Text('Trouble logging in?', style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 20.0
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
    );
    
  }
}