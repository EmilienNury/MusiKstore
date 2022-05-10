import 'package:flutter/material.dart';

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
            onTap: () {
              //TODO : implement navigation
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
            onTap: () {
              //TODO : implement navigation
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
            onTap: () {
              //TODO : implement navigation
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
            onTap: () {
              //TODO : implement navigation
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
            onTap: () {
              //TODO : implement navigation
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
            onTap: () {
              //TODO : implement navigation
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
            onTap: () {
              //TODO : implement navigation
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
            onTap: () {
              //TODO : implement navigation
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