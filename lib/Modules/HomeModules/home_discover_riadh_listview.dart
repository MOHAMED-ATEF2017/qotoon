import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:qotoon/Controllers/Home/HomeBloc/home_event.dart';
import 'package:qotoon/Controllers/Home/HomeBloc/home_state.dart';
import 'package:qotoon/Shared/Components/loading_widget.dart';

import '../../Controllers/Home/HomeBloc/home_bloc.dart';
import '../../Shared/Components/error_text.dart';

class HomeDiscoverRiadhListView extends StatelessWidget {
  const HomeDiscoverRiadhListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = KiwiContainer().resolve<HomeBloc>();
    homeBloc.add(CitiesEventStart(context: context));
    return BlocBuilder(
      bloc: homeBloc,
      builder: (context, state) {
        return state is CitiesStateStart
            ? const LoadingWidget()
            : state is CitiesStateSuccess
                ? SizedBox(
                    height: 102.h,
                    child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Image.network(
                              state.citiesModel.data[index].image);
                        },
                        separatorBuilder: (context, index) {
                          return 16.horizontalSpace;
                        },
                        itemCount: state.citiesModel.data.length),
                  )
                : const ErrorCenterText();
      },
    );
  }
}
