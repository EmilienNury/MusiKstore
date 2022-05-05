import 'package:flutter/material.dart';
import 'package:ptut_2/ui/custom_widget/home_songs.dart';
import 'package:ptut_2/ui/custom_widget/song_container.dart';

import '../../core/manager/lyrics_songs_manager.dart';
import '../custom_widget/home_playlists.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: Future.wait([
        LyricsSongManager().getMostPopularSong(),
        //DataBaseManager().getAllFavSongs(),
        //DataBaseManager().getAllPlaylists(),
      ]),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          //var favSongs = snapshot.data?[0];   // as list<Song>
          //var playlists = snapshot.data?[1];
          var popularSongs = snapshot.data?[0];
          return Container(
            child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  //HomeSongs(favSongs, "Favoris"),
                  //HomePlaylists(playlists),
                  HomeSongs(popularSongs, "Populaires"),
                  HomeSongs(popularSongs, "Nos recommendations"),
                  HomePlaylists(popularSongs),

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