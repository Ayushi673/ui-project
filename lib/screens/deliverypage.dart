import 'package:flutter/material.dart';

class DeliveryPage extends StatefulWidget {
  @override
  _DeliveryPageState createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {

  final generatedList = List.generate(10, (index) => 'Delivery Item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        //controller: ScrollController(initialScrollOffset: _itemExtent * 401),
        slivers: <Widget>[
          SliverAppBar(
            leading: GestureDetector(
                onTap: (){
                  print('tapped');
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back,color: Colors.black,)),
            backgroundColor: Colors.white,
            pinned: true,
            expandedHeight: 270,
            flexibleSpace:  FlexibleSpaceBar(
              background: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 80, 15, 20),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.shopping_cart, size: 30),
                            SizedBox(width: 20,),
                            Text('MG 2256 156 42', style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.purple.shade800,
                          ),
                          child: CustomDeliveryBar(),
                        ),
                      ],
                    ),
                  )
              ),
            ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate((context,index)=>
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.check_circle, color:Colors.lightGreen),
                      SizedBox(width: 25,),
                      Text(
                        generatedList[index],
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
              ),
            childCount: generatedList.length,
          ),
          ),
        ],
      ),
    );
  }
}


class CustomDeliveryBar extends StatefulWidget {
  @override
  _CustomDeliveryBarState createState() => _CustomDeliveryBarState();
}

class _CustomDeliveryBarState extends State<CustomDeliveryBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('from\nAmerica,Houston',style: CustomStyle),
                Icon(Icons.local_grocery_store,color: Colors.white,size: 22,),
                Text('To\nCanada,Toronto',style: CustomStyle),
              ],
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Type\nTransit', style: CustomStyle),
                Text('Weight\nDeparture',style: CustomStyle,),
                Text('Status\n890g',style: CustomStyle),
              ],
            ),
          ],
        ),),
    );
  }
}
const CustomStyle= TextStyle(
  fontSize: 15,
  color: Colors.white,
);
