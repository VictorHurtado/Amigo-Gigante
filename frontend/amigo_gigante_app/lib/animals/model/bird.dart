
import 'package:amigo_gigante_app/animals/model/animal.dart';
import 'package:flutter/material.dart';

class Bird extends Animal{
  String name;
  String size;
  bool sound;
  bool domesticate;
  String color;
  num maintenance;
  String age;
  String raza;
  String img;
  int nMatch;

  Bird({Key key,this.name,this.size,this.sound,this.domesticate,this.color,this.maintenance,this.age,this.raza,this.img,this.nMatch});

   String getName(){
      return '${this.name}';
    }
    String getNmatch(){
      return '${this.nMatch}';
    }
  factory Bird.fromJson(Map<String,dynamic> parsedJson){
      
      return new Bird(
        name: parsedJson['name'],
        size: parsedJson['size'],
        sound: parsedJson['domesticate'],
        color: parsedJson['color'],
        maintenance: parsedJson['maintenance'],
        age: parsedJson['age'],
        raza: parsedJson['raza'],
        img: parsedJson['photo'],
        nMatch: parsedJson['nMatch']
      );

    }

} 