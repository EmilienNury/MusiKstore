// Custom widget for playlist cards

import 'package:flutter/material.dart';
import 'package:ptut_2/core/navigation_service.dart';
import 'package:ptut_2/theme/colors.dart';
import 'package:ptut_2/ui/playlist_category.dart';

Widget PlaylistContainer(String playlistName) {
  return Container(
    child: InkWell(
      onTap: () async{
        await Navigator.of(NavigationService.navigatorKey.currentContext!).pushNamed(PlaylistCategoryPage.route, arguments: PlaylistCategoryPageArguments(playlistName: playlistName));
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
}