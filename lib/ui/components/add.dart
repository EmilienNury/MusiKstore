import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/web_symbols_icons.dart';

class AddPage extends StatefulWidget{
  static const route = "/add";

  const AddPage({Key? key}): super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.fromLTRB(30, 10, 0, 10),
            child: const Text(
              "Titre",
              style: TextStyle(fontSize: 22),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
            height: 70,
            child: TextField(
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hoverColor: Colors.white,
                hintText: "Titre",
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder:  OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.fromLTRB(30, 10, 0, 10),
            child: const Text(
              "Paroles",
              style: TextStyle(fontSize: 22),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
            child: TextField(
              minLines: 12,
              maxLines: 12,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hoverColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder:  OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: ElevatedButton.icon(
              onPressed: () {
              },
              icon: const Icon(
                  WebSymbols.right_circle,
                  size: 18
              ),
              label: const Text('Importer les paroles',),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(86, 72, 217, 100)),
              ),
            ) ,
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.fromLTRB(30, 10, 0, 10),
            child: const Text(
              "Musique",
              style: TextStyle(fontSize: 22),
            ),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: ElevatedButton.icon(
              onPressed: () {
              },
              icon: const Icon(
                  WebSymbols.right_circle,
                  size: 18
              ),
              label: const Text('Importer la musique',),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(86, 72, 217, 100)),
              ),
            ) ,
          ),
          ElevatedButton(
            onPressed: () {
              // Respond to button press
            },
            child: const Text('Enregistrer'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(86, 72, 217, 100)),
            ),
          ),
        ],
      ),
    );
  }

}