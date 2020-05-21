import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pageview_test/Douban/screens/destination_screen.dart';
import '../models/destination_model.dart';

class DestinationCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Top Destinations',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,letterSpacing: 1.5),),
              Text('See All',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w600,color: Theme.of(context).primaryColor,letterSpacing: 1.0),)
            ],
          ),
        ),
        Container(
          height: 300.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: destinations.length,
            itemBuilder: (ctx,index){
              Destination destination = destinations[index];
              return Container(
                width: 210.0,
                margin: EdgeInsets.all(10.0),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom:15.0,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx)=>DestinationScreen(destination:destination,)
                          ));
                        },
                        child: Container(
                          height: 120.0,
                          width: 200.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('${destination.activities.length} activities',style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.w600,letterSpacing: 1.2),),
                                Text(destination.description,style: TextStyle(color: Colors.grey),)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0,2.0),
                          blurRadius: 6.0
                        )]
                      ),
                      child: Stack(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Hero(
                                tag: destination.imageUrl,
                                child: Image.asset('${destination.imageUrl}',width: 180.0,height: 180.0,fit: BoxFit.cover,)),
                          ),
                          Positioned(
                            left: 10.0,
                            bottom: 15.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(destination.city,style: TextStyle(fontSize: 24.0,color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: 1.2),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(FontAwesomeIcons.locationArrow,size: 10.0,color: Colors.white,),
                                    SizedBox(width: 5.0,),
                                    Text(destination.country,style: TextStyle(color: Colors.white),)
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
              }
          ),
        ),
      ],
    );
  }
}
