

import 'package:http/http.dart' as http;
class SendResponsesAPI{
  Future<http.Response> sendResponsesApi(String resp)async{
    String url= "http://192.168.0.15:4000/api/spice/pruebaPeticionPost";

    http.Response respHttp= await http.post(url,body:{"myResponses":resp});
    return respHttp;
  }
}