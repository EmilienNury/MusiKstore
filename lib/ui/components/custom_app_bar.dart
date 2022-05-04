import 'package:flutter/material.dart';

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
          onPressed: () => a(), //TODO: change fonction to navigate to settings
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

a() {

}