import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'custom_widget/vlist_songs.dart';

class PlaylistCategoryPageArguments{
  String? playlistName;
  String? categoryName;

  PlaylistCategoryPageArguments({this.playlistName, this.categoryName});
}

class PlaylistCategoryPage extends StatefulWidget {
  static const route = "/playlist_category";
  final String? playlistName;
  final String? categoryName;
  const PlaylistCategoryPage({Key? key, this.playlistName, this.categoryName}) : super(key: key);

  @override
  State<PlaylistCategoryPage> createState() => _PlaylistCategoryPageState();
}

class _PlaylistCategoryPageState extends State<PlaylistCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.black,
        title: Text(
          "${widget.playlistName ?? widget.categoryName}",
          style: const TextStyle(fontSize: 25),
        ),
      ),
      body: (widget.playlistName != null)? SongsVerticalListView("playlist", null, widget.playlistName, null) : SongsVerticalListView("category", null, null, widget.categoryName),
    );
  }
}