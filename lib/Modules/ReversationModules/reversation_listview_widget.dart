import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Models/reversations_model.dart';
import '../../Shared/Components/text_style.dart';
import '../../Shared/Constants/app_colors.dart';
import '../../Shared/Constants/app_strings.dart';
import '../../gen/assets.gen.dart';
import 'current_reversation_details_row.dart';

class ReversationListViewWidget extends StatelessWidget {
  const ReversationListViewWidget({
    this.isFromFavorite = false,
    super.key,
    required this.data,
  });
  final bool isFromFavorite;
  final ReversationDatum data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Assets.images.reversation.image(width: 152.w, height: 103.h),
              7.horizontalSpace,
              Column(
                children: [
                  SizedBox(
                    width: 168.w,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            data.apartment.name,
                            style: textStyle(
                                size: 10,
                                color: Colors.black,
                                weight: FontWeight.w700),
                          ),
                        ),
                        Text(
                          '⭐️ ${data.apartment.rating}',
                          style: textStyle(
                              size: 8.8,
                              color: Colors.black,
                              weight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  16.verticalSpace,
                  SizedBox(
                      width: 168.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CurrentReversationDetailsInfoRow(
                            data: data.apartment.adults.toString(),
                            svgGenImage: Assets.icons.person,
                          ),
                          CurrentReversationDetailsInfoRow(
                            data: data.apartment.lounges.toString(),
                            svgGenImage: Assets.icons.livivngroom,
                          ),
                          CurrentReversationDetailsInfoRow(
                            data: data.apartment.bathrooms.toString(),
                            svgGenImage: Assets.icons.bathroom,
                          ),
                          CurrentReversationDetailsInfoRow(
                            data: data.apartment.beds.toString(),
                            svgGenImage: Assets.icons.bed,
                          ),
                        ],
                      )),
                  8.verticalSpace,
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: AppColors.ffE0BC66BorderColor,
                      ),
                      Text(
                        '${data.apartment.areaName}\t\t\tالاطلالة : ${data.apartment.view}',
                        style: textStyle(size: 10, color: Colors.black),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '${data.apartment.price} ر.س\t\t\t\t',
                        style: textStyle(size: 10, color: AppColors.ffB19248),
                      ),
                      Text(
                        'السعر / 7ليالي',
                        style: textStyle(size: 10, color: Colors.black),
                      ),
                    ],
                  ),
                  5.verticalSpace,
                  Text(
                    'ضريبة القيمة المضافة\t\t\t${data.apartment.tax}',
                    style: textStyle(size: 8, color: AppColors.ff796870),
                  )
                ],
              )
            ],
          ),
          8.verticalSpace,
          if (!isFromFavorite)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "${AppStrings.leavingDate} ${data.dateTo.toString().split(' ').first}",
                  style: textStyle(size: 10),
                ),
                Text(
                  "${AppStrings.arrivingDate} ${data.dateFrom.toString().split(' ').first}",
                  style: textStyle(size: 10),
                ),
              ],
            )
        ],
      ),
    );
  }
}
