import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure() : super('Server Failure');
}

class CacheFailure extends Failure {
  const CacheFailure() : super('Cache Failure');
}

class NetworkFailure extends Failure {
  const NetworkFailure() : super('No Internet Connection.');
}
class CacheException extends Failure {
  const CacheException() : super('Cache Exception');
}
