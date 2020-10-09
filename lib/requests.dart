import 'dart:convert';
import 'dart:io' as io;
import 'package:http/http.dart' as http;


class Requests{

  static final Requests _requests = Requests._internal();

  static String teams;
  //the tokens needed in this code are saved in a .json
  static Map tokens = jsonDecode(io.File('D:/ProjetosFlutter/DartPuro/twitter_furia_bot/lib/tokens.json').readAsStringSync());

  factory Requests(String t) {
    teams = t;
    return _requests;
  
  }
  Requests._internal();
  
  final String _pandaRequest = 'https://api.pandascore.co/teams/$teams/matches?filter[status]=not_started&token=${tokens['tokens']['pandaScore']}';
  var _twitterRequest; //TODO implementation

  Future<List> getGames() async {
    //makes the request on PandaScore and convert the .json in a List
    http.Response response;
    try{
      response = await http.get(_pandaRequest);
    }
    catch(Exception){
      return [];
    }
    return json.decode(response.body);
  }

}
