import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'detailWeapon.dart';

class WeaponsPage extends StatefulWidget {
  const WeaponsPage({ Key? key }) : super(key: key);

  @override
  State<WeaponsPage> createState() => _WeaponsPage();
}

class _WeaponsPage extends State<WeaponsPage> {
  @override
  void initState() {
    super.initState();
    getJsonCharacter();
  }

  var weapons = [];
  var weaponsCount = 0;
  bool isLoading = true;

  void getJsonCharacter() async {
    var response = await http
        .get(Uri.parse('https://api.genshin.dev/weapons/'));
    setState(() {
      isLoading = false;
      weapons = json.decode(response.body);
      weaponsCount = weapons.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Character List"),
          // automaticallyImplyLeading: false,
        ),
        body: ListView.builder(
          itemCount: weaponsCount,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return WeaponDetail(
                      name:'${weapons[index]}',
                      image: 'https://api.genshin.dev/weapons/${weapons[index]}/icon',

                    );
                  },
                  ));
                },
                child: Card(
                    child: Row(
                        children:<Widget>[
                          Container(
                            width: 100,
                            height: 100,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child:CircleAvatar(
                                backgroundColor: Colors.transparent,
                                backgroundImage: NetworkImage('https://api.genshin.dev/weapons/${weapons[index]}/icon'),
                              ),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(weapons[index],
                                        style: TextStyle(
                                            fontSize: 18.0
                                        )
                                    ),
                                    SizedBox(height: 8.0)
                                  ]
                              )
                          )
                        ]
                    )
                )
            );
          },
        )
    );
  }
}