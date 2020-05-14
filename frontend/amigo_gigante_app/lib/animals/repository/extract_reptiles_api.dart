import 'package:http/http.dart' as http;
class ExtractsReptilesAPI {

   Future<http.Response> extractReptilesApi()async{
    String url= "http://192.168.0.15:4000/api/reptiles/extractReptiles";
  
    http.Response respHttp= await http.get(url);
     if (respHttp.statusCode == 200) {
      // Si la llamada al servidor fue exitosa, analiza el JSON
       return respHttp;
     } else {
      // Si la llamada no fue exitosa, lanza un error.
      throw Exception('Failed to load post');
     }
    
  }
}