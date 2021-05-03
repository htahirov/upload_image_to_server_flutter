import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_upload_flutter/screens/account_screen.dart';
import 'package:image_upload_flutter/extracts.dart';
import 'dart:convert';
import 'package:image_upload_flutter/screens/upload_image_screen.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'main_screen';
  final String getUsername;
  MainScreen({this.getUsername});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var data;
  int currentIndex = 0;

  Future getImage() async {
    var uri = Uri.parse("${URL.url}show_image.php");
    var response = await http.get(uri);
    data = json.decode(response.body);
    return data;
  }

  @override
  void initState() {
    super.initState();
    getImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffffffff),
        leading: Icon(Icons.add_a_photo_outlined),
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Instagram',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
            child: Icon(Icons.message_outlined),
          )
        ],
        actionsIconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
            height: 50,
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 50,
                  child: Icon(
                    Icons.add,
                    size: 30,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 3,
                      color: Color(0xFF8D33B6),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/xxx.jpg'),
                    ),
                    border: Border.all(
                      width: 3,
                      color: Color(0xFF8D33B6),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/avatar.png'),
                    ),
                    border: Border.all(
                      width: 3,
                      color: Color(0xFF8D33B6),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/lion.jpg'),
                    ),
                    border: Border.all(
                      width: 3,
                      color: Color(0xFF8D33B6),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/girl.jpg'),
                    ),
                    border: Border.all(
                      width: 3,
                      color: Color(0xFF8D33B6),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/avatar.png'),
                    ),
                    border: Border.all(
                      width: 3,
                      color: Color(0xFF8D33B6),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/xxx.jpg'),
                    ),
                    border: Border.all(
                      width: 3,
                      color: Color(0xFF8D33B6),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/girl.jpg'),
                    ),
                    border: Border.all(
                      width: 3,
                      color: Color(0xFF8D33B6),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/avatar.png'),
                    ),
                    border: Border.all(
                      width: 3,
                      color: Color(0xFF8D33B6),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
              ],
            ),
          ),
          FutureBuilder(
              future: getImage(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? Expanded(
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: snapshot.data['description'].length,
                          itemBuilder: (context, index) {
                            List list = snapshot.data['description'];
                            return Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage:
                                              AssetImage('images/avatar.png'),
                                          backgroundColor: Colors.white,
                                        ),
                                        SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget.getUsername,
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            Text(
                                              'Azerbaijan',
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Icon(Icons.more_horiz),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    height: 300,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image: NetworkImage(
                                            "${URL.url}uploads/${list[index]['image']}"),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Row(
                                      children: [
                                        Icon(Icons.favorite_outline),
                                        SizedBox(width: 10),
                                        Icon(Icons.comment_outlined),
                                        SizedBox(width: 10),
                                        Icon(Icons
                                            .subdirectory_arrow_right_outlined),
                                        Spacer(),
                                        Icon(Icons.save_alt_outlined),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      'Likes 666',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    height: 30,
                                    width: double.infinity,
                                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  ),
                                  Container(
                                    height: 40,
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              '${widget.getUsername} ',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              list[index]['aboutImage'],
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          list[index]['created_at'],
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              }),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        elevation: 0,
        currentIndex: currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(
              Icons.home,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(Icons.search_outlined),
            activeIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            label: "Add",
            icon: GestureDetector(
              child: Icon(Icons.add_box_outlined),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ImageUpload(username: widget.getUsername)),
                );
              },
            ),
            activeIcon: Icon(
              Icons.add_box,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            label: "Likes",
            icon: Icon(Icons.favorite_border_outlined),
            activeIcon: Icon(
              Icons.favorite,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            label: "Account",
            icon: GestureDetector(
              child: Icon(Icons.person_outline),
              onTap: () {
                Navigator.pushNamed(context, AccountScreen.id);
              },
            ),
            activeIcon: Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
        ],
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
