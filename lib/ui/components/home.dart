import 'package:flutter/material.dart';
import 'package:ptut_2/core/manager/database_manager.dart';
import 'package:ptut_2/core/model/Songs/songs.dart';
import 'package:ptut_2/ui/custom_widget/home_songs.dart';
import 'package:ptut_2/ui/custom_widget/song_container.dart';

import '../../core/manager/lyrics_songs_manager.dart';
import '../custom_widget/home_playlists.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: Future.wait([
        DataBaseManager().getAllFavSongs(),
        LyricsSongManager().getMostPopularSong(),
        DataBaseManager().getAllPlaylists(),
      ]),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var favSongs = snapshot.data?[0];
          var popularSongs = snapshot.data?[1] as Songs;
          var playlists = snapshot.data?[2];
          return Container(
            child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  HomeSongs(favSongs, "Favoris"),
                  HomeSongs(popularSongs.feed.results!, "Populaires"),
                  HomeSongs(popularSongs.feed.results!, "Nos recommendations"),
                  HomePlaylists(
                    playlists: playlists,
                    onPlaylistChanged: () {
                      setState(() {});
                    },
                  ),
                ],
              ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ); // trailing comma makes auto-formatting nicer for build methods.
  }
}