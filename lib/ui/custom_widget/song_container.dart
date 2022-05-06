// Custom widget for song cards
import 'package:flutter/material.dart';
import 'package:ptut_2/core/model/Songs/song.dart';
import 'package:ptut_2/core/navigation_service.dart';

import '../player.dart';

Widget SongContainer(Song song) {
  return Container(
    child: InkWell(
      onTap: () async{
        await Navigator.of(NavigationService.navigatorKey.currentContext!).pushNamed(PlayerPage.route, arguments: PlayerPageArguments(music: song));
      },
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
                child: Image.network(song.artworkUrl100 ?? "", fit: BoxFit.fill,),
              ),
            ),
            const SizedBox(height: 12.0,),
            Text(
              song.name ?? "",
              style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 22.0
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12.0,),
            Text(
              song.artistName ?? "",
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