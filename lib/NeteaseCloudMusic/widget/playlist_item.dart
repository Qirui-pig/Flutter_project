import 'package:flutter/material.dart';
import 'dart:math';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../pages/playListDetail/playListDetail.dart';
import 'package:cached_network_image/cached_network_image.dart';

class JumpToDetail extends StatelessWidget {
  const JumpToDetail({
    Key key,
    @required this.item,
    this.dWidth,
  }) : super(key: key);

  final item;
  final double dWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => PlayListDetail(id: item.id, name: item.name),
        ));
      },
      child: Container(
        margin: EdgeInsets.all(7.0),
        width: this.dWidth,
        height: 225,
//                    color: Colors.blue,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  child: CachedNetworkImage(
                    imageUrl: item.coverImgUrl + '?param=200y200',
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    width: dWidth,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                Positioned(
                  right: 5,
                  top: 5,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.solidPlayCircle,
                        size: 17,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        '${Random().nextInt(100)}万',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.end,
                  ),
                )
              ],
            ),
            Container(
              width: 150,
              height: 50,
              margin: EdgeInsets.all(6.0),
//                          color: Colors.red,
              child: Text(
                item.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
