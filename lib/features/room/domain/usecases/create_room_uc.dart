import 'package:dartz/dartz.dart';
import 'package:spy/core/usecase/base_use_case.dart';

import '../../../../core/error/failure.dart';
import '../entities/room.dart';
import '../repository/base_room_repo.dart';

class CreateRoomUc extends BaseUseCase{

  final BaseRoomRepo baseJCRepo;
  CreateRoomUc(this.baseJCRepo);

  @override
  Future<Either<Failure, Room>> call() async{
    return await baseJCRepo.createRoom();
  }

  
}