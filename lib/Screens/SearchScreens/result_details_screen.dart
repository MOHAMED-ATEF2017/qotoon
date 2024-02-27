import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:qotoon/Controllers/PayBloc/pay_collect_data.dart';
import 'package:qotoon/Controllers/PayBloc/pay_event.dart';
import 'package:qotoon/Controllers/PayBloc/pay_state.dart';
import 'package:qotoon/Models/search_model.dart';
import 'package:qotoon/Shared/Components/container_button.dart';
import 'package:qotoon/Shared/Components/loading_widget.dart';
import 'package:qotoon/Shared/Components/text_style.dart';
import 'package:qotoon/Shared/Constants/app_colors.dart';
import 'package:qotoon/Shared/Constants/app_strings.dart';

import '../../Controllers/PayBloc/pay_bloc.dart';
import '../../gen/assets.gen.dart';

class ResultDetailsScreen extends StatelessWidget {
  const ResultDetailsScreen(
      {super.key,
      required this.searchModel,
      required this.checkInDate,
      required this.checkOutDate});
  static const String resultDetailsScreenRoute = '/ResultDetailsScreen';
  final String checkInDate, checkOutDate;
  final SearchDatum searchModel;

  @override
  Widget build(BuildContext context) {
    PayCollectData collectData = PayCollectData();
    final PayBloc payBloc = KiwiContainer().resolve<PayBloc>();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 23.w),
        child: Column(
          children: [
            AppBar(
              title: Assets.images.logo.image(width: 68.w, height: 42.h),
            ),
            10.verticalSpace,
            SizedBox(
              height: 156.h,
              width: 329.w,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    searchModel.images.isEmpty
                        ? "https://www.ncenet.com/wp-content/uploads/2020/04/No-image-found.jpg"
                        : searchModel.images[index].image,
                    fit: BoxFit.fill,
                  );
                },
                itemCount:
                    searchModel.images.isEmpty ? 1 : searchModel.images.length,
                pagination: const SwiperPagination(
                  builder: SwiperPagination.dots,
                ),
                autoplay: true,
                control: const SwiperControl(
                  disableColor: AppColors.mainColorFF8D8083,
                ),
              ),
            ),
            8.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  searchModel.name,
                  style: textStyle(
                      size: 20, weight: FontWeight.w700, color: Colors.black),
                ),
                CustomContainerButton(
                  title: searchModel.name,
                  width: 77.w,
                  height: 20.h,
                  radius: 10,
                  textSize: 12,
                )
              ],
            ),
            16.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: AppColors.ffE0BC66BorderColor,
                    ),
                    8.horizontalSpace,
                    Text(
                      searchModel.areaName,
                      style: textStyle(size: 12, color: Colors.black),
                    )
                  ],
                ),
                Text(
                  "${searchModel.diningSession} ⭐",
                  style: textStyle(size: 12, color: Colors.black),
                ),
                Text(
                  'الاطلالة ${searchModel.view}',
                  style: textStyle(
                    size: 12,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            12.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Assets.icons.person.svg(
                        width: 12.w,
                        height: 14.h,
                        color: AppColors.ffE0BC66BorderColor),
                    8.horizontalSpace,
                    Text(
                      searchModel.rooms.first.adult,
                      style: textStyle(
                        size: 12,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                //************* calender ****************** */
                Row(
                  children: [
                    Assets.icons.calendersvg.svg(
                      width: 12.w,
                      height: 14.h,
                    ),
                    8.horizontalSpace,
                    Text(
                      searchModel.rooms.first.adult,
                      style: textStyle(
                        size: 12,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                //***************** beds************ */
                Row(
                  children: [
                    Assets.icons.bed.svg(
                      width: 12.w,
                      height: 14.h,
                    ),
                    8.horizontalSpace,
                    Text(
                      searchModel.rooms.first.beds,
                      style: textStyle(
                        size: 12,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                //************* living ******** */
                Row(
                  children: [
                    Assets.icons.livivngroom.svg(
                      width: 12.w,
                      height: 14.h,
                    ),
                    8.horizontalSpace,
                    Text(
                      searchModel.lounges,
                      style: textStyle(
                        size: 12,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                //************* bathroom *********** */
                Row(
                  children: [
                    Assets.icons.bathroom.svg(
                      width: 12.w,
                      height: 14.h,
                    ),
                    8.horizontalSpace,
                    Text(
                      searchModel.bathrooms,
                      style: textStyle(
                        size: 12,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            8.verticalSpace,
            Row(
              children: [
                Text(
                  'السعر / 7ليالي',
                  style: textStyle(size: 12, color: Colors.black),
                ),
                8.horizontalSpace,
                Text(
                  "${searchModel.price} ر.س",
                  style:
                      textStyle(color: AppColors.ffE0BC66BorderColor, size: 12),
                )
              ],
            ),
            4.verticalSpace,
            Row(
              children: [
                Text(
                  'ضريبة القيمة المضافة',
                  style: textStyle(size: 8),
                ),
                13.horizontalSpace,
                Text(
                  searchModel.tax,
                  style: textStyle(size: 8),
                )
              ],
            ),
            4.verticalSpace,
            Row(
              children: [
                Text(
                  'الاجمالي :',
                  style: textStyle(
                    size: 18,
                    weight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                Text(
                  " ${searchModel.totalPrice} ر.س",
                  style: textStyle(
                    size: 18,
                    weight: FontWeight.w700,
                    color: AppColors.ffB19248,
                  ),
                ),
                const Spacer(),
                BlocBuilder(
                  bloc: payBloc,
                  builder: (context, state) {
                    return state is PayStateStart
                        ?  LoadingWidget(
                          width: 111.w,height: 28.h,

                        )
                        : CustomContainerButton(
                            title: AppStrings.payNow,
                            width: 111.w,
                            height: 28.h,
                            textSize: 12,
                            onPressed: () {
                              collectData.apartmentId =
                                  searchModel.id.toString();
                              collectData.checkInDate = checkInDate;
                              collectData.checkOutDate = checkOutDate;
                              payBloc.add(PayEventStart(
                                  collectData: collectData, context: context));
                            },
                          );
                  },
                )
              ],
            ),
            12.verticalSpace,
            Assets.images.map
                .image(width: 1.sw, height: 71.h, fit: BoxFit.fill),
            8.verticalSpace,
            Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: AppColors.ffE0BC66BorderColor,
                ),
                8.horizontalSpace,
                Text(
                  searchModel.area.name,
                  style: textStyle(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
