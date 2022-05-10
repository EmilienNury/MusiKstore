import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/web_symbols_icons.dart';
import 'package:ptut_2/core/navigation_service.dart';
import 'package:ptut_2/theme/colors.dart';
import 'package:ptut_2/ui/subscribe.dart';

class ParametersPage extends StatefulWidget{
  static const route = "/parameters";

  const ParametersPage({Key? key}): super(key: key);

  @override
  _ParametersPageState createState() => _ParametersPageState();
}

class _ParametersPageState extends State<ParametersPage>{
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Parameters"),
        backgroundColor: CustomColors.black,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.fromLTRB(30, 10, 0, 10),
            child: const Text(
              "Profil",
              style: TextStyle(fontSize: 22),
            ),
          ),
          //Prénom
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: const Text(
              "Prénom",
              style: TextStyle(fontSize: 15),
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
                hintText: "Prénom",
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
          //Nom
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: const Text(
              "Nom",
              style: TextStyle(fontSize: 15),
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
                hintText: "Nom",
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
            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: const Text(
              "Email",
              style: TextStyle(fontSize: 15),
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
                hintText: "Email",
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
            padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
            child: const Text(
              "Mot de passe",
              style: TextStyle(fontSize: 15),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
            height: 70,
            child: TextField(
              style: const TextStyle(color: Colors.black),
              obscureText: true,
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
          SizedBox(
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                // Respond to button press
              },
              child: const Text('Sauvegarder les modifications'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(86, 72, 217, 100)),
              ),
            ) ,
          ),
          SizedBox(
            width: 300,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ElevatedButton.icon(
                onPressed: () async{
                  await Navigator.of(NavigationService.navigatorKey.currentContext!).pushNamed(SubscribePage.route);
                },
                icon: const Icon(
                    WebSymbols.right_circle,
                    size: 18
                ),
                label: const Text('Gérer les abonnements',),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(154, 72, 217, 100)),
                ),
              ) ,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.fromLTRB(30, 20, 0, 10),
            child: const Text(
              "Plus d'infos",
              style: TextStyle(fontSize: 22),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            height: 40,
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: TextButton(
              onPressed: () {  },
              child: const Text(
                "Conditions générales d'utilisation",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            height: 40,
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: TextButton(
              onPressed: () {  },
              child: const Text(
                "Politique de confidentialité",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () {
                // Respond to button press
              },
              child: const Text('Déconnexion'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(217, 72, 79, 100)),
              ),
            ) ,
          ),
        ],
      ),
    );
  }

}