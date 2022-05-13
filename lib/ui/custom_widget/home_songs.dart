//Widget that display listview of songs

import 'package:flutter/material.dart';
import 'package:ptut_2/core/model/Songs/song.dart';
import 'package:ptut_2/ui/custom_widget/song_container.dart';

import '../../core/model/Songs/songs.dart';

Widget HomeSongs(List<Song> songs, String category) {
  if(songs != null){
    if(songs.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: SizedBox(
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                category,
                style: const TextStyle(
                  fontSize: 28.0,
                ),
                textAlign: TextAlign.start,
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
                    return SongContainer(songs[position]);
                  },
                  itemCount: songs.length,
                ),
              )
            ] ,
          ),
        ),
      );
    }
  }
  return SizedBox();
}