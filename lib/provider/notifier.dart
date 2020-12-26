

import 'package:flutter/widgets.dart';

class SideNotifier with ChangeNotifier{
 int x =1;
 bool openit = true;


 bool openside (){
   return openit;
 }

 void changeopen(){
   openit = !openit;
   notifyListeners();
 }

  int position (){
    return x;
  }
  void changeview(int po){
        x=po;

    notifyListeners();

  }

}