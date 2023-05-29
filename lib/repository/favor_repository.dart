import '../models/favor.dart';

class FavorRepository{
  static List<String> nameList = ["Mohamed", "Kenneth", "IzyClapp", "Omar"];
  static List<Favor> favorList = [];

  static void addFavor(Favor fx){
    favorList.add(fx);
  }

  static void refuseFavor(Favor fx){
    fx.statut = -1;
  }

  static void acceptFavor(Favor fx){
    fx.statut = 1;
  }

  static String first(List<String> lx){
    return lx[0];
  }
}