import 'package:flutter/material.dart';
import 'package:ptut_2/core/navigation_service.dart';
import 'package:ptut_2/ui/playlist_category.dart';

import '../../theme/colors.dart';

Widget CategoryGrid() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        "Catégories",
        style: const TextStyle(
          fontSize: 28.0,
        ),
        textAlign: TextAlign.start,
      ),
      const SizedBox(height: 20.0,),
      GridView.count(
        primary: false,
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 30,
        childAspectRatio: 16/9,
        shrinkWrap: true,
        children: [
          InkWell(
            onTap: () async{
              await Navigator.of(NavigationService.navigatorKey.currentContext!).pushNamed(PlaylistCategoryPage.route, arguments: PlaylistCategoryPageArguments(categoryName: "Hip - Hop"));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                padding: EdgeInsets.all(12.0),
                child: Center(
                  child: Text(
                    "Hip - Hop",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        CustomColors.purple,
                        CustomColors.blue,
                      ],
                    )
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () async{
              await Navigator.of(NavigationService.navigatorKey.currentContext!).pushNamed(PlaylistCategoryPage.route, arguments: PlaylistCategoryPageArguments(categoryName: "Rap"));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                padding: EdgeInsets.all(12.0),
                child: Center(
                  child: Text(
                    "Rap",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        CustomColors.purple,
                        CustomColors.blue,
                      ],
                    )
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () async{
              await Navigator.of(NavigationService.navigatorKey.currentContext!).pushNamed(PlaylistCategoryPage.route, arguments: PlaylistCategoryPageArguments(categoryName: "Electro"));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                padding: EdgeInsets.all(12.0),
                child: Center(
                  child: Text(
                    "Electro",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        CustomColors.purple,
                        CustomColors.blue,
                      ],
                    )
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () async{
              await Navigator.of(NavigationService.navigatorKey.currentContext!).pushNamed(PlaylistCategoryPage.route, arguments: PlaylistCategoryPageArguments(categoryName: "Country"));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                padding: EdgeInsets.all(12.0),
                child: Center(
                  child: Text(
                    "Country",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        CustomColors.purple,
                        CustomColors.blue,
                      ],
                    )
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () async{
              await Navigator.of(NavigationService.navigatorKey.currentContext!).pushNamed(PlaylistCategoryPage.route, arguments: PlaylistCategoryPageArguments(categoryName: "Métal"));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                padding: EdgeInsets.all(12.0),
                child: Center(
                  child: Text(
                    "Métal",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        CustomColors.purple,
                        CustomColors.blue,
                      ],
                    )
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () async{
              await Navigator.of(NavigationService.navigatorKey.currentContext!).pushNamed(PlaylistCategoryPage.route, arguments: PlaylistCategoryPageArguments(categoryName: "Pop"));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                padding: EdgeInsets.all(12.0),
                child: Center(
                  child: Text(
                    "Pop",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        CustomColors.purple,
                        CustomColors.blue,
                      ],
                    )
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () async{
              await Navigator.of(NavigationService.navigatorKey.currentContext!).pushNamed(PlaylistCategoryPage.route, arguments: PlaylistCategoryPageArguments(categoryName: "Jazz"));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                padding: EdgeInsets.all(12.0),
                child: Center(
                  child: Text(
                    "Jazz",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        CustomColors.purple,
                        CustomColors.blue,
                      ],
                    )
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () async{
              await Navigator.of(NavigationService.navigatorKey.currentContext!).pushNamed(PlaylistCategoryPage.route, arguments: PlaylistCategoryPageArguments(categoryName: "Reggae"));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                padding: EdgeInsets.all(12.0),
                child: Center(
                  child: Text(
                    "Reggae",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        CustomColors.purple,
                        CustomColors.blue,
                      ],
                    )
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}