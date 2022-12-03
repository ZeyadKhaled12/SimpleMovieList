import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spy/core/utils/enums.dart';

import '../../domain/usecases/create_room_uc.dart';
import '../../domain/usecases/join_room_uc.dart';
import 'room_event.dart';
import 'room_state.dart';


class RoomBloc extends Bloc<RoomEvent, RoomState>{
  final JoinRoomUc joinRoomUc;
  final CreateRoomUc createRoomUc;

  RoomBloc(this.createRoomUc, this.joinRoomUc) : super(const RoomState()){
    on<JoinRoomEvent>(_joinRoom);
    on<CreateRoomEvent>(_createRoom);
  }

  FutureOr<void> _joinRoom(JoinRoomEvent event, Emitter<RoomState> emit) async{
    final result = await joinRoomUc.call();
    result.fold(
            (l) => emit(state.copyWith(
              requestState: RequestState.error,
              roomMessage: l.message)),
            (r) => emit(state.copyWith(
              room: r,
              requestState: RequestState.loaded
            )));
  }

  FutureOr<void> _createRoom(CreateRoomEvent event, Emitter<RoomState> emit) async{
    final result = await createRoomUc.call();
    result.fold(
            (l) => emit(state.copyWith(
            requestState: RequestState.error,
            roomMessage: l.message)),
            (r) => emit(state.copyWith(
            room: r,
            requestState: RequestState.loaded
        )));
  }
}