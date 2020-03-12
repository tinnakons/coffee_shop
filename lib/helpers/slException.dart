class SLException implements Exception {
  String errMessage;
  SLException(String message){

    this.errMessage =message;

  }

  String errorMessage(){
    return this.errMessage;
  }
}