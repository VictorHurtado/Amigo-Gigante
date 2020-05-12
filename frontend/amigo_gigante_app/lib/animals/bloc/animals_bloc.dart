import 'dart:convert';

import 'package:amigo_gigante_app/animals/model/animal.dart';
import 'package:amigo_gigante_app/animals/model/bird.dart';
import 'package:amigo_gigante_app/animals/model/cat.dart';
import 'package:amigo_gigante_app/animals/model/dog.dart';
import 'package:amigo_gigante_app/animals/model/reptile.dart';
import 'package:amigo_gigante_app/animals/repository/extract_questions_animals_repository.dart';
import 'package:amigo_gigante_app/animals/repository/send_animal_responses_repository.dart';
import 'package:amigo_gigante_app/species/model/question.dart';

import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class AnimalBloc extends Bloc{
  final _extract_questions_repository= ExtractQuestionsAnimalRepository();
  final _send_animal_responses_repository= SendResponsesAnimalRepository();
  
  var responsesDogs=Map();
  var responsesCats=Map();
  var responsesBirds=Map();
  var responsesReptiles=Map();
  // Extraccion y creacion de las preguntas como estructura

  //caso perros
  Future<List<Question>> createdQuestionsDogs () async{  
    String jsonString= await _extract_questions_repository.loadAQuestionsAsset();
    var _jsonDecode= json.decode(jsonString);
    
    List<String> keysList= (_jsonDecode['dogs']['questions'].keys.toList());
    var questions=List<Question>();
    for (var i = 1; i < keysList.length+1; i++) {
      questions.add(Question.fromJson(_jsonDecode['dogs'], i));
    }
    print(questions);
    return questions;
  }
  void saveQuestionDogs(String indexView,String response,String weightQuestion){ 
    
    var myResponse={
      indexView: [response,weightQuestion]
    };
    responsesDogs.addAll(myResponse);
    print("asi quedo el map: $responsesDogs");
  }
  Future<String> recomendDog()async{
    String resp= jsonEncode(responsesDogs);
     await Future.delayed(Duration(seconds:5));
    var jsonString= await _send_animal_responses_repository.sendDogsResponsesREST(resp);
    print(jsonString.body);
    return jsonString.body;
  }
  List<Animal> convertToDogs(String jsonString){
    var _jsonDecode= json.decode(jsonString);
    List<Animal> animals=[];
    print(_jsonDecode['slicesMP']);
    for (var item in _jsonDecode['slicesMP']) {
      
      animals.add(Dog.fromJson(item));
    }
    print(animals);
    return animals;
  }
  
  
  //caso Gatos
   Future<List<Question>> createdQuestionsCats () async{  
    String jsonString= await _extract_questions_repository.loadAQuestionsAsset();
    var _jsonDecode= json.decode(jsonString);
   
    List<String> keysList= (_jsonDecode['cats']['questions'].keys.toList());
    var questions=List<Question>();
    for (var i = 1; i < keysList.length+1; i++) {
      questions.add(Question.fromJson(_jsonDecode['cats'], i));
    }
    print(questions);
    return questions;
  }
  void saveQuestionCats(String indexView,String response,String weightQuestion){ 
    
    var myResponse={
      indexView: [response,weightQuestion]
    };
    responsesCats.addAll(myResponse);
    print("asi quedo el map: $responsesCats");
  }
    Future<String> recomendCat()async{
    String resp= jsonEncode(responsesCats);
     await Future.delayed(Duration(seconds:5));
    var jsonString= await _send_animal_responses_repository.sendCatsResponsesREST(resp);
    print(jsonString.body);
    return jsonString.body;
  }
  List<Animal> convertToCats(String jsonString){
    var _jsonDecode= json.decode(jsonString);
    List<Animal> animals=[];
    print(_jsonDecode['slicesMP']);
    for (var item in _jsonDecode['slicesMP']) {
      
      animals.add(Cat.fromJson(item));
    }

    return animals;
  }
  
    
  //caso Aves
   Future<List<Question>> createdQuestionsBirds () async{  
    String jsonString= await _extract_questions_repository.loadAQuestionsAsset();
    var _jsonDecode= json.decode(jsonString);
   
    List<String> keysList= (_jsonDecode['birds']['questions'].keys.toList());
    var questions=List<Question>();
    for (var i = 1; i < keysList.length+1; i++) {
      questions.add(Question.fromJson(_jsonDecode['birds'], i));
    }
    print(questions);
    return questions;
  }
  void saveQuestionBirds(String indexView,String response,String weightQuestion){ 
    
    var myResponse={
      indexView: [response,weightQuestion]
    };
    responsesBirds.addAll(myResponse);
    print("asi quedo el map: $responsesBirds");
  }
  Future<String> recomendBird()async{
    String resp= jsonEncode(responsesBirds);
     await Future.delayed(Duration(seconds:5));
    var jsonString= await _send_animal_responses_repository.sendBirdsResponsesREST(resp);
    print(jsonString.body);
    return jsonString.body;
  }
  List<Animal> convertToBird(String jsonString){
    var _jsonDecode= json.decode(jsonString);
    List<Animal> animals=[];
    print(_jsonDecode['slicesMP']);
    for (var item in _jsonDecode['slicesMP']) {
      
      animals.add(Bird.fromJson(item));
    }
    return animals;
  }
  
  //caso Reptiles
  Future<List<Question>> createdQuestionsReptiles() async{  
    String jsonString= await _extract_questions_repository.loadAQuestionsAsset();
    var _jsonDecode= json.decode(jsonString);
   
    List<String> keysList= (_jsonDecode['reptiles']['questions'].keys.toList());
    var questions=List<Question>();
    for (var i = 1; i < keysList.length+1; i++) {
      questions.add(Question.fromJson(_jsonDecode['reptiles'], i));
    }
    print(questions);
    return questions;
  }
   void saveQuestionReptiles(String indexView,String response,String weightQuestion){ 
    
    var myResponse={
      indexView: [response,weightQuestion]
    };
    responsesBirds.addAll(myResponse);
    print("asi quedo el map: $responsesReptiles");
  }
    Future<String> recomendReptile()async{
    String resp= jsonEncode(responsesReptiles);
     await Future.delayed(Duration(seconds:5));
    var jsonString= await _send_animal_responses_repository.sendReptilesResponsesREST(resp);
    print(jsonString.body);
    return jsonString.body;
  }
  List<Animal> convertToReptile(String jsonString){
    var _jsonDecode= json.decode(jsonString);
    List<Animal> animals=[];
    print(_jsonDecode['slicesMP']);
    for (var item in _jsonDecode['slicesMP']) {
      
      animals.add(Reptile.fromJson(item));
    }
    return animals;
  }
  
  

    @override
    void dispose() {
      // TODO: implement dispose
    }
  
  }
  
 