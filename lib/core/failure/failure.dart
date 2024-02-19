import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection Timeout With Api Server");

      case DioExceptionType.sendTimeout:
        return ServerFailure("Send Timeout With Api Server");

      case DioExceptionType.receiveTimeout:
        return ServerFailure("receive Timeout with Api Server");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );

      case DioExceptionType.badCertificate:
        return ServerFailure("incorrect certificate");

      case DioExceptionType.cancel:
        return ServerFailure("cancel request with Api Server");

      case DioExceptionType.connectionError:
        return ServerFailure("connection Error");

      case DioExceptionType.unknown:
        // if (dioException.message!.contains('SocketException')) {
        //   return ServerFailure("No Internet Connection");
        // }
        return ServerFailure(
            "No Internet Connection or there is an error \n please try again");
      default:
        return ServerFailure("Opps There was an error ");
    }
  }

  factory ServerFailure.fromResponse(int statusCode,dynamic response){
    if(statusCode == 400 || statusCode == 401 || statusCode == 403){
      return ServerFailure(response['error']['message']);
    }
    else if (statusCode == 404){
      return ServerFailure('your request not found, please try again');
    }
    else if (statusCode == 404){
      return ServerFailure('Internal server error, please try again');
    }else{
      return ServerFailure('Opps There was an error');
    }
  }
}
