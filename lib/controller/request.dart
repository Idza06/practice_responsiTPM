import 'package:practice_responsi/controller/baseNetwork.dart';

class DataSource {
  static DataSource instance = DataSource();

  //request for weapons
  Future<Map<String, dynamic>> loadWeapons(name) {
    return BaseNetwork.get("weapons/${name}");
  }
  //request for character
  Future<Map<String, dynamic>> loadCharacter(name) {
    return BaseNetwork.get("characters/${name}");
  }

}