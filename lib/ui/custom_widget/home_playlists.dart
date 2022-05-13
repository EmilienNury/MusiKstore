//Widget that display listview of playlists

import 'package:flutter/material.dart';
import 'package:ptut_2/core/model/Playlists/playlist.dart';
import 'package:ptut_2/ui/custom_widget/playlist_container.dart';

class HomePlaylists extends StatelessWidget {
  const HomePlaylists({Key? key, required this.playlists, required this.onPlaylistChanged}) : super(key: key);
  final List<Playlist> playlists;
  final VoidCallback onPlaylistChanged;

  @override
  Widget build(BuildContext context) {
    if(playlists.isNotEmpty) {
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
                    return PlaylistContainer(
                        playlistName: playlists[position].name,
                        playlists: playlists,
                        onPlaylistChanged: () {
                          onPlaylistChanged();
                        }
                    );
                  },
                  itemCount: playlists.length,
                ),
              )
            ],
          ),
        ),
      );
    }
    return SizedBox();
  }
}

/*Widget HomePlaylists(List<Playlist> playlists) {
  if(playlists.isNotEmpty) {
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
                  return PlaylistContainer(playlists[position].name, playlists);
                },
                itemCount: playlists.length,
              ),
            )
          ],
        ),
      ),
    );
  }
  return SizedBox();
}*/