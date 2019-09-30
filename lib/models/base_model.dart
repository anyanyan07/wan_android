class BaseModel {
  int errorCode;
  String errorMsg;

  BaseModel.fromJson(Map<String, dynamic> map)
      : errorCode = map['errorCode'],
        errorMsg = map['errorMsg'];
}
