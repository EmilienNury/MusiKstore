import 'package:flutter/material.dart';
import '../core/manager/lyrics_songs_manager.dart';
import '../theme/colors.dart';

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
          "${widget.playlistName}${widget.categoryName}",
          style: const TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}