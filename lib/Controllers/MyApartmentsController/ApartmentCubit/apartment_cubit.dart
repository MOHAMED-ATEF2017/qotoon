import 'package:flutter_bloc/flutter_bloc.dart';

import 'apartment_state.dart';

class ApartmentCubit extends Cubit<ApartmentCubitState> {
  ApartmentCubit() : super(ApartmentCubitState());
  int selectedIndex = 0;
  void changeSelectedIndex(int value) {
    selectedIndex = value;
    emit(ApartmentCubitStateStart());
  }
}
