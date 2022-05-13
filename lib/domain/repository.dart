import 'package:dartz/dartz.dart';
import 'package:untitled/domain/model.dart';

import '../data/network/Failure.dart';
import '../data/request/request.dart';

abstract class Repository{
  Future<Either<Failure,Authentication>> login(LoginRequest loginRequest);
}