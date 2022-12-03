import '../../domain/entities/room.dart';

class RoomModel extends Room {
  const RoomModel({required String id, required String ownerToken,
      required List<String> playersTokens,
      required int opacity,
      required int limitRounds,
      required String roomTitle})
      : super(id: id,
            ownerToken: ownerToken,
            playersTokens: playersTokens,
            opacity: opacity,
            limitRounds: limitRounds,
            roomTitle: roomTitle);

  factory RoomModel.fromJson(Map<String, dynamic> json) => RoomModel(
      id: json['id'],
      opacity: json['opacity'],
      ownerToken: json['owner_token'],
      limitRounds: json['limit_rounds'],
      playersTokens: json['players_tokens'],
      roomTitle: json['room_title']);

  Map<String, dynamic> toJson() => {'id':id,
        'opacity': opacity,
        'owner_token': ownerToken,
        'limit_rounds': limitRounds,
        'players_tokens': playersTokens,
        'room_title': roomTitle
      };
}
