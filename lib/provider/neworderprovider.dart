import 'package:flutter/material.dart';
import 'package:task/model/neworder.dart';

class Neworderprovider with ChangeNotifier{
  List<NewOrdermodel>newordermodel=[];

  additem(NewOrdermodel newOrdermodel){
    newordermodel.add(newOrdermodel);
    notifyListeners();
  }
  deleteitem(NewOrdermodel newOrdermodel){
    newordermodel.remove(newOrdermodel);
    notifyListeners();
  }
}