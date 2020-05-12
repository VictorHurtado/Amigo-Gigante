
import 'package:amigo_gigante_app/animals/repository/send_birds_responses_api.dart';
import 'package:amigo_gigante_app/animals/repository/send_cats_responses_api.dart';
import 'package:amigo_gigante_app/animals/repository/send_dogs_responses_api.dart';
import 'package:amigo_gigante_app/animals/repository/send_reptiles_responses_api.dart';
import 'package:http/http.dart' as http;
class SendResponsesAnimalRepository{
  var _sendDogsResponsesApi= SendDogsResponsesAPI();
  var _sendCatsResponsesApi= SendCatsResponsesAPI();
  var _sendBirdsResponsesApi=SendBirdsResponsesAPI();
  var _sendReptilesResponsesApi=SendReptilesResponsesAPI();
  Future<http.Response> sendDogsResponsesREST(String resp)=>_sendDogsResponsesApi.sendDogsResponsesApi(resp);
  Future<http.Response> sendCatsResponsesREST(String resp)=>_sendCatsResponsesApi.sendCatsResponsesApi(resp);
  Future<http.Response> sendBirdsResponsesREST(String resp)=>_sendBirdsResponsesApi.sendBirdsResponsesApi(resp);
  Future<http.Response> sendReptilesResponsesREST(String resp)=>_sendReptilesResponsesApi.sendReptilesResponsesApi(resp);

}