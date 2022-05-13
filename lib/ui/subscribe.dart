import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ptut_2/theme/colors.dart';

class SubscribePage extends StatefulWidget{
  static const route = "/subscribe";

  const SubscribePage({Key? key}): super(key: key);

  @override
  _SubscribePageState createState() => _SubscribePageState();
}

class _SubscribePageState extends State<SubscribePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Abonnements"),
        backgroundColor: CustomColors.black,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
            child:const Text(
              "- Pas de pub",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
            child:const Text(
              "- Créer ta propre musique",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
            child:const Text(
              "- Enregistre tes karaokés",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white
              ),
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          SizedBox(
            height: 180,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Column(
                    children: [
                      const Text(
                        "Mensuel",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "2,99€ par mois",
                        style: TextStyle(
                            fontSize:15,
                            color: Colors.white
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () { },
                        child:  const Text(
                          "Chosir",
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(154, 72, 217, 100)),
                        ),
                      ),
                    ],
                  ),
                ),
                const VerticalDivider(
                  width: 20,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                  color: Colors.white,
                ),
                Container(
                  child:  Column(
                    children: [
                      const Text(
                        "Annuel",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "25€ par mois",
                        style: TextStyle(
                            fontSize:15,
                            color: Colors.white
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () { },
                        child: const Text(
                            "Chosir"
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(154, 72, 217, 100)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}