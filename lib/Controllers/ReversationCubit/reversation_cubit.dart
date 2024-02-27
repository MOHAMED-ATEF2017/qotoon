import 'package:flutter_bloc/flutter_bloc.dart';

import 'reversation_state.dart';

class ReversationCubit extends Cubit<ReversationState> {
  ReversationCubit() : super(ReversationState());
  int index = 0;
  void changeIndex(int index) {
    this.index = index;
    emit(ReversationStateSuccess());
  }
}
