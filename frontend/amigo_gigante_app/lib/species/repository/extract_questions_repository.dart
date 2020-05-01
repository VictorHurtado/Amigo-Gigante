
import 'package:amigo_gigante_app/species/repository/extract_questions.dart';

class ExtractQuestionsRepository{
  final _extractQuestionsAPI= ExtractQuestionsAPI();
  Future<String> loadAQuestionsAsset () => _extractQuestionsAPI.loadAQuestions();

}