import 'package:flutter/material.dart';
import 'package:ptut_2/ui/custom_widget/home_songs.dart';
import 'package:ptut_2/ui/custom_widget/song_container.dart';

import '../custom_widget/home_playlists.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: Future.wait([
        //DataBaseManager().getAllFavSongs(),
        //DataBaseManager().getAllPlaylists(),
        //ApiManager().getAllPopularSongs(),
        //ApiManager().getAllRecommendedSongs(),

      ]),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var favSongs = snapshot.data?[0];   // as list<Song>
          var playlists = snapshot.data?[1];
          var popularSongs = snapshot.data?[2];
          var recommendedSongs = snapshot.data?[3];
          return Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  HomeSongs(favSongs, "Favoris"),
                  HomePlaylists(playlists),
                  HomeSongs(popularSongs, "Populaires"),
                  HomeSongs(recommendedSongs, "Nos recommendations"),

                ],
              ),
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