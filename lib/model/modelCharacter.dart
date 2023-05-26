class CharacterModel {
  String? name;
  String? vision;
  String? weapon;
  String? nation;
  String? affiliation;
  int? rarity;
  String? constellation;
  String? birthday;
  String? description;
  List<SkillTalents>? skillTalents;
  List<PassiveTalents>? passiveTalents;
  List<Constellations>? constellations;
  String? visionKey;
  String? weaponType;

  CharacterModel({
    this.name,
    this.vision,
    this.weapon,
    this.nation,
    this.affiliation,
    this.rarity,
    this.constellation,
    this.birthday,
    this.description,
    this.skillTalents,
    this.passiveTalents,
    this.constellations,
    this.visionKey,
    this.weaponType,
  });

  CharacterModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    vision = json['vision'] as String?;
    weapon = json['weapon'] as String?;
    nation = json['nation'] as String?;
    affiliation = json['affiliation'] as String?;
    rarity = json['rarity'] as int?;
    constellation = json['constellation'] as String?;
    birthday = json['birthday'] as String?;
    description = json['description'] as String?;
    skillTalents = (json['skillTalents'] as List?)?.map((dynamic e) => SkillTalents.fromJson(e as Map<String,dynamic>)).toList();
    passiveTalents = (json['passiveTalents'] as List?)?.map((dynamic e) => PassiveTalents.fromJson(e as Map<String,dynamic>)).toList();
    constellations = (json['constellations'] as List?)?.map((dynamic e) => Constellations.fromJson(e as Map<String,dynamic>)).toList();
    visionKey = json['vision_key'] as String?;
    weaponType = json['weapon_type'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['vision'] = vision;
    json['weapon'] = weapon;
    json['nation'] = nation;
    json['affiliation'] = affiliation;
    json['rarity'] = rarity;
    json['constellation'] = constellation;
    json['birthday'] = birthday;
    json['description'] = description;
    json['skillTalents'] = skillTalents?.map((e) => e.toJson()).toList();
    json['passiveTalents'] = passiveTalents?.map((e) => e.toJson()).toList();
    json['constellations'] = constellations?.map((e) => e.toJson()).toList();
    json['vision_key'] = visionKey;
    json['weapon_type'] = weaponType;
    return json;
  }
}

class SkillTalents {
  String? name;
  String? unlock;
  String? description;
  String? type;

  SkillTalents({
    this.name,
    this.unlock,
    this.description,
    this.type,
  });

  SkillTalents.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    unlock = json['unlock'] as String?;
    description = json['description'] as String?;
    type = json['type'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['unlock'] = unlock;
    json['description'] = description;
    json['type'] = type;
    return json;
  }
}

class PassiveTalents {
  String? name;
  String? unlock;
  String? description;
  int? level;

  PassiveTalents({
    this.name,
    this.unlock,
    this.description,
    this.level,
  });

  PassiveTalents.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    unlock = json['unlock'] as String?;
    description = json['description'] as String?;
    level = json['level'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['unlock'] = unlock;
    json['description'] = description;
    json['level'] = level;
    return json;
  }
}

class Constellations {
  String? name;
  String? unlock;
  String? description;
  int? level;

  Constellations({
    this.name,
    this.unlock,
    this.description,
    this.level,
  });

  Constellations.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    unlock = json['unlock'] as String?;
    description = json['description'] as String?;
    level = json['level'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['unlock'] = unlock;
    json['description'] = description;
    json['level'] = level;
    return json;
  }
}