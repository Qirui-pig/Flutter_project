import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pageview_test/Douban/models/destination_model.dart';
import '../models/activity_model.dart';


class DestinationScreen extends StatefulWidget {
  final Destination destination;

  DestinationScreen({this.destination});

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[

              Container(
                height: 350.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [BoxShadow(
                      color:Colors.black26,
                      offset: Offset(0.0,2.0),
                      blurRadius: 6.0
                  )],
                ),
                child: Hero(
                  tag: widget.destination.imageUrl,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.zero,topRight: Radius.zero,bottomRight: Radius.circular(30.0),bottomLeft: Radius.circular(30.0)),
                      child: Image.asset(widget.destination.imageUrl,fit: BoxFit.cover,)),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30.0,
                      color: Colors.black,
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    ),
                    Row(

                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.search),
                          iconSize: 30.0,
                          color: Colors.black,
                          onPressed: (){},
                        ),
                        IconButton(
                          icon: Icon(FontAwesomeIcons.sortAlphaDown),
                          iconSize: 23.0,
                          color: Colors.black,
                          onPressed: (){},
                        )
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                left: 40.0,
                bottom: 35.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.destination.city,style: TextStyle(fontSize: 30.0,color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: 1.2),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(FontAwesomeIcons.locationArrow,size: 15.0,color: Colors.white,),
                        SizedBox(width: 5.0,),
                        Text(widget.destination.country,style: TextStyle(color: Colors.white,fontSize: 20),)
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                right: 20.0,
                bottom: 35.0,
                child: Icon(Icons.location_on,size: 30,color: Colors.white,),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
//              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(15.0),
              itemCount: widget.destination.activities.length,
              itemBuilder: (ctx,index){
                Activity activity = widget.destination.activities[index];
              return Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.fromLTRB(150.0, 20.0, 20.0, 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: 120.0,
                              child: Text(activity.name,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w600,),overflow: TextOverflow.ellipsis,maxLines: 2,),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('\$${activity.price}',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.w600),),
                                Text('per pax',style: TextStyle(fontSize: 16,color: Colors.grey),)
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 5.0,),
                        Text(activity.type,style: TextStyle(color: Colors.grey),),
                        SizedBox(height: 5.0,),
                        BuilderStart(activity.rating),
                        SizedBox(height: 5.0,),
                        Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(5.0),
                              width:70.0,
                              decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                                borderRadius: BorderRadius.circular(10.0)
                              ),
                              alignment: Alignment.center,
                              child: Text(activity.startTimes[0]),
                            ),
                            SizedBox(width: 7,),
                            Container(
                              padding: EdgeInsets.all(5.0),
                              width:70.0,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).accentColor,
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              alignment: Alignment.center,
                              child: Text(activity.startTimes[1]),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    left:15.0,
                    top:5.0,
                    bottom:15.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(activity.imageUrl,width: 110.0,fit: BoxFit.cover,),
                    ),
                  )
                ],
              );
            }),
          )
        ],
      ),
    );
  }
  Widget BuilderStart(int count){
    String start = '';

    for(int i = 0 ;i < count;i++){
      start += '⭐';
    }
    start.trim();
    return Text(start);
  }
}

