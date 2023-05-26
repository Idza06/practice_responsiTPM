import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:practice_responsi/model/modelCharacter.dart';

class CharacterDetail extends StatefulWidget {
  final String name;
  final String image;
  const CharacterDetail({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);

  @override
  State<CharacterDetail> createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail> {
  Future<dynamic> _loadCharacterData() async {
    final response = await http.get(Uri.parse('https://api.genshin.dev/characters/${widget.name}'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load character data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://api.genshin.dev/characters/${widget.name}/gacha-splash',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFillRemaining(
            child: FutureBuilder(
              future: _loadCharacterData(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasError) {
                  return _buildErrorSection();
                }
                if (snapshot.hasData) {
                  CharacterModel charModel = CharacterModel.fromJson(snapshot.data);
                  return _buildSuccessSection(charModel);
                }
                return _buildLoadingSection();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorSection() {
    return Center(
      child: Text("Error"),
    );
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(CharacterModel data) {
    String nation = '${data.nation}'.toLowerCase();
    String elements = '${data.vision}'.toLowerCase();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                child: Image.network('https://api.genshin.dev/nations/$nation/icon'),
              ),
              Container(
                width: 100,
                height: 100,
                child: Image.network('https://api.genshin.dev/elements/$elements/icon'),
              ),
              Text(
                '${data.name}',
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
          Text(
            '${data.description}',
            style: TextStyle(fontSize: 18.0),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: Image.network('https://api.genshin.dev/characters/${widget.name}/talent-na'),
                ),
                Flexible(
                  child: Container(
                    child: Text(
                      data.skillTalents![0].description.toString(),
                      style: TextStyle(fontSize: 14.0),
                    ),
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
