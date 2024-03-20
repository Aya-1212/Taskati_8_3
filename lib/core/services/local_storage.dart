import 'package:hive/hive.dart';

class AppLocalStorage {
  static late Box box;
  static init (){
     box = Hive.box('user');
  }
  static cacheUserData (Key,value){
    box.put(Key, value);
  }
  static getUserData (Key){
    return box.get(Key);
  }
}