import 'database.dart';
import 'dart:ui';
import 'package:flutter/material.dart';

class LastPage extends StatefulWidget {
  @override
  _LastPageState createState() => _LastPageState();
}

class _LastPageState extends State<LastPage> {

  List<Widget> itemsData1 = [];

  void getPostsData1() {
    List<dynamic> responseList1 = listdata1;
    List<Widget> listItems = [];
    responseList1.forEach((tag) {
      listItems.add(Container(
          height: 80,
          // margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                    backgroundImage: AssetImage(tag["img"])),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      tag["txt"],
                      style: const TextStyle(fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    SizedBox(height: 3,),
                    Text(
                      tag["on"],
                      style: const TextStyle(fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          )));
    });
    setState(() {
      itemsData1 = listItems;
    });
  }

  List<Widget> itemsData2 = [];

  void getPostsData2() {
    List<dynamic> responseList2 = listdata2;
    List<Widget> listItems2 = [];
    responseList2.forEach((tag1) {
      listItems2.add(Opacity(
        opacity: 0.6,
        child: Container(
            height: 100,
            //     width: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: Image( image: AssetImage(tag1["itemimg"]),),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(tag1["title"],style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),),
                  SizedBox(height: 3),
                  Text(tag1["subtitle"]),
                ],
              ),
            )),
      ));
    });
    setState(() {
      itemsData2 = listItems2;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData1();
    getPostsData2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('images/backg.jpeg'),
            ),
          ),
          child: Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
                    child: Container(
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 30, 30, 20),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundImage: AssetImage('images/face2.jpg'),
                                  radius: 30,
                                ),
                                SizedBox(width:15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 6),
                                      child: Text('Julie Cabrana Lins',
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                        ),),
                                    ),
                                    Text('July 17',style: TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                    ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  Navigator.pop(context);
                                });
                              },
                              child: Icon(
                                Icons.clear,
                                color:Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Text('Sharp Sophistication',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                          ),),
                        SizedBox(height: 10),
                        Text('Kitchen',
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 15),
                        Expanded(
                          child: ListView.builder(
                              itemCount: itemsData1.length,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return itemsData1[index];
                              }
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: itemsData2.length,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return itemsData2[index];
                              }
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}