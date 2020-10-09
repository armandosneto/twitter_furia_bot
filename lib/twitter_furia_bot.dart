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

    //testing the tweet creation even without twitter integration
    Tweet test = Tweet(gamesOBJ[0]);
    test.tweetTextBuild();

  } else{
    print('There is no matches these days!');
  }
}
