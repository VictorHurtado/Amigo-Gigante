import 'send_reponses_api.dart';
import 'package:http/http.dart' as http;
class SendResponsesRepository{
  var _sendResponsesApi= SendResponsesAPI();
  Future<http.Response> sendResponsesREST(String resp)=>_sendResponsesApi.sendResponsesApi(resp);

}