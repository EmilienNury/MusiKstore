import 'package:flutter/material.dart';
import 'package:ptut_2/core/manager/database_manager.dart';
import 'package:ptut_2/core/model/Playlists/playlist.dart';
import 'package:ptut_2/core/model/Songs/song.dart';
import 'package:ptut_2/ui/custom_widget/category_grid.dart';
import 'package:ptut_2/ui/custom_widget/vlist_song_container.dart';
import '../../core/manager/lyrics_songs_manager.dart';
import '../../core/model/Songs/songs.dart';
import '../../theme/colors.dart';

Widget SongsVerticalListView(String type, String? searchTerm, String? playlistName, String? categoryName) {
  if (type == "search") {
    if (searchTerm != null) {
      return FutureBuilder<List<dynamic>>(
        future: Future.wait([
          LyricsSongManager().getMostPopularSong(),
          DataBaseManager().getAllFavSongs()
        ]),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var songs = snapshot.data?[0] as Songs;
            var songList = songs.feed.results!.where((e) => e.name!.toLowerCase().contains(searchTerm.toLowerCase()) || e.artistName!.toLowerCase().contains(searchTerm.toLowerCase())).toList();
            var favSongs = snapshot.data?[1] as List<Song>;
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
                var isFav = false;
                if(songList.isNotEmpty && songList.length > position) {
                  for (Song s in favSongs) {
                    if (s.id == songList[position].id) {
                      isFav = true;
                    }
                  }
                }
                if (position == songList.length) {
                  return CategoryGrid();
                }
                else {
                  return SongVerticalListViewContainer(song: songList[position], isFav: isFav,);
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

  } else if (type == "playlist") {
    return FutureBuilder<List<dynamic>>(
      future: Future.wait([
        DataBaseManager().getPlaylist(playlistName!),
        DataBaseManager().getAllFavSongs()
      ]),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var playlist = snapshot.data?[0] as Playlist;
          var songList = playlist.songs;
          var favSongs = snapshot.data?[1] as List<Song>;
          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(12, 25, 12, 25),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            separatorBuilder: (context, position) {
              return const SizedBox(
                height: 8.0,
              );
            },
            itemBuilder: (context, position) {
              var isFav = false;
              for (Song s in favSongs) {
                if (s.id == songList[position].id) {
                  isFav = true;
                }
              }
              return SongVerticalListViewContainer(song: songList[position], isFav: isFav,);
            },

            itemCount: songList.length,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  } else if (type == "category") {
    return FutureBuilder<List<dynamic>>(
      future: Future.wait([
        LyricsSongManager().getMostPopularSong(),
        DataBaseManager().getAllFavSongs()
      ]),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var songs = snapshot.data?[0] as Songs;
          var songList = songs.feed.results!;
          var favSongs = snapshot.data?[1] as List<Song>;
          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(12, 25, 12, 25),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            separatorBuilder: (context, position) {
              return const SizedBox(
                height: 8.0,
              );
            },
            itemBuilder: (context, position) {
              var isFav = false;
              for (Song s in favSongs) {
                if (s.id == songList[position].id) {
                  isFav = true;
                }
              }
              return SongVerticalListViewContainer(song: songList[position], isFav: isFav,);
            },

            itemCount: songList.length,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  return SizedBox();
}