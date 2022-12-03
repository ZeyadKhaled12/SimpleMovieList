
import 'package:equatable/equatable.dart';
import 'package:spy/core/utils/enums.dart';

import '../../domain/entities/room.dart';


class RoomState extends Equatable {
  final Room room;
  final RequestState requestState;
  final String roomMessage;

  const RoomState(
      {this.room = const Room(
          id: '',
          ownerToken: '',
          playersTokens: [],
          opacity: 0,
          limitRounds: 0,
          roomTitle: ''),
      this.requestState = RequestState.loading,
      this.roomMessage = ''});

  //that's to make the state change when something new happen
  RoomState copyWith({
    Room? room,
    RequestState? requestState,
    String? roomMessage
  }) {
    return RoomState(
        room: room ?? this.room,
        requestState: requestState ?? this.requestState,
        roomMessage: roomMessage ?? this.roomMessage);
  }

  @override
  List<Object?> get props => [room, requestState, roomMessage];


}
