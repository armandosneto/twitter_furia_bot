import 'dart:io';


import 'package:twitter_furia_bot/requests.dart';
import 'package:twitter_furia_bot/infos.dart';
import 'package:twitter_furia_bot/tweet.dart';

void main() async{
  String team = 'furia';
  Infos.team = team;

  Requests catcher = Requests(team);


  List gamesList = await catcher.getGames();

  if(gamesList.length > 0){


    List<Infos> gamesOBJ = [];


    for(Map temp in gamesList){
      gamesOBJ.add(Infos(temp));
    }
    //sorting games by date
    gamesOBJ.sort((a,b)=> a.getDate().compareTo(b.getDate()));
    print('All matches are loaded!');

    for(Infos nextGame in gamesOBJ){
      Tweet tweet = Tweet(nextGame);
    
      while(true){
        if(DateTime.now().compareTo(tweet.getTweetHour()) >= 0){
          if(DateTime.now().compareTo(nextGame.getDate())<=0){
            tweet.tweetBuild(Requests.tokens['tokens']['twitter']);
            break;
          }else{
            print("the game is happening or has happened!");
            break;
          }
        }else print("it's not time yet!");
        await sleep(Duration(minutes: 5));
      }  
    }
  } else{
      print('There is no matches these days!');
  }

}
