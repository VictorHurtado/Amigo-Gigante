import 'package:amigo_gigante_app/animals/model/animal.dart';
import 'package:flutter/material.dart';

class Dog extends Animal{
     String name;
     String size;
     String fur;
     String docility;
     num maintenance;
     bool timeRequired;
     bool energy;
     String age;
     String raza;
     String img;
     int nMatch;
    Dog({Key key, this.size,this.fur,this.docility,this.maintenance,this.timeRequired,this.energy,this.age,this.raza,this.img, this.name,this.nMatch}):super();
    
    String getName(){
      return '${this.name}';
    }
    String getNmatch(){
      return '${this.nMatch}';
    }
     String getImg(){
    return '${this.img}';
  }
    factory Dog.fromJson(Map<String,dynamic> parsedJson){
      return new Dog(
        name: parsedJson['name'],
        size: parsedJson['size'],
        fur: parsedJson['fur'],
        docility: parsedJson['docility'],
        maintenance: parsedJson['maintenance'],
        timeRequired: parsedJson['timeRequired'],
        energy: parsedJson['energy'],
        age: parsedJson['age'],
        raza: parsedJson['raza'],
        nMatch:parsedJson['nMatch'],
        img: parsedJson['photo']
      );

    }
}