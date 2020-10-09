
class Infos {

  static String team;
  String _opponent;
  DateTime _date;

  Infos(Map game){
    if(game['opponents'][0]['opponent']['slug'] != team){
      _opponent = game['opponents'][0]['opponent']['name'];
    }else/* if (game['opponents'] != null)*/{
      try{
        _opponent = game['opponents'][1]['opponent']['name'];
      } catch (Exception){}
    }
    _date = _dateConvert(game['begin_at']);
  }

  DateTime _dateConvert(String pandaFormat){
    //convert date to DateTime format and to Brazilian fuse
    DateTime _converted = DateTime.parse(pandaFormat).subtract(Duration(hours: 3));
    return _converted;
  }

  String getOpponent() => _opponent;
  DateTime getDate()=> _date;
}