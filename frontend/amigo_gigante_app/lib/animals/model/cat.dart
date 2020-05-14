import 'package:amigo_gigante_app/animals/model/animal.dart';
import 'package:flutter/material.dart';

class Cat extends Animal{
  String name;
  String fur;
  num maintenance;
  String age;
  List<String> personality;
  String raza;
  String img;
  int nMatch;
  
  Cat({Key key, this.name,this.fur,this.maintenance,this.age,this.personality,this.raza,this.img,this.nMatch});
   String getName(){
      return '${this.name}';
    }
    String getNmatch(){
      return '${this.nMatch}';
    }
     String getImg(){
    return '${this.img}';
  }
  factory Cat.fromJson(Map<String,dynamic> parsedJson){
        var personalityFromJson =parsedJson["personality"];
      List<String> personality =List<String>.from(personalityFromJson);
      return new Cat(
        name: parsedJson['name'],
        fur: parsedJson['fur'],
        maintenance: parsedJson['maintenance'],
        age: parsedJson['age'],
        personality: personality,
        raza: parsedJson['raza'],
        img: parsedJson['photo'],
        nMatch: parsedJson['nMatch']
      );

    }

}
