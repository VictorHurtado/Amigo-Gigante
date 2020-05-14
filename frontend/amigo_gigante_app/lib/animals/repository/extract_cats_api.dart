import 'package:http/http.dart' as http;
class ExtractCatsAPI {

   Future<http.Response> extractCatsApi( )async{
    String url= "http://192.168.0.15:4000/api/cats/extractCats";
  
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