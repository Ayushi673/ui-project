import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:onboardingui/screens/deliverypage.dart';
import 'discover2.dart';
import 'bonuspage.dart';

class Discover extends StatelessWidget {
  final controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PageView(
          children: <Widget>[
            Page1(),
            Page2(),
            LastPage(),
            DeliveryPage(),
          ],
        ),
      ),
    );
  }
}

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
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
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.hdr_weak, size:30),
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
                    print('Tapped');
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
            Color(0xFF008080),
            Color(0xFFE0F2F1),
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
                child: Image.asset('images/bg1.jpg'),
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
                    backgroundImage: AssetImage('images/face3.jpg'),
                    radius: 30,
                  ),
                  SizedBox(width:15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Text('Steve Sans Piro',
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),),
                      ),
                      Text('June 25',style: TextStyle(
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
        Text('Positive Mindset',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),),
        SizedBox(height: 10),
        Text('Office',
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
