import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

class BaseModel {
  int id = 0;
}

class Equipment extends BaseModel {
  late final String name;
  late final String redtext;
  late final String description;
  late final EquipmentType equipmentType;
  late final Content content;
  late final Ennemy ennemy;
  late final Rarity rarityName;
  late final String image;

  Equipment({
    required this.name,
    required this.image,
    required this.redtext,
    required this.description,
    required this.ennemy,
    required this.content,
    required this.equipmentType,
    required this.rarityName,
  });

  Equipment.fromJson(Map<String, dynamic> parsedJson) {
    name = parsedJson['name'];
    image = parsedJson['imagePath'];
    redtext = parsedJson['redText'];
    description = parsedJson['description'];
    equipmentType = EquipmentType.fromJson(parsedJson['equipmentType']);
    content = Content.fromJson(parsedJson['content']);
    ennemy = Ennemy.fromJson(parsedJson['ennemie']);
    rarityName = Rarity.fromJson(parsedJson['rarityName']);
  }
}

class Item extends BaseModel {
  late final Manufacturer manufacturer;
  late final Type type;
  late final Element element;
  late final String name;
  late final String redText;
  late final EquipmentType equipmentType;
  late final Rarity rarity;
  late final String imagePath;

  Item({
    required this.manufacturer,
    required this.type,
    required this.element,
    required this.name,
    required this.redText,
    required this.equipmentType,
    required this.rarity,
    required this.imagePath,
  });

  Item.fromJson(Map<String, dynamic> parsedJson) {
    manufacturer = Manufacturer.fromJson(parsedJson['manufacturer']);
    type = Type.fromJson(parsedJson['type']);
    element = Element.fromJson(parsedJson['elements']);
    name = parsedJson['name'];
    redText = "yep";
    equipmentType = EquipmentType.fromJson(parsedJson['equipmentType']);
    rarity = Rarity.fromJson(parsedJson['rarity']);
    imagePath = parsedJson['imagePath'];
  }
}

class Manufacturer extends BaseModel {
  late final String name;
  late final String image;
  late final String description;

  Manufacturer({
    required this.name,
    required this.image,
    required this.description,
  });

  Manufacturer.fromJson(Map<String, dynamic> parsedJson) {
    name = parsedJson['name'];
    image = parsedJson['image'];
    description = parsedJson['description'];
  }
}

class Artifact extends BaseModel {
  late final int equipmentId;
  late final int typeId;

  Artifact({
    required this.equipmentId,
    required this.typeId,
  });

  Artifact.fromJson(Map<String, dynamic> parsedJson) {
    equipmentId = parsedJson['equipementid'];
    typeId = parsedJson['typeid'];
  }
}

class ClassMod extends BaseModel {
  late final int equipmentId;
  late final int classId;

  ClassMod({
    required this.equipmentId,
    required this.classId,
  });

  ClassMod.fromJson(Map<String, dynamic> parsedJson) {
    equipmentId = parsedJson['equipmentid'];
    classId = parsedJson['classid'];
  }
}

class Rarity extends BaseModel {
  late final String name;
  late final String image;

  Rarity({
    required this.name,
    required this.image,
  });

  Rarity.fromJson(Map<String, dynamic> parsedJson) {
    name = parsedJson['rarityName'];
    image = parsedJson['image'];
  }
}

class Element extends BaseModel {
  late final String name;
  late final String description;

  Element({
    required this.name,
    required this.description,
  });

  Element.fromJson(dynamic parsedJson) {
    name = parsedJson[0]['name'];
    description = parsedJson[0]['description'];
  }
}

class Content extends BaseModel {
  late final String name;
  late final String description;

  Content({
    required this.name,
    required this.description,
  });

  Content.fromJson(Map<String, dynamic> parsedJson) {
    name = parsedJson['name'];
    description = parsedJson['description'];
  }
}

class EquipmentType extends BaseModel {
  late final String name;

  EquipmentType({
    required this.name,
  });

  EquipmentType.fromJson(Map<String, dynamic> parsedJson) {
    name = parsedJson['name'];
  }
}

class Type extends BaseModel {
  late final String name;
  late final String description;

  Type({
    required this.name,
    required this.description,
  });

  Type.fromJson(Map<String, dynamic> parsedJson) {
    name = parsedJson['name'];
    description = parsedJson['description'];
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

class CharacterDetailsCall extends BaseModel {
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

  CharacterDetailsCall.fromJson(dynamic json){
    name = json['name'];
    classs = Class.fromJson(json['class']);
    skins = Cosmetic.fromJson(json['skins']);
    //skills = Skill.fromJson(json['skills']);
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

   Cosmetic.fromJson(dynamic parsedJson) {
      
        name = parsedJson[0]['name'];
      
      
      image = parsedJson[0]['image'];
      characterId = parsedJson[0]['characterId'];
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

  Skill.fromJson(dynamic parsedJson) {
      
      characterId = parsedJson[0]['characterid'];
      name = parsedJson[0]['name'];
      description = parsedJson[0]['description'];
      skillTreeName = parsedJson[0]['skillTreeName'];
      skillType = parsedJson[0]['skillType'];
      requiredLvl = parsedJson[0]['requiredLvl'];
      points = parsedJson[0]['points'];
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
  late final String typeName;
  late final String description;

  EnnemyType({
    required this.typeName,
    required this.description,
  });

  EnnemyType.fromJson(Map<String, dynamic> parsedJson) {
    typeName = parsedJson['typeName'];
    description = parsedJson['description'];
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['typeName'] = typeName;
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
