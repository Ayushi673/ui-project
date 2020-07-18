import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {

  Future navigateToLastPage(context) async {
    Navigator.push(context,
        MaterialPageRoute(
          builder: (context) => LastPage(),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      child: CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.purple,
                          child: Center(
                              child: Icon(
                                Icons.navigate_before,
                                color: Colors.white,))),
                      onTap: (){
                        Navigator.pop(context);
                        print('pressed');
                      },
                    ),
                    Center(child: Text('Discover',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),)),
                    IconButton(
                        icon: Icon(Icons.search, semanticLabel: 'next',),
                        onPressed: (){
                          print('Pressed');
                          //   Navigator.pop(context);
                        }
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.hdr_strong, size:30),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('Main Features', style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),),
                          Icon(Icons.keyboard_arrow_down, color:Colors.grey),
                        ],
                      ),
                      SizedBox(height: 3),
                      Text('Listing', style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.border_all,size: 35,color: Colors.grey,),
                      Icon(Icons.assessment,size: 35,color: Colors.grey,),
                    ],
                  ),
                ],
              ),
              SizedBox(height:20),
              GestureDetector(
                  onTap: (){
                    print('Tapped2');
                    navigateToLastPage(context);
                  },
                  child: CustomTab()),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: new LinearGradient(colors: [
            Color(0xFF710193),
            Color(0xFFF7F0FA),
          ],
            begin: Alignment.topCenter,
            // end: new Alignment(-1, 1),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Opacity(
              opacity: 0.4,
              child:Container(
                child: Image.asset('images/bg2.jpg'),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: StackItems(),
                ),
                SizedBox(height: 265),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Opacity(
                        opacity: 0.5,
                        child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          onPressed: (){
                            print('tapped');
                          },
                          child: Icon(Icons.add,color: Colors.black,),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        )
    );
  }
}

int m=1;
IconData like= Icons.favorite;
IconData nolike= Icons.favorite_border;
class StackItems extends StatefulWidget {
  @override
  _StackItemsState createState() => _StackItemsState();
}

class _StackItemsState extends State<StackItems> {

  IconData likepost(int a){
    if(a%2==0){
      return nolike;
    }
    else{
      return like;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom:30),
          child: Row(
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
                      ),),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    m++;
                  });
                },
                child: Icon(
                  likepost(m),
                  color:Colors.white,
                ),
              ),
            ],
          ),
        ),
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
      ],
    );
  }
}


class LastPage extends StatefulWidget {
  @override
  _LastPageState createState() => _LastPageState();
}

class _LastPageState extends State<LastPage> {
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
                  padding: EdgeInsets.fromLTRB(10, 20, 20, 10),
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
