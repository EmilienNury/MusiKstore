import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:ptut_2/theme/colors.dart';
import 'package:ptut_2/ui/custom_widget/category_grid.dart';
import 'package:ptut_2/ui/custom_widget/home_songs.dart';
import 'package:ptut_2/ui/custom_widget/song_container.dart';
import 'package:ptut_2/ui/custom_widget/vlist_songs.dart';

import '../../core/manager/lyrics_songs_manager.dart';
import '../custom_widget/home_playlists.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  static const historyLength = 5;

  List<String> _searchHistory = [];

  late List<String> filteredSearchHistory;

  late String? selectedTerm;

  List<String> filteredSearchTerms({
    required String? filter,
  }) {
    if (filter != null && filter.isNotEmpty) {
      return _searchHistory.reversed
          .where((term) => term.startsWith(filter))
          .toList();
    } else {
      return _searchHistory.reversed.toList();
    }
  }

  void addSearchTerm(String term) {
    if (_searchHistory.contains(term)) {
      putSearchTermFirst(term);
      return;
    }

    _searchHistory.add(term);
    if (_searchHistory.length > historyLength) {
      _searchHistory.removeRange(0, _searchHistory.length - historyLength);
    }

    filteredSearchHistory = filteredSearchTerms(filter: null);
  }

  void deleteSearchTerm(String term) {
    _searchHistory.removeWhere((t) => t == term);
    filteredSearchHistory = filteredSearchTerms(filter: null);
  }

  void putSearchTermFirst(String term) {
    deleteSearchTerm(term);
    addSearchTerm(term);
  }

  late FloatingSearchBarController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = FloatingSearchBarController();
    filteredSearchHistory = filteredSearchTerms(filter: null);
    selectedTerm = null;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: Future.wait([
        LyricsSongManager().getMostPopularSong(), //TODO: remove
        //DataBaseManager().getSearchHistory(),
      ]),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          //var favSongs = snapshot.data?[0];   // as list<Song>
          //var playlists = snapshot.data?[1];
          var popularSongs = snapshot.data?[0];
          return Scaffold(
            body: FloatingSearchBar(
              iconColor: Colors.white,
              backgroundColor: CustomColors.grey,
              controller: controller,
              body: FloatingSearchBarScrollNotifier(child: SongsVerticalListView("search", selectedTerm, null, null)),
              transition:  CircularFloatingSearchBarTransition(),
              physics: BouncingScrollPhysics(),
              title: Text(
                selectedTerm ?? "Rechercher",
                style: Theme.of(context).textTheme.headline6,
              ),
              hint: "Recherchez la musique de votre choix …",
              hintStyle: TextStyle(
                fontSize: 14.0,
                color: Colors.white60,
              ),
              actions: [
                FloatingSearchBarAction.searchToClear(),
              ],
              onQueryChanged: (query) {
                setState(() {
                  filteredSearchHistory = filteredSearchTerms(filter: query);
                  if (query.isEmpty) {
                    selectedTerm = null;
                  }
                });
              },
              onSubmitted: (query) {
                setState(() {
                  addSearchTerm(query);
                  selectedTerm = query;
                });
                controller.close();
              },
              clearQueryOnClose: false,
              builder: (context, transition) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Material(
                    color: CustomColors.grey,
                    elevation: 4,
                    child: Builder(
                      builder: (context) {
                        if (filteredSearchHistory.isEmpty &&
                            controller.query.isEmpty) {
                          return Container(
                            height: 56,
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: Text(
                              "Commencez votre recherche",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.caption,
                            ),
                          );
                        } else if (filteredSearchHistory.isEmpty) {
                          return ListTile(
                            title: Text(controller.query),
                            leading: const Icon(Icons.search, color: Colors.white,),
                            onTap: () {
                              setState(() {
                                addSearchTerm(controller.query);
                                selectedTerm = controller.query;
                              });
                              controller.close();
                            },
                          );
                        } else {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: filteredSearchHistory.map(
                              (term) => ListTile(
                                title: Text(
                                  term,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                leading: const Icon(Icons.history, color: Colors.white,),
                                trailing: IconButton(
                                  icon: const Icon(Icons.clear, color: Colors.white,),
                                  onPressed: () {
                                    setState(() {
                                      deleteSearchTerm(term);
                                    });
                                  },
                                ),
                                onTap: () {
                                  setState(() {
                                    putSearchTermFirst(term);
                                    selectedTerm = term;
                                    controller.query = term;
                                  });
                                  controller.close();
                                },
                              ),
                            ).toList(),
                          );
                        }
                      },
                    ),
                  ),
                );
              },
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

/*class SearchResultsListView extends StatelessWidget {

}*/