class ResultData {
  var data;
  int code;
  String message;

  ResultData.fromJson(Map<String, dynamic> json){
    data = json['data'];
    code = json['code'];
    message = json['message'];
  }
}