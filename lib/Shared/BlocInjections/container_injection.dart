import 'package:kiwi/kiwi.dart';

import '../../Controllers/AboutUs/bloc/about_us_bloc.dart';
import '../../Controllers/Auth/LoginBloc/login_bloc.dart';
import '../../Controllers/Auth/ProfileBloc/get_user_bloc.dart';
import '../../Controllers/Auth/ProfileBloc/update_user_bloc.dart';
import '../../Controllers/Auth/ProfileBloc/update_user_cubit.dart';
import '../../Controllers/BookedStatus/bloc/booked_bloc.dart';
import '../../Controllers/FavoriteController/FavoriteBloc/favorite_bloc.dart';
import '../../Controllers/Home/HomeBloc/home_bloc.dart';
import '../../Controllers/Home/HomeCubit/home_cubit.dart';
import '../../Controllers/InvestWithUsControllers/InvestBloc/invest_bloc.dart';
import '../../Controllers/InvestWithUsControllers/cubit/invest_cubit.dart';
import '../../Controllers/MyApartmentsController/ApartmentBloc/apartment_bloc.dart';
import '../../Controllers/MyApartmentsController/ApartmentCubit/apartment_cubit.dart';
import '../../Controllers/PayBloc/pay_bloc.dart';
import '../../Controllers/Privacy/bloc/privacy_bloc.dart';
import '../../Controllers/ReversationCubit/reversation_cubit.dart';
import '../../Controllers/Search/CitiesBloc/cities_bloc.dart';
import '../../Controllers/Search/SearchBloc/search_bloc.dart';
import '../../Controllers/Search/Searchcubit/search_cubit.dart';
import '../../Controllers/Terms/bloc/terms_bloc.dart';

void initKiwi() {
  KiwiContainer container = KiwiContainer();
  container.registerFactory((c) => HomeCubit());
  container.registerFactory((c) => ReversationCubit());
  container.registerFactory((c) => LoginBloc());
  container.registerFactory((c) => HomeBloc());
  container.registerFactory((c) => AboutUsBloc());
  container.registerFactory((c) => TermsBloc());
  container.registerFactory((c) => PrivacyBloc());
  container.registerFactory((c) => CitiesBloc());
  container.registerFactory((c) => SearchCubit());
  container.registerFactory((c) => SearchBloc());
  container.registerFactory((c) => PayBloc());
  container.registerFactory((c) => ReversationBloc());
  container.registerFactory((c) => InvestBloc());
  container.registerFactory((c) => InvestCubit());
  container.registerFactory((c) => FavoriteBloc());
  container.registerFactory((c) => GetUserBloc());
  container.registerFactory((c) => UpdateProfileCubit());
  container.registerFactory((c) => UpdateProfileBloc());
  container.registerFactory((c) => ApartmentBloc());
  container.registerFactory((c) => ApartmentCubit());
}
