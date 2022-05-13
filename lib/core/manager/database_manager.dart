import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:ptut_2/core/model/Playlists/playlist.dart';
import 'package:ptut_2/core/model/Songs/song.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class DataBaseManager {

  static final DataBaseManager _instance = DataBaseManager._internal();

  factory DataBaseManager() => _instance;

  DataBaseManager._internal();

  late Database db;
  late StoreRef<String, Map<String, Object?>> fav_store;

  late StoreRef searchHistory_store;

  late StoreRef<String, Map<String, Object?>> playlist_store;

  Future<void> init() async {
    String dataDirectoryPath = (await getApplicationDocumentsDirectory()).path;

    String dbPath = "$dataDirectoryPath/app_storage.db";
    db = await databaseFactoryIo.openDatabase(dbPath);


    fav_store = stringMapStoreFactory.store("fav_songs");
    searchHistory_store = StoreRef.main();
    playlist_store = stringMapStoreFactory.store("playlist");
  }

  /*Future<bool> isFavLaunch(Launch launch) async {
    Map<String, dynamic>? storedFavLaunchJson = await store.record(launch.id).get(db);
    if (storedFavLaunchJson != null) {
      return true;
    }
    return false;
  }

  addFavLaunch(Launch launch) {
    store.record(launch.id).put(db, launch.toJson());
  }

  removeFavLaunch(Launch launch) {
    store.record(launch.id).delete(db);
  }*/

  Future<List<Playlist>> getAllPlaylists() async {
    List<Playlist> playlists = [];
    var value = await playlist_store.find(db);
    for (var i in value){
      Map<String, dynamic>? storedPlaylistJson = await playlist_store.record(i.key).get(db);
      if (storedPlaylistJson != null) {
        playlists.add(Playlist.fromJson(storedPlaylistJson));
      }
    }
    return playlists;
  }

  Future<List<int>> getAllPlaylistsIndexContainingSong(Song song) async {
    List<int> indexList = [];
    await getAllPlaylists().then((playlists) {
      for (Playlist p in playlists) {
        for (Song s in p.songs) {
          if (s.id == song.id) {
            indexList.add(playlists.indexOf(p));
            break;
          }
        }
      }
    });

    return indexList;
  }

  Future<Playlist?> getPlaylist(String name) async {
    try{
      Map<String, dynamic>? playlistJson = await playlist_store.record(name).get(db);
      if (playlistJson != null) {
        var playlist = Playlist.fromJson(playlistJson);
        return playlist;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  addPlaylist(Playlist playlist) {
    playlist_store.record(playlist.name).put(db, playlist.toJson());
  }

  removePlaylist(Playlist playlist) {
    playlist_store.record(playlist.name).delete(db);
  }

  Future<List<String>?>getSearchHistory() async {
    try{
      var dynamic = await searchHistory_store.record('search_history').get(db);
      List<String> searchHistory = [];
      for (String string in dynamic) {
        searchHistory.add(string);
      }
      return searchHistory;
    } catch (e) {
      print(e);
    }

    return null;
  }

  saveSearchHistory(List<String> searchHistory) {
    searchHistory_store.record("search_history").put(db, searchHistory);
  }
}