import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/hotel_model.dart';

class HotelCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Exclusive Hotels',style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold,letterSpacing: 1.5),),
              Text('See All',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w600,color: Theme.of(context).primaryColor,letterSpacing: 1.0),)
            ],
          ),
        ),
        Container(
          height: 300.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: hotels.length,
              itemBuilder: (ctx,index){
                Hotel hotel = hotels[index];
                return Container(
                  width: 270.0,
                  margin: EdgeInsets.all(10.0),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        bottom:15.0,
                        child: Container(
                          height: 120.0,
                          width: 270.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('${hotel.name}',style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.w600,letterSpacing: 1.2),),
                                Text(hotel.address,style: TextStyle(color: Colors.grey),),
                                Text('\$${hotel.price}/night',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),)
                              ],
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset('${hotel.imageUrl}',width: 250.0,height: 180.0,fit: BoxFit.cover,),
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
