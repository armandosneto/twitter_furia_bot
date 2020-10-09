

import 'package:twitter_furia_bot/infos.dart';

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

 void tweetTextBuild(){
  _tweetText = ("@arTcsgo, pra cima deles cachorrão!\n@kscerato hj tem heim!\n"
  "@yuurih boa sorte irmão, mostra pra eles quem é o camisa 10!\n@FURIA_VINI *beijinho do Guerri*\n"
  "@HEN1 morde eles Jacaré!\n@guerri Boa Sorte Paizão!\n\n@furia boa sorte contra a $_opponent, AMASSA ELES!");
  print(_tweetText);
 }
}