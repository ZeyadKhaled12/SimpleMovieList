import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/room.dart';

abstract class BaseRoomRepo{
  Future<Either<Failure, Room>> joinRoom();
  Future<Either<Failure, Room>> createRoom();
}