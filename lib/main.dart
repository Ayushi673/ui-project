import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onboardingui/screens/appointment.dart';
void main()
{
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title:"Creating UI widgets",
      home: Page1()
  )
  );
}

class Page1 extends StatelessWidget {

  Future navigateToSubPage(context) async {
    Navigator.push(context,
        MaterialPageRoute(
            builder: (context) => Page2()
        )
    );
  }
  final String dogUrl = 'images/undraw_medicine_b1ol.svg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFE1F6FF),
        //0xFF99D1D1
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 100),
              SizedBox(
                child: SvgPicture.asset(
                  dogUrl,
                  placeholderBuilder: (context) => CircularProgressIndicator(),
                  height: 250.0,
                  width: 160,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:50),
                child: Text('Appointment',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),),
              ),
              SizedBox(height:20),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Text(subtitle(1), textAlign: TextAlign.center,),
              ),
              CustomButton(
                  buttontext: 'Next',
                  pressed: (){
                print('pressed');
                navigateToSubPage(context);
              })
            ],
          ),
        ),
      )
    );
  }
}
class Page2 extends StatelessWidget {
  Future navigateToSubPage(context) async {
    Navigator.push(context,
        MaterialPageRoute(
            builder: (context) => Page3(),
        )
    );
  }
  final String svg2 = 'images/undraw_medical_care_movn.svg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Color(0xFFFBEDE3),//
          child: Center(
            child: Column(
              children: <Widget>[
                TopButton(),
                SizedBox(height: 100),
                SizedBox(
                  child: SvgPicture.asset(
                    svg2,
                    placeholderBuilder: (context) => CircularProgressIndicator(),
                    height: 230.0,
                    width: 160,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:50),
                  child: Text('Prescription Drugs',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),),
                ),
                SizedBox(height:20),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Text(subtitle(2),
                    textAlign: TextAlign.center,),
                ),
                CustomButton(
                   buttontext: 'Next',
                    pressed: (){
                  print('pressed');
                  navigateToSubPage(context);
                })
              ],
            ),
          ),
        )
    );
  }
}

class Page3 extends StatelessWidget {

  Future navigateToApptPage(context) async {
    Navigator.push(context,
        MaterialPageRoute(
          builder: (context) => Appointment(),
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                TopButton(),
                SizedBox(height: 100),
                SizedBox(
                  child: Image.asset('images/druginfo.jpg')
                ),
                Padding(
                  padding: const EdgeInsets.only(top:50),
                  child: Text('Drug Informatics',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),),
                ),
                SizedBox(height:20),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Text(subtitle(3),
                    textAlign: TextAlign.center,),
                ),
                CustomButton(pressed: (){
                  print('pressed');
                  navigateToApptPage(context);
                },
                buttontext:'Get Started',)
              ],
            ),
          ),
        )
    );
  }
}

class TopButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            child: Icon(Icons.arrow_back_ios),
            onTap: (){
              Navigator.pop(context);
            }
          ),
          Icon(Icons.looks_one),
        ],
      ),
    );
  }
}


class CustomButton extends StatelessWidget {
  CustomButton({@required this.pressed, @required this.buttontext});
  final pressed;
  final String buttontext;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FlatButton(
            onPressed: (){
             //TODO
            },
            padding: EdgeInsets.only(left:10, right: 10),
            child: Text('SKIP'),
          ),
          RaisedButton(
            padding: EdgeInsets.only(left: 40,right: 40),
            onPressed: pressed,
            color: Colors.deepPurple,
            shape: const StadiumBorder(),
            child: Row(
              children: <Widget>[
                Text(buttontext, style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(width: 10),
                Icon(Icons.arrow_forward, color: Colors.white,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
String a,b;
String subtitle(int n){
  if(n==1)
    return 'For any health questions, our doctors are ready to help. Doctorfinder is the largest website where people can get answers from Doctors';
  else if(n==2)
    return 'Get prescribed drugs from our doctors. Doctorfinder is the largest website where people can get answers from Doctors';
  else
    return 'All the relevant information about prescribed drugs are available. Doctorfinder is the largest website where people can get answers from Doctors';
}