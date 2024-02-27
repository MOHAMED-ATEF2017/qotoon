import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:qotoon/Controllers/Home/HomeBloc/home_event.dart';
import 'package:qotoon/Controllers/Home/HomeBloc/home_state.dart';
import 'package:qotoon/Shared/Components/loading_widget.dart';
import 'package:qotoon/Shared/Constants/app_colors.dart';
import 'package:qotoon/Shared/Constants/app_strings.dart';
import 'package:qotoon/gen/assets.gen.dart';

import '../../Controllers/Home/HomeBloc/home_bloc.dart';
import '../../Shared/Components/text_style.dart';

class HomeOfferStack extends StatelessWidget {
  const HomeOfferStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = KiwiContainer().resolve<HomeBloc>();
    homeBloc.add(OffersEventStart(context: context));

    return BlocBuilder(
      bloc: homeBloc,
      builder: (context, state) {
        return state is OffersStateSuccess
            ? Stack(
                clipBehavior: Clip.none,
                children: [
                  CarouselSlider.builder(
                      itemCount: state.offersModel.data.length,
                      itemBuilder: (context, index, realIndex) => Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    colorFilter: ColorFilter.mode(
                                        Colors.black.withOpacity(.5),
                                        BlendMode.srcATop),
                                    image: NetworkImage(
                                        state.offersModel.data[index].image),
                                    fit: BoxFit.fill)),
                            child: Text(
                              state.offersModel.data[index].desc,
                              style: textStyle(
                                  size: 20,
                                  color: AppColors.ffE0BC66BorderColor,
                                  weight: FontWeight.bold),
                            ),
                          ),
                      options: CarouselOptions(
                          autoPlay: true,
                          disableCenter: true,
                          viewportFraction: 1,
                          aspectRatio: (375.w) / (150.h))),
                  // Assets.images.offer.image(
                  //   height: 131.h,
                  //   width: 375.w,
                  //   fit: BoxFit.fill,
                  // ),
                  PositionedDirectional(
                      top: -20.h,
                      start: -25.w,
                      child: Assets.images.offertrans.image()),
                  PositionedDirectional(
                      top: 0.h,
                      start: 0.w,
                      child: Transform.rotate(
                        angle: -18,
                        child: Text(
                          AppStrings.newOffers,
                          style:
                              textStyle(color: AppColors.ffE0BC66BorderColor),
                        ),
                      )),
                ],
              )
            : state is OffersStateStart
                ? const LoadingWidget()
                : Center(
                    child: Text(
                      'There are some errors , Please try again later',
                      style: textStyle(size: 20, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  );
      },
    );
  }
}
