import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage ;

  Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

    factory ServerFailure.dioException(DioException dioException){
      switch (dioException.type){
        
        case DioExceptionType.connectionTimeout:
          return ServerFailure(errMessage: "Connection timeout with ApiServer") ;
        case DioExceptionType.sendTimeout:
          return ServerFailure(errMessage: "Send timeout with ApiServer") ;
        case DioExceptionType.receiveTimeout:
          return ServerFailure(errMessage: "Receive timeout with ApiServer") ;
        case DioExceptionType.badCertificate:
          return ServerFailure(errMessage: "Bad Certificate with ApiServer") ;
        case DioExceptionType.badResponse:
        
          return ServerFailure.fromResponse(dioException.response?.statusCode, dioException.response) ;
        case DioExceptionType.cancel:
          ServerFailure(errMessage: "Request to ApiServer was canceld");
        case DioExceptionType.connectionError:
          if (dioException.message!.contains('SocketException')) {
          return ServerFailure(errMessage: 'No Internet Connection');
        }
        case DioExceptionType.unknown:
          ServerFailure(errMessage: "there was unexpected error") ;
      }
      return ServerFailure(errMessage: "there was unknown error") ;
    }


  factory ServerFailure.fromResponse(int? statusCode, dynamic response){
       if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errMessage:  response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(errMessage:  'Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure(errMessage:  'Internal Server error, Please try later');
    } else {
      return ServerFailure(errMessage:  'Opps There was an Error, Please try again');
    }
  }

}