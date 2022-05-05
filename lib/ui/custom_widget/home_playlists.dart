//Widget that display listview of playlists

import 'package:flutter/material.dart';
import 'package:ptut_2/ui/custom_widget/playlist_container.dart';
import 'package:ptut_2/ui/custom_widget/song_container.dart';

Widget HomePlaylists(dynamic playlists) { //TODO: change type playlists
  if(true) { //TODO: if !playlists.isEmpty
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: SizedBox(
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Playlists",
              style: TextStyle(
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
                  return PlaylistContainer("Ma playlist"); //TODO: change with playlists name
                },
                itemCount: 5/*playlists.length*/,
              ),
            )
          ],
        ),
      ),
    );
  }
}