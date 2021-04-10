import 'package:equatable/equatable.dart';

abstract class Status extends Equatable {}

class Success extends Status {
  final String message;

  Success(this.message);

  @override
  List<Object> get props => [message];
}

class Failure extends Status {
  final String message;
  final int type;

  Failure({this.message,this.type});

  @override
  List<Object> get props => [message,type];
}
