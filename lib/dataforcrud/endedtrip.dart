import 'dart:convert';

import '../core/class/crud.dart';

import '../core/contants/api.dart';

class EndedTripData{
  Crud crud;
  EndedTripData(this.crud);
  getData(tripid,pick1,pick2)async{
    var response = await crud.postData(endtrip(tripid),
     {
         "latitude":pick1,
         "longitude":pick2,
       });
    return response.fold((left) => left, (right) => right);
  }

}