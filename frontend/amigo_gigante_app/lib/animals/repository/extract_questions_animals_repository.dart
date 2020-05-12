
import 'package:amigo_gigante_app/animals/repository/extract_questions_animals.dart';


class ExtractQuestionsAnimalRepository{
  final _extractQuestionsAPI= ExtractQuestionsAnimalsAPI();
  Future<String> loadAQuestionsAsset () => _extractQuestionsAPI.loadAQuestions();

}