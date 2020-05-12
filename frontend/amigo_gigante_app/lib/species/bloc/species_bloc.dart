import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:amigo_gigante_app/species/model/question.dart';
import 'package:amigo_gigante_app/species/repository/extract_questions_repository.dart';
import 'package:amigo_gigante_app/species/repository/send_responses_repository.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
class SpeciesBloc extends Bloc{
  final _extract_questions_repository= ExtractQuestionsRepository();
  final _send_responses_repository=SendResponsesRepository();
  var responses=Map();

  // Carga de Preguntas
  //1 extraer el string del json
  //2 parsear 
  //3 contruir la pregunta
  Future<List<Question>> createdQuestions () async{  
    String jsonString= await _extract_questions_repository.loadAQuestionsAsset();
    var _jsonDecode= json.decode(jsonString);
    List<String> keysList= (_jsonDecode['questions'].keys.toList());
    var questions=List<Question>();
    for (var i = 1; i < keysList.length+1; i++) {
      questions.add(Question.fromJson(_jsonDecode, i));
    }
    return questions;
  }
  
  //enviar las respuestas al servidor
  Future <String> recomendSpecies()async{
    String resp=jsonEncode(responses);
    await Future.delayed(Duration(seconds:5));
    http.Response jsonString= await _send_responses_repository.sendResponsesREST(resp);
    
    return jsonString.body;
  }
  //guardar la respuesta
  void saveQuestion(String indexView,String response,String weightQuestion){ 
    
    var myResponse={
      indexView: [response,int.parse(weightQuestion)]
    };
    responses.addAll(myResponse);
    print("asi quedo el map: $responses");
  }
  //retornar lista de respuesta
  List<num> toDouble(String jsonString){
    var jsonDecode= json.decode(jsonString);
    
    List<num> porcents = List<num>.from(jsonDecode);
    return porcents;
  }
  @override
  void dispose() {
    // TODO: implement dispose
  }


}