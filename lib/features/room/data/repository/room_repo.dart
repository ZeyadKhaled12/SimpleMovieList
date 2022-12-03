import 'package:dartz/dartz.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/room.dart';
import '../../domain/repository/base_room_repo.dart';
import '../datasource/room_remote_data_source.dart';

class RoomRepo extends BaseRoomRepo {
  BaseRoomRemoteDataSource baseJCRemoteDataSource;

  RoomRepo(this.baseJCRemoteDataSource);

  @override
  Future<Either<Failure, Room>> joinRoom() async {
    final result = await baseJCRemoteDataSource.joinRoom();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, Room>> createRoom() async {
    final result = await baseJCRemoteDataSource.createRoom();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
