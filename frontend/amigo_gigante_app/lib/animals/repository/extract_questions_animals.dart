
import 'package:flutter/services.dart';

class ExtractQuestionsAnimalsAPI {

  Future<String> loadAQuestions() async {
    
    return await rootBundle.loadString('assets/resources/questions_animals.json');
    
  }

}