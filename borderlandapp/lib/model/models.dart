import 'package:json_annotation/json_annotation.dart';

class BaseModel {
  int id = 0;
}

class Equipment extends BaseModel {
  late final String? name;
  late final String? redtext;
  late final String? description;
  late final EquipmentType? equipmentType;
  late final Content? content;
  late final Ennemy? ennemy;
  late final Rarity? rarity;
  late final String? image;

  Equipment({
    this.name,
    this.image,
    this.redtext,
    this.description,
    this.ennemy,
    this.content,
    this.equipmentType,
    this.rarity,
  });

  Equipment.fromJson(Map<String, dynamic> parsedJson) {
    name:
    parsedJson['name'];
    image:
    parsedJson['imagePath'];
    redtext:
    parsedJson['redText'];
    description:
    parsedJson['description'];
    equipmentType:
    EquipmentType.fromJson(parsedJson['equipmentType']);
    content:
    Content.fromJson(parsedJson['content']);
    ennemy:
    Ennemy.fromJson(parsedJson['ennemie']);
    rarity:
    Rarity.fromJson(parsedJson['rarity']);
  }
}

class Item extends BaseModel {
  late final Equipment? equipment;
  late final Manufacturer? manufacturer;
  late final Type? type;

  Item({
    this.equipment,
    this.manufacturer,
    this.type,
  });

  Item.fromJson(Map<String, dynamic> parsedJson) {
    equipment:
    Equipment.fromJson(parsedJson['equipmentid']);
    manufacturer:
    Manufacturer.fromJson(parsedJson['manufacturer']);
    type:
    Type.fromJson(parsedJson['type']);
  }
}

class Manufacturer extends BaseModel {
  final String? name;
  final String? image;
  final String? description;

  Manufacturer({
    this.name,
    this.image,
    this.description,
  });

  factory Manufacturer.fromJson(Map<String, dynamic> parsedJson) {
    return Manufacturer(
      name: parsedJson['name'],
      image: parsedJson['image'],
      description: parsedJson['description'],
    );
  }
}

class Artifact extends BaseModel {
  final int equipmentId;
  final int typeId;

  Artifact({
    required this.equipmentId,
    required this.typeId,
  });

  factory Artifact.fromJson(Map<String, dynamic> parsedJson) {
    return Artifact(
      equipmentId: parsedJson['equipementid'],
      typeId: parsedJson['typeid'],
    );
  }
}

class ClassMod extends BaseModel {
  final int equipmentId;
  final int classId;

  ClassMod({
    required this.equipmentId,
    required this.classId,
  });
  factory ClassMod.fromJson(Map<String, dynamic> parsedJson) {
    return ClassMod(
      equipmentId: parsedJson['equipmentid'],
      classId: parsedJson['classid'],
    );
  }
}

class Rarity extends BaseModel {
  final String name;
  final String image;

  Rarity({
    required this.name,
    required this.image,
  });

  factory Rarity.fromJson(Map<String, dynamic> parsedJson) {
    return Rarity(
      name: parsedJson['name'],
      image: parsedJson['image'],
    );
  }
}

class Element extends BaseModel {
  final String name;
  final String description;
  final String image;
  final int itemEquipmentId;

  Element({
    required this.name,
    required this.image,
    required this.description,
    required this.itemEquipmentId,
  });

  factory Element.fromJson(Map<String, dynamic> parsedJson) {
    return Element(
      name: parsedJson['name'],
      image: parsedJson['image'],
      description: parsedJson['description'],
      itemEquipmentId: parsedJson['itemEquipmentId'],
    );
  }
}

class Content extends BaseModel {
  final String name;
  final String description;

  Content({
    required this.name,
    required this.description,
  });

  factory Content.fromJson(Map<String, dynamic> parsedJson) {
    return Content(
      name: parsedJson['name'],
      description: parsedJson['description'],
    );
  }
}

class EquipmentType extends BaseModel {
  final String name;

  EquipmentType({
    required this.name,
  });

