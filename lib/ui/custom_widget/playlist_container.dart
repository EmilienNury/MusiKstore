// Custom widget for playlist cards

import 'package:flutter/material.dart';
import 'package:ptut_2/theme/colors.dart';

Widget PlaylistContainer(String playlistName) {
  return Container(
    child: InkWell(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          height: 140.0,
          width: 140.0,
          child: Container(
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
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}