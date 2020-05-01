
import 'package:flutter/services.dart';

class ExtractQuestionsAPI {

  Future<String> loadAQuestions() async {
    
    return await rootBundle.loadString('assets/resources/questions.json');
    
  }

}