import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:qotoon/Controllers/Home/HomeBloc/home_bloc.dart';
import 'package:qotoon/Controllers/Home/HomeBloc/home_event.dart';
import 'package:qotoon/Controllers/Home/HomeBloc/home_state.dart';
import 'package:qotoon/Shared/Components/error_text.dart';
import 'package:qotoon/Shared/Components/loading_widget.dart';

import '../../Models/discover_qotoon_model.dart';

class HomeDiscoverQotoonListView extends StatelessWidget {
  const HomeDiscoverQotoonListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = KiwiContainer().resolve<HomeBloc>();
    homeBloc.add(DiscoverQotoonEventStart(context: context));
    return BlocBuilder(
      bloc: homeBloc,
      builder: (context, state) {
        return state is DiscoverQotoonStateStart
            ? const LoadingWidget()
            : state is DiscoverQotoonStateSuccess
                ? SizedBox(
                    height: 102.h,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          DiscoverQotoonDatum data =
                              state.discoverQotoonModel.data[index];
                          return data.images.isEmpty
                              ? Container(
                                  width: 152.w,
                                  height: 102.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    image: const DecorationImage(
                                        image: NetworkImage(
                                            "https://icon-library.com/images/no-picture-available-icon/no-picture-available-icon-1.jpg")),
                                  ))
                              : Container(
                                  width: 152.w,
                                  height: 102.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            data.images.first.image)),
                                  ));
                        },
                        separatorBuilder: (context, index) {
                          return 16.horizontalSpace;
                        },
                        itemCount: state.discoverQotoonModel.data.length),
                  )
                : const ErrorCenterText();
      },
    );
  }
}
