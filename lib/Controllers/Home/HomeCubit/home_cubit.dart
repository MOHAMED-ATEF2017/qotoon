import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qotoon/Modules/HomeModules/home_body.dart';
import 'package:qotoon/Screens/FavoriteScreen/favorite_screen.dart';
import 'package:qotoon/Screens/ReversationScreen/reversation_screen.dart';
import 'package:qotoon/Screens/SettingScreen/setting_screen.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());
  int initialIndex = 0;
  List<Widget> homeBodies = [
    const HomeBody(),
    const FavoriteScreen(),
    const ReversationScreen(),
    Container(),
    const SettingScreen(),
  ];
  void changeIndex(int index) {
    initialIndex = index;
    emit(HomeCubitSuccess());
  }
}
