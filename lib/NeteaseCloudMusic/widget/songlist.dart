import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pageview_test/NeteaseCloudMusic/pages/music/music.dart';
import '../model/artsongs.dart';

class buildSongs extends StatelessWidget {
  const buildSongs({
    Key key,
    @required this.artSongs,
  }) : super(key: key);

  final ArtSongs artSongs;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      itemCount: artSongs.songs.length,
      itemBuilder: (ctx, index) {
        var item = artSongs.songs[index];

        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => MusicPage(
                      id: item.id,
                      name: item.ar[0].name,
                      songName: item.name,
                      imgUrl: item.al.picUrl,
                    )));
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 70.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
            color: Color(0xFFF3F5F7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.network(
                      item.al.picUrl + '?param=40y40',
                      width: 40,
                      height: 40,
                    ),
                    Container(
                      width: 210.0,
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      height: 70.0,
//                        color: Colors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            item.name,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(item.al.name,overflow: TextOverflow.ellipsis,)
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(FontAwesomeIcons.youtube),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Image.asset(
                        'assets/images/Netease/detail/gengduo.png',
                        color: Colors.grey,
                      ),
                      onPressed: () {},
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
