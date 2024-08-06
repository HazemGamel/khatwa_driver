import '../core/class/crud.dart';

import '../core/contants/api.dart';

class CashDate{
  Crud crud;
  CashDate(this.crud);
  PostData()async{
    var response = await crud.postDataForCash(CashUrl.toString());
    return response.fold((left) => left, (right) => right);
  }

}