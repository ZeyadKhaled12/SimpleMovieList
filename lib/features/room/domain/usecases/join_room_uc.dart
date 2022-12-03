import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../entities/room.dart';
import '../repository/base_room_repo.dart';

class JoinRoomUc extends BaseUseCase{

  final BaseRoomRepo baseJCRepo;
  JoinRoomUc(this.baseJCRepo);

  @override
  Future<Either<Failure, Room>> call() async{
    return await baseJCRepo.joinRoom();
  }

}