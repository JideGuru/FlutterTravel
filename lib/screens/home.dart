import 'package:flutter/material.dart';
import 'package:flutter_travel_concept/screens/details.dart';
import 'package:flutter_travel_concept/widgets/icon_badge.dart';
import 'package:flutter_travel_concept/util/places.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchControl = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: IconBadge(
              icon: Icons.notifications_none,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Where are you \ngoing?",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey[50],
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: TextField(
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.blueGrey[300],
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: "E.g: New York, United States",
                  prefixIcon: Icon(
                    Icons.location_on,
                    color: Colors.blueGrey[300],
                  ),
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: Colors.blueGrey[300],
                  ),
                ),
                maxLines: 1,
                controller: _searchControl,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, left: 20),
            height: 250,
//            color: Colors.red,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              primary: false,
              itemCount: places == null ? 0 : places.length,
              itemBuilder: (BuildContext context, int index) {
                Map place = places.reversed.toList()[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    child: Container(
                      height: 250,
                      width: 140,
//                      color: Colors.green,
                      child: Column(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "${place["img"]}",
                              height: 178,
                              width: 140,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 7),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${place["name"]}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              maxLines: 2,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(height: 3),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${place["location"]}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.blueGrey[300],
                              ),
                              maxLines: 1,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return Details();
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: ListView.builder(
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: places == null ? 0 : places.length,
              itemBuilder: (BuildContext context, int index) {
                Map place = places[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: InkWell(
                    child: Container(
                      height: 70,
//                    color: Colors.red,
                      child: Row(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset(
                              "${place["img"]}",
                              height: 70,
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 15),
                          Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width - 130,
                            child: ListView(
                              primary: false,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "${place["name"]}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                    maxLines: 2,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.location_on,
                                      size: 13,
                                      color: Colors.blueGrey[300],
                                    ),
                                    SizedBox(width: 3),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "${place["location"]}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: Colors.blueGrey[300],
                                        ),
                                        maxLines: 1,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "${place["price"]}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    maxLines: 1,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return Details();
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