  factory EquipmentType.fromJson(Map<String, dynamic> parsedJson) {
    return EquipmentType(
      name: parsedJson['name'],
    );
  }
}

class Type extends BaseModel {
  final String? name;
  final String? description;

  Type({
    this.name,
    this.description,
  });

  factory Type.fromJson(Map<String, dynamic> parsedJson) {
    return Type(
      name: parsedJson['name'],
      description: parsedJson['description'],
    );
  }
}

// Les classes characters

class Character extends BaseModel {
  Character({
    required this.name,
    required this.classs,
    required this.image,
  });

  late final String name;
  late final Class classs;
  late final String image;

  Character.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    classs = Class.fromJson(json['class']);
    image = json['image'];
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['classs'] = classs.toJson();

    return _data;
  }
}

class CharacterDetailsCall extends BaseModel{
  CharacterDetailsCall({
    required this.name,
    required this.classs,
    required this.skins,
    required this.skills,
  });

  late final String name;
  late final Class classs;
  late final Cosmetic skins;
  late final Skill skills;
  
  CharacterDetailsCall.fromJson(Map<String, dynamic> json){
    name = json['name'];
    classs = Class.fromJson(json['class']);
    skins = Cosmetic.fromJson(json['skins']);
    skills = Skill.fromJson(json['skills']);
  }
}

class Cosmetic extends BaseModel {
  late final String name;
  late final String image;
  late final int characterId;

  Cosmetic({
    required this.name,
    required this.image,
    required this.characterId,
  });

   Cosmetic.fromJson(Map<String, dynamic> parsedJson) {
    
      name: parsedJson['name'];
      image: parsedJson['image'];
      characterId: parsedJson['characterId'];
    
  }
}

class Skill extends BaseModel {
  late final int characterId;
  late final String name;
  late final String skillType;
  late final String description;
  late final int requiredLvl;
  late final int points;
  late final String skillTreeName;

  Skill({
    required this.characterId,
    required this.name,
    required this.description,
    required this.skillTreeName,
    required this.skillType,
    required this.requiredLvl,
    required this.points,
  });

  Skill.fromJson(Map<String, dynamic> parsedJson) {
    
      characterId: parsedJson['characterid'];
      name: parsedJson['name'];
      description: parsedJson['description'];
      skillTreeName: parsedJson['skillTreeName'];
      skillType: parsedJson['skillType'];
      requiredLvl: parsedJson['requiredLvl'];
      points: parsedJson['points'];
    
  }
}

class Class extends BaseModel {
  Class({
    required this.name,
    required this.description,
  });

  late final String name;
  late final String description;

  Class.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['description'] = description;
    return _data;
  }
}

//Ennemies

class Ennemy extends BaseModel {
  Ennemy({
    required this.name,
    required this.ennemieType,
  });

  late final String name;
  late final EnnemyType ennemieType;

  Ennemy.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    ennemieType = EnnemyType.fromJson(json['ennemieType']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['ennemieType'] = ennemieType.toJson();

    return _data;
  }
}

class EnnemyType extends BaseModel {
  late final String name;
  late final String description;

  EnnemyType({
    required this.name,
    required this.description,
  });

  EnnemyType.fromJson(Map<String, dynamic> parsedJson) {
    name = parsedJson['name'];
    description = parsedJson['description'];
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['typeName'] = name;
    _data['description'] = description;
    return _data;
  }
}

//Other

class Planet extends BaseModel {
  final String name;
  final String description;
  final String image;

  Planet({
    required this.name,
    required this.description,
    required this.image,
  });

  factory Planet.fromJson(Map<String, dynamic> parsedJson) {
    return Planet(
      name: parsedJson['name'],
      description: parsedJson['description'],
      image: parsedJson['image'],
    );
  }
}

//User
class User extends BaseModel {
  final String name;
  final String password;
  final String token;
  final String role;

  User({
    required this.name,
    required this.password,
    required this.token,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
        name: parsedJson['username'],
        password: parsedJson['password'],
        token: parsedJson['token'],
        role: parsedJson['role']);
  }
}
