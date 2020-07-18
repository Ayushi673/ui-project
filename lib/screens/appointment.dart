import 'dart:math';
import 'database.dart';
import 'package:flutter/material.dart';
import 'discover.dart';

class Appointment extends StatefulWidget {
  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  Future navigateToDiscover(context) async {
    Navigator.push(context,
        MaterialPageRoute(
          builder: (context) => Discover(),
        )
    );
  }
  List<Widget> itemsData = [];

  void getPostsData() {
    List tilecolors = [Colors.cyan.shade100, Colors.orange.shade100, Colors.deepPurple.shade100];
    List textcolors =[Colors.cyan, Colors.orange, Colors.deepPurple];
    int index=0,j=0,k=0;
    List<dynamic> responseList = listdata;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Container(
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: tilecolors[index++],
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100),
                    blurRadius: 1.0),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      post["meetid"],
                      style: TextStyle(fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: textcolors[j++]),
                    ),
                    Text(
                      post["day"],
                      style: const TextStyle(fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  post["time"],
                  style: const TextStyle(fontSize: 17, color: Colors.grey),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CustomUsers(),
                    CustomIcons(colour: textcolors[k++]),
                  ],
                ),
              ],
            ),
          )));
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          child: Column(
            children:[
              Padding(
                padding: const EdgeInsets.only(top:10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      child: Icon(Icons.navigate_before),
                      onTap: (){
                        //    Navigator.pop(context);
                        print('pressed');
                      },
                    ),
                    Center(child: Text('Appointments',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),)),
                    IconButton(
                        icon: Icon(Icons.navigate_next, semanticLabel: 'next',),
                        onPressed: (){
                          print('Pressed');
                          navigateToDiscover(context);
                        }
                    )
                  ],),
              ),
              Padding(
                padding: const EdgeInsets.only(left:10,right:10,bottom: 4),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Search',
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: itemsData.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return itemsData[index];
                    }
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                    child: Column(
                      children: <Widget>[
                        FlatButton(onPressed: (){
                          print('pressed');
                        },
                            color: Colors.deepPurple.shade100,
                            child: Icon(Icons.add, size: 30,)),
                        SizedBox(height: 5),
                        Text('Add New Task',style: TextStyle(
                          color: Colors.deepPurple.shade100,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  CustomCard({@required this.colour,this.cardChild});
  final Color colour;
  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

Color activecol=Colors.white;
Color inactivecol=Colors.grey.shade300;

class CustomIcons extends StatefulWidget {
  CustomIcons({@required this.colour});
  final Color colour;

  @override
  _CustomIconsState createState() => _CustomIconsState();
}

class _CustomIconsState extends State<CustomIcons> {
  Color card1=inactivecol;

  Color card2=inactivecol;

  Color card3=inactivecol;

  void selectIcon(int a){
    if(a==1){
      card1=activecol;
      card2=inactivecol;
      card3=inactivecol;
    }
    else if(a==2){
      card1=inactivecol;
      card2=activecol;
      card3=inactivecol;
    }
    else if(a==3){
      card1=inactivecol;
      card2=inactivecol;
      card3=activecol;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 10,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          children: <Widget>[
            GestureDetector(onTap: (){
              setState(() {
                selectIcon(1);
                print("ONE");
              });
            },
                child: Container(
                  color:card1,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Icon(Icons.phone,color:widget.colour),
                  ),
                )),
            GestureDetector(onTap: (){
              setState(() {
                selectIcon(2);
                print("TW0");
              });
            },
                child: Container(
                  color:card2,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Icon(Icons.video_call,color:widget.colour),
                  ),
                )),
            GestureDetector(onTap: (){
              setState(() {
                selectIcon(3);
                print("THREE");
              });
            },
                child: Container(
                  color:card3,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Icon(Icons.chat_bubble,color:widget.colour),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class CustomUsers extends StatefulWidget {
  @override
  _CustomUsersState createState() => _CustomUsersState();
}

class _CustomUsersState extends State<CustomUsers> {
  int r = Random().nextInt(3)+1;
  int ran= Random().nextInt(3)+1;
  void getimg(){
    if( r == ran){
      if(r==3){
        r=r-1;
      }
      else if(r>=1 && r<3){
        r=r+1;
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    getimg();
    return Container(
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage('images/ayushimg.JPG'),
            radius: 20,
          ),
          CircleAvatar(
            backgroundImage: AssetImage('images/face$ran.jpg'),
            radius: 20,
          ),
          CircleAvatar(
            backgroundImage: AssetImage('images/face$r.jpg'),
            radius: 20,
          ),
        ],
      ),
    );
  }
}



