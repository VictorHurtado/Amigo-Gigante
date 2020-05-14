

import 'package:amigo_gigante_app/animals/repository/extract_birds_api.dart';
import 'package:amigo_gigante_app/animals/repository/extract_cats_api.dart';
import 'package:amigo_gigante_app/animals/repository/extract_dogs_api.dart';
import 'package:amigo_gigante_app/animals/repository/extract_reptiles_api.dart';
import 'package:http/http.dart' as http;
class ExtractAnimalRepository{
  var _extractDogsApi= ExtractDogsAPI();
  var _extractCatsApi= ExtractCatsAPI();
  var _extractBirdsApi=ExtractBirdsAPI();
  var _extractReptilesApi=ExtractsReptilesAPI();
  Future<http.Response> extractDogsRepository()=>_extractDogsApi.extractDogsApi();
  Future<http.Response> extractCatsRepository()=>_extractCatsApi.extractCatsApi();
  Future<http.Response> extractBirdsRepository()=>_extractBirdsApi.extractBirdsApi();
  Future<http.Response> extractReptilesRepository()=>_extractReptilesApi.extractReptilesApi();

}