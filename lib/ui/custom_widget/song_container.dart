// Custom widget for song cards

import 'package:flutter/material.dart';

Widget SongContainer(String imageUrl, String songName, String artistName) {
  return Container(
    child: InkWell(
      onTap: () {},
      child: Container(
        width: 140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                height: 140.0,
                width: 140.0,
                child: Image.network(imageUrl, fit: BoxFit.fill,),
              ),
            ),
            const SizedBox(height: 12.0,),
            Text(
              songName,
              style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 22.0
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12.0,),
            Text(
              artistName,
              style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 18.0
              ),
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      )
    ),
  );
}