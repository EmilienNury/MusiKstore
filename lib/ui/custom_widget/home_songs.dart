//Widget that display listview of songs

import 'package:flutter/material.dart';
import 'package:ptut_2/ui/custom_widget/song_container.dart';

Widget HomeSongs(dynamic songs, String category) { //TODO: change type songs
  if(true) { //TODO: if !songs.isEmpty
    return Stack(
      children: [
        Text(
          category,
          style: const TextStyle(
            fontSize: 28.0,
          ),
        ),
        const SizedBox(height: 20.0,),
        Expanded(
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, position) {
              return const SizedBox(
                width: 28.0,
              );
            },
            itemBuilder: (context, position) {
              return SongContainer("imageUrl", "songName", "artistName"); //TODO: change with favSongs values
            },
            itemCount: 1/*favSongs.length*/,
          ),
        )
      ] ,
    );
  }
}