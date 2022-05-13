// Custom widget for song cards

import 'package:flutter/material.dart';
import 'package:ptut_2/core/manager/database_manager.dart';
import 'package:ptut_2/core/model/Playlists/playlist.dart';
import 'package:ptut_2/core/model/Songs/song.dart';
import 'package:ptut_2/core/navigation_service.dart';
import 'package:ptut_2/theme/colors.dart';
import 'package:ptut_2/ui/player.dart';

class SongVerticalListViewContainer extends StatefulWidget {
  const SongVerticalListViewContainer({Key? key, required this.song}) : super(key: key);
  final Song song;

  @override
  State<SongVerticalListViewContainer> createState() => _SongVerticalListViewContainerState();
}

class _SongVerticalListViewContainerState extends State<SongVerticalListViewContainer> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () async{
            await Navigator.of(NavigationService.navigatorKey.currentContext!).pushNamed(PlayerPage.route, arguments: PlayerPageArguments(music: widget.song));
          },
          child: Container(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Container(
                    height: 100.0,
                    width: 100.0,
                    child: Image.network(widget.song.artworkUrl100!),
                  ),
                ),
                SizedBox(width: 12.0,),
                Container(
                  width: MediaQuery.of(context).size.width - (12 * 2) - 100 - 12 - 96, //2x 12 for left and right padding, 100 for image width, 12 for the Sizebox's width above, and 96 for icon buttons
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.song.name!,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w800
                        ),
                        overflow: TextOverflow.clip,
                      ),
                      SizedBox(height: 12.0,),
                      Text(
                        widget.song.artistName!,
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w300
                        ),
                        overflow: TextOverflow.clip,
                      )
                    ],
                  ),
                ),
                IconButton( icon: Icon(Icons.favorite_border, color: Colors.white,), onPressed: () {
                  //TODO: implement
                }),
                IconButton( icon: Icon(Icons.playlist_add, color: Colors.white,), onPressed: () {
                  /*var playlist = Playlist(songs: [], name: 'Détente');
                  playlist.songs.add(widget.song);
                  DataBaseManager().addPlaylist(playlist);*/
                  openAddToPlaylistModalBottomSheet();
                })
              ],
            ),
          ),
        ),
        SizedBox(height: 12.0,),
      ],
    );
  }

  Future openAddToPlaylistModalBottomSheet() => showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      var selectedIndexes = [];
      DataBaseManager().getAllPlaylistsIndexContainingSong(widget.song).then((value) => selectedIndexes = value);
      return StatefulBuilder(
        builder: (context, setState) {
          return Container(
            color: CustomColors.grey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder(
                future: DataBaseManager().getAllPlaylists(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var playlists = snapshot.data as List<Playlist>;

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text("Enregistrer dans…"),
                              width: 150,
                            ),
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  primary: CustomColors.purple
                              ),
                              icon: Icon(Icons.add),
                              label: Text("Nouvelle playlist"),
                              onPressed: () {
                                Navigator.pop(context);
                                openCreatePlaylistDialog();
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 8,),
                        Container(height: 1, color: Colors.white,),
                        SizedBox(height: 8,),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, position) {
                              return Theme(
                                data: ThemeData(
                                  unselectedWidgetColor: Colors.white
                                ),
                                child: CheckboxListTile(
                                  value: selectedIndexes.contains(position),
                                  title: Text(playlists[position].name, style: Theme.of(context).textTheme.bodyLarge,),
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      if (selectedIndexes.contains(position)) {
                                        selectedIndexes.remove(position);   // unselect
                                      } else {
                                        selectedIndexes.add(position);  // select
                                      }
                                    });
                                  },
                                ),
                              );
                            },
                            itemCount: playlists.length,
                          ),
                        ),
                        Container(height: 1, color: Colors.white,),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: CustomColors.purple
                            ),
                            child: Text("OK"),
                            onPressed: () {
                              save(selectedIndexes as List<int>, playlists);
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text("Enregistrer dans…"),
                          width: 150,
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              primary: CustomColors.purple
                          ),
                          icon: Icon(Icons.add),
                          label: Text("Nouvelle playlist"),
                          onPressed: () {
                            Navigator.pop(context);
                            openCreatePlaylistDialog();
                          },
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          );
        }
      );
    },
  );

  Future openCreatePlaylistDialog() => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: CustomColors.grey,
      title: Text("Nouvelle playlist"),
      content: TextField(
        autofocus: true,
        decoration: InputDecoration(
          labelText: "Titre",
        ),
        controller: controller,
        onSubmitted: (_) => createPlaylist(),
      ),
      actions: [
        TextButton(
          child: Text("Annuler", style: TextStyle(
            color: CustomColors.red,
          ),),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: Text("Créer"),
          onPressed: () {
            createPlaylist();
          },
        )
      ],
    ),
  );

  void createPlaylist() {
    var name = controller.text;
    if(name != null && name.isNotEmpty) {
      DataBaseManager().addPlaylist(Playlist(name: name, songs: [widget.song]));
      Navigator.pop(context);
    }
    controller.clear();
  }

  void save(List<int> selectedIndexes, List<Playlist> playlists) {
    for (var i = 0; i < playlists.length; i++) {
      if (selectedIndexes.contains(i)) {
        playlists[i].songs.add(widget.song);
      } else {
        playlists[i].songs.removeWhere((song) => song.id == widget.song.id);
      }
      DataBaseManager().addPlaylist(playlists[i]);
    }
  }
}