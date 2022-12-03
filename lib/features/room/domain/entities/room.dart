
import 'package:equatable/equatable.dart';


class Room extends Equatable{
  final String id;
  final String ownerToken;
  final List<String> playersTokens;
  final int opacity;
  final int limitRounds;
  final String roomTitle;

  const Room({
    required this.id,
    required this.ownerToken,
    required this.playersTokens,
    required this.opacity,
    required this.limitRounds,
    required this.roomTitle
  });

  @override
  List<Object?> get props => [id, ownerToken, playersTokens, opacity, limitRounds, roomTitle];


}
