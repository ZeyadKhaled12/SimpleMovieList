import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/network/error_message_model.dart';
import '../../domain/entities/room.dart';
import '../models/room_model.dart';

abstract class BaseRoomRemoteDataSource {
  Future<Room> joinRoom();

  Future<Room> createRoom();
}

class JCRemoteDataSource extends BaseRoomRemoteDataSource {

  @override
  Future<Room> createRoom() async {
    RoomModel roomModel = const RoomModel(
        id: '',
        ownerToken: '123456',
        playersTokens: [],
        opacity: 0,
        limitRounds:0,
        roomTitle: '');
    try {
      await FirebaseFirestore.instance
          .collection('rooms')
          .doc('')
          .set(roomModel.toJson());
      return await joinRoom();
    } on FirebaseException catch (e) {
      throw ServerException(ErrorMessageModel.fromJson(e));
    }
  }

  @override
  Future<Room> joinRoom() async {
    try {
      final response = await FirebaseFirestore.instance
          .collection('rooms')
          .doc('')
          .get()
          .then((value) => value);
      return RoomModel.fromJson(response.data()!);
    } on FirebaseException catch (e) {
      throw ServerException(ErrorMessageModel.fromJson(e));
    }
  }
}
