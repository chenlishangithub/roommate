import 'package:roommate_app/service/http.dart';
import 'package:roommate_app/service/api.dart';
import 'package:roommate_app/service/resultData.dart';
import 'dart:convert';


class Request {
  static Future<ResultData> getRoommateList()async{
    return await http.get(API.getRoommateList).then((res) {
      return new ResultData.fromJson(json.decode(res.toString()));
    });
  }
}
