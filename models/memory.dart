class Memoria{
  String _value='0';

  void applyCommand(String command){
    if(command == 'AC'){
      _allClear();
    } else{
      _value += command;
    }
    _value += command;
  }

  _allClear(){
    _value = '0' 
     }

  String get value{
    return _value;
  }
}