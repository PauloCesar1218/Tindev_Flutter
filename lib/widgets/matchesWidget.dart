import 'package:flutter/material.dart';
import 'package:flutter_tindev/models/person_model.dart';

class MatchesWidget extends StatefulWidget {
  MatchesWidget({Key key}) : super(key: key);

  @override
  _MatchesWidgetState createState() => _MatchesWidgetState();
}

class _MatchesWidgetState extends State<MatchesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(width: 3),
              Icon(
                Icons.search,
                color: Colors.redAccent,
                size: 26,
              ),
              SizedBox(width: 8),
              Expanded(
                child: TextFormField(
                  decoration: new InputDecoration(
                    hintText: 'Search 5 matches',
                    contentPadding: EdgeInsets.only(left: 10.0),
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(215, 215, 215, 1),
                        fontSize: 18),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                  ),
                  style: TextStyle(color: Colors.black),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Por favor preencha este campo!';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Opacity(
            opacity: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('New Matches',
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
                SizedBox(height: 30),
                Container(
                  height: 200,
                  padding: EdgeInsets.only(left: 10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: people.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100.0),
                                child: Image.asset(people[index].imageUrl,
                                    fit: BoxFit.cover,
                                    height: 75.0,
                                    width: 75.0),
                              ),
                              SizedBox(height: 5),
                              Text(people[index].name,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.4)),
                            ],
                          ),
                          SizedBox(width: 20)
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
