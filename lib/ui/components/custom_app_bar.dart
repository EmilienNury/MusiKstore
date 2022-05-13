import 'package:flutter/material.dart';
import 'package:ptut_2/core/navigation_service.dart';

import '../parameters.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Image.asset(
            'assets/images/logo_150x150.png',
            fit: BoxFit.contain,
            height: 48,
          ),
          Container(
              padding: const EdgeInsets.all(8.0), child: Text(title))
        ],

      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () async{
            await Navigator.of(NavigationService.navigatorKey.currentContext!).pushNamed(ParametersPage.route);
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

a() {

}