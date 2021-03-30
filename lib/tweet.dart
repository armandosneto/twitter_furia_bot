
import 'dart:convert';
import 'package:twitter_furia_bot/infos.dart';
import 'package:twitter_api/twitter_api.dart';


class Tweet{
 //TODO

DateTime _tweetHour;
String _opponent;
String _tweetText;


 Tweet(Infos match){

   //setting tweet time post to 1 hour and 30 minutes before match
  _tweetHour = match.getDate().subtract(Duration(hours: 1,minutes:30));
  _opponent = match.getOpponent();

 }

 void tweetBuild(Map twitterKeys) async {
  final String _tweetText = '@arTcsgo, @kscerato, @yuurih, @FURIA_VINI, @h0ndaog '
  '@1juniorcs e @guerri, e dia de furia fml, sem escandalo, @furia boa sorte contra a $_opponent, AMASSA ELES!';


  final _twitterOauth = new twitterApi(
  consumerKey: twitterKeys['apiKey'],
  consumerSecret: twitterKeys['apiKeySecret'],
  token: twitterKeys['accessToken'],
  tokenSecret: twitterKeys['acessTokenSecret']
  );

  Future tweetRequest = _twitterOauth.getTwitterRequest(
    'POST',
    'statuses/update.json',
    options: {
        'status' : _tweetText
    }
  );

    var response = await tweetRequest;
    print("status code:" + response.statusCode);

 }

 DateTime getTweetHour() => _tweetHour;
}