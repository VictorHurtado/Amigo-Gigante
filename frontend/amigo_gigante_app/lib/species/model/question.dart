import 'package:flutter/material.dart';

class Question {
  String title;
  String description;
  List<String> weight;
  List<String> answers;
  

  Question ({Key key, this.title,this.description,this.answers,this.weight});

  factory Question.fromJson(Map<String,dynamic> parsedJson, int index){
    var answersFromJson =parsedJson["answers"]["$index"];
    List<String> answersList =List<String>.from(answersFromJson);
    var weightFromJson =parsedJson["weight"]["$index"];
    List<String> listWeight= List<String>.from(weightFromJson);
  
    return new Question(
      title: "${index}",
      description: parsedJson["questions"]["${index}"],
      weight: listWeight,
      answers: answersList,
    );
  }
  

}