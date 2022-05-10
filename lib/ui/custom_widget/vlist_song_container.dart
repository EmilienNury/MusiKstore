// Custom widget for song cards

import 'package:flutter/material.dart';
import 'package:ptut_2/core/model/Songs/song.dart';
import 'package:ptut_2/core/navigation_service.dart';
import 'package:ptut_2/ui/player.dart';

Widget SongVerticalListViewContainer(Song song, BuildContext context) {
  return Column(
    children: [
      InkWell(
        onTap: () async{
          await Navigator.of(NavigationService.navigatorKey.currentContext!).pushNamed(PlayerPage.route, arguments: PlayerPageArguments(music: song));
        },
        child: Container(
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  child: Image.network(song.artworkUrl100!),
                ),
              ),
              SizedBox(width: 12.0,),
              Container(
                width: MediaQuery.of(context).size.width - (12 * 2) - 100 - 12 - 96, //2x 12 for left and right padding, 100 for image width, 12 for the Sizebox's width above, and 96 for icon buttons
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      song.name!,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w800
                      ),
                      overflow: TextOverflow.clip,
                    ),
                    SizedBox(height: 12.0,),
                    Text(
                      song.artistName!,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w300
                      ),
                      overflow: TextOverflow.clip,
                    )
                  ],
                ),
              ),
              IconButton( icon: Icon(Icons.favorite_border, color: Colors.white,), onPressed: () {
                //TODO: implement
              }),
              IconButton( icon: Icon(Icons.playlist_add, color: Colors.white,), onPressed: () {
                //TODO: implement
              })
            ],
          ),
        ),
      ),
      SizedBox(height: 12.0,),
    ],
  );
}