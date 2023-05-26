import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:practice_responsi/model/modelWeapon.dart';

class WeaponDetail extends StatefulWidget {
  final String name;
  final String image;
  const WeaponDetail({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);

  @override
  State<WeaponDetail> createState() => _WeaponDetailState();
}

class _WeaponDetailState extends State<WeaponDetail> {
  Future<dynamic> _loadWeaponData() async {
    final response = await http.get(Uri.parse('https://api.genshin.dev/weapons/${widget.name}'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weapon data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weapon Details'),
      ),
      body: _detailBody(),
    );
  }

  Widget _detailBody() {
    return Container(
      child: FutureBuilder(
        future: _loadWeaponData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            WeaponModel weaponModel = WeaponModel.fromJson(snapshot.data);
            return _buildSuccessSection(weaponModel);
          }
          return _buildLoadingSection();
        },
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

  Widget _buildSuccessSection(WeaponModel data) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 200,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage('${widget.image}'),
              ),
            ),
          ),
          Text(
            '${data.name}',
            style: TextStyle(fontSize: 18.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              int.parse('${data.rarity}'),
                  (index) => Icon(
                Icons.star,
                color: Colors.yellow,
              ),
            ),
          ),
          Text(
            '${data.passiveName}',
            style: TextStyle(fontSize: 18.0),
          ),
          Text(
            '${data.passiveDesc}',
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
