import '../../../Models/reversations_model.dart';

class ReversationState {}

final class ReversationStateStart extends ReversationState {}

final class ReversationStateSuccess extends ReversationState {
  final ReversationsModel reversationsModel;

  ReversationStateSuccess({required this.reversationsModel});
}

final class ReversationStateFailed extends ReversationState {}
