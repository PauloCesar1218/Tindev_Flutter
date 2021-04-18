import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_tindev/controllers/loginController.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final lc = new LoginController();
  Color loginBtnColor = Colors.black12;
  Color loginBtnTextColor = Colors.black26;
  BuildContext dialogContext;
  // (0xffFD297B)

  @override
  void initState() {
    super.initState();
    getToken();
  }

  Future getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print(token);
    return token;
  }

  void changeColors(email, password) {
    if (email.length > 0 && password.length > 7) {
      loginBtnColor = Color(0xffFD297B);
      loginBtnTextColor = Colors.white;
    } else {
      loginBtnColor = Colors.black12;
      loginBtnTextColor = Colors.black26;
    }
  }

  void storeAccessToken(token) async {
    print(token);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  Widget createLoagingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        dialogContext = context;
        return Dialog(
          child: new Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xffFE3C72)),
                strokeWidth: 2,
              ),
              Text("Loading"),
            ],
          ),
        );
      },
    );
  }

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
              IconButton(
                  icon: Icon(
                    FontAwesomeIcons.arrowLeft,
                    color: Colors.redAccent,
                    size: 25.0,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/');
                  }),
              SizedBox(
                height: 35.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Login by email',
                        style: TextStyle(
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
                            controller: emailController,
                            decoration: const InputDecoration(
                              hintText: 'Enter your email',
                              contentPadding: EdgeInsets.only(left: 10.0),
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.black54,
                              ),
                            ),
                            style: TextStyle(color: Colors.black),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Por favor preencha este campo!';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                changeColors(emailController.value.text,
                                    passwordController.value.text);
                              });
                            },
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: 'Password',
                              contentPadding: EdgeInsets.only(left: 10.0),
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.black54,
                              ),
                            ),
                            style: TextStyle(color: Colors.black),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Por favor preencha este campo!';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                changeColors(emailController.value.text,
                                    passwordController.value.text);
                              });
                            },
                          ),
                          SizedBox(height: 10.0),
                          Text('Forgot your password',
                              style: TextStyle(
                                  fontSize: 10.0, color: Colors.black45)),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: RaisedButton(
                              color: loginBtnColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80.0)),
                              child: Container(
                                // min sizes for Material buttons
                                height: 50.0,
                                alignment: Alignment.center,
                                child: Text('Login',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: loginBtnTextColor,
                                        letterSpacing: 1.0)),
                              ),
                              onPressed: () async {
                                createLoagingDialog();
                                // Validate will return true if the form is valid, or false if
                                // the form is invalid.
                                if (_formKey.currentState.validate()) {
                                  var response = await lc.login(
                                      emailController.value.text,
                                      passwordController.value.text);
                                  if (response) {
                                    storeAccessToken(response);
                                    Navigator.pop(dialogContext);
                                    Navigator.of(context).pushNamed('/swiper');
                                  } else {
                                    Navigator.pop(dialogContext);
                                  }
                                } else {
                                  Navigator.pop(dialogContext);
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
        )),
      ),
    );
  }
}
