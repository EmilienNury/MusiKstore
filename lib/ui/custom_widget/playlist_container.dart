// Custom widget for playlist cards

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ptut_2/core/manager/database_manager.dart';
import 'package:ptut_2/core/model/Playlists/playlist.dart';
import 'package:ptut_2/core/navigation_service.dart';
import 'package:ptut_2/theme/colors.dart';
import 'package:ptut_2/ui/playlist_category.dart';

class PlaylistContainer extends StatefulWidget {
  final String playlistName;
  final List<Playlist> playlists;
  final VoidCallback onPlaylistChanged;
  const PlaylistContainer({Key? key, required this.playlistName, required this.playlists, required this.onPlaylistChanged}) : super(key: key);

  @override
  State<PlaylistContainer> createState() => _PlaylistContainerState();
}

class _PlaylistContainerState extends State<PlaylistContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () async{
          await Navigator.of(NavigationService.navigatorKey.currentContext!).pushNamed(PlaylistCategoryPage.route, arguments: PlaylistCategoryPageArguments(playlistName: widget.playlistName));
          widget.onPlaylistChanged();
        },
        onLongPress: openDeletePlaylistMenu,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                height: 140.0,
                width: 140.0,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        CustomColors.purple,
                        CustomColors.red,
                      ],
                    )
                ),
                child: Center(
                  child: Text(
                    widget.playlistName,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void openDeletePlaylistMenu() {
    final RenderObject overlay = Overlay.of(context)!.context.findRenderObject()!;
    final renderObject = context.findRenderObject();
    var translation = renderObject?.getTransformTo(null).getTranslation();
    var i = renderObject?.paintBounds.shift(Offset(translation!.x + 15, translation.y - 60));

    showMenu(
        context: context,
        color: CustomColors.grey,
        position: RelativeRect.fromRect(
            i!, // smaller rect, the touch area
            Offset.zero & overlay.semanticBounds.size // Bigger rect, the entire screen
        ),
        items: [PopupMenuItem(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(Icons.delete, color: CustomColors.red,),
              Text("Supprimer", style: TextStyle(color: CustomColors.red),),
            ],
          ),
          onTap: () async {
            var playlistToDelete = await DataBaseManager().getPlaylist(widget.playlistName);
            DataBaseManager().removePlaylist(playlistToDelete as Playlist);
            widget.playlists.remove(playlistToDelete);
            widget.onPlaylistChanged();
          },
        )]
    );
  }
}


/*Widget PlaylistContainer(String playlistName, List<Playlist> playlists, final VoidCallback onPlaylistChanged) {
  return Container(
    child: InkWell(
      onTap: () async{
        await Navigator.of(NavigationService.navigatorKey.currentContext!).pushNamed(PlaylistCategoryPage.route, arguments: PlaylistCategoryPageArguments(playlistName: playlistName));
        onPlaylistChanged();
      },
      onLongPress: () async {
        openDeletePlaylistMenu();
        var playlistToDelete = await DataBaseManager().getPlaylist(playlistName);
        DataBaseManager().removePlaylist(playlistToDelete as Playlist);
        playlists.remove(playlistToDelete);
        onPlaylistChanged();
      },
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                height: 140.0,
                width: 140.0,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        CustomColors.purple,
                        CustomColors.red,
                      ],
                    )
                ),
                child: Center(
                  child: Text(
                    playlistName,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
  );
}*/