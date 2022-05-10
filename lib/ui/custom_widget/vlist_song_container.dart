// Custom widget for song cards

import 'package:flutter/material.dart';

Widget SongVerticalListViewContainer(String imageUrl, String songName, String artistName, BuildContext context) {
  return Column(
    children: [
      InkWell(
        onTap: () {},
        child: Container(
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  child: Image.network(imageUrl),
                ),
              ),
              SizedBox(width: 12.0,),
              Container(
                width: MediaQuery.of(context).size.width - (12 * 2) - 100 - 12 - 96, //2x 12 for left and right padding, 100 for image width, 12 for the Sizebox's width above, and 96 for icon buttons
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      songName,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w800
                      ),
                      overflow: TextOverflow.clip,
                    ),
                    SizedBox(height: 12.0,),
                    Text(
                      artistName,
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