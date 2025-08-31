import 'package:equatable/equatable.dart';


abstract class Failure extends Equatable {
final String message;
const Failure(this.message);
@override
List<Object?> get props => [message];
}


class NetworkFailure extends Failure { const NetworkFailure(String msg) : super(msg); }
class CacheFailure extends Failure { const CacheFailure(String msg) : super(msg); }
class ParsingFailure extends Failure { const ParsingFailure(String msg) : super(msg); }