import 'package:flutter/material.dart';
import 'package:ptut_2/ui/components/add.dart';
import 'package:ptut_2/ui/components/custom_app_bar.dart';
import 'package:ptut_2/ui/components/home.dart';
import 'package:ptut_2/ui/components/search.dart';

class MusiKstoreApp extends StatefulWidget {
  const MusiKstoreApp({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MusiKstoreApp> createState() => _MusiKstoreAppState();
}

class _MusiKstoreAppState extends State<MusiKstoreApp> {
  final ScrollController scrollController = ScrollController();

  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SearchPage(),
    AddPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(
        title: widget.title,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Rechercher',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Ajouter',
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}