import 'package:flutter/material.dart';
import 'package:ptut_2/ui/custom_widget/category_grid.dart';
import 'package:ptut_2/ui/custom_widget/vlist_song_container.dart';
import '../../core/manager/lyrics_songs_manager.dart';
import '../../core/model/Songs/songs.dart';
import '../../theme/colors.dart';

Widget SongsVerticalListView(String type, String? searchTerm) {
  if (type == "search") {
    if (searchTerm != null) {
      return FutureBuilder(
        future: LyricsSongManager().getMostPopularSong(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var songs = snapshot.data as Songs;
            var songList = songs.feed.results!.where((e) => e.name!.toLowerCase().contains(searchTerm.toLowerCase()) || e.artistName!.toLowerCase().contains(searchTerm.toLowerCase())).toList();
            return ListView.separated(
              padding: const EdgeInsets.fromLTRB(12, 48 + 6 + 25, 12, 25),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              separatorBuilder: (context, position) {
                return const SizedBox(
                  height: 8.0,
                );
              },
              itemBuilder: (context, position) {
                if (position == songList.length) {
                  return CategoryGrid();
                }
                else {
                  return SongVerticalListViewContainer(
                      songList[position].artworkUrl100!,
                      songList[position].name!,
                      songList[position].artistName!,
                      context);
                }
              },

              itemCount: songList.length + 1,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    } else {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 48 + 6 + 20, 12, 20),
          child: CategoryGrid(),
        ),
      );
    }

  } else if (type == "category") {

  } else if (type == "playlist") {
      //fetch playlists in database
  }

  return SizedBox();
}