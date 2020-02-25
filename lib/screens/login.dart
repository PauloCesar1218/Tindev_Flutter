import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(FontAwesomeIcons.arrowLeft, color: Colors.redAccent, size: 25.0,),
                SizedBox(height: 35.0,),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Login by email', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontSize: 30.0,
                      )),
                      SizedBox(height: 60.0),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Enter your email',
                                contentPadding: EdgeInsets.only(left: 10.0),
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black54,

                                )
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 5.0,),
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Password',
                                contentPadding: EdgeInsets.only(left: 10.0),
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black54,
                                ),
                              ),
                              style: TextStyle(
                                color: Colors.black
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 10.0),
                            Text('Forgot your password', style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.black45
                            )),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: RaisedButton(
                                color: Colors.black12,
                                elevation: 0,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                                child: Ink(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(80.0)),
                                  ),
                                  child: Container( // min sizes for Material buttons
                                    height: 50.0,
                                    alignment: Alignment.center,
                                    child: Text('Login', style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black26,
                                      letterSpacing: 1.0
                                    )),
                                  ),
                                ),
                                onPressed: () {
                                  // Validate will return true if the form is valid, or false if
                                  // the form is invalid.
                                  if (_formKey.currentState.validate()) {
                                    // Process data.
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ) 
        ),
      ),
    );
  }
}