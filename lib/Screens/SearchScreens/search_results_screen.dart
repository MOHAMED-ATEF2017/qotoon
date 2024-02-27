import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qotoon/Models/search_model.dart';
import 'package:qotoon/Screens/SearchScreens/result_details_screen.dart';
import 'package:qotoon/Shared/Components/text_style.dart';
import 'package:qotoon/Shared/Constants/app_colors.dart';

import '../../gen/assets.gen.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen(
      {super.key,
      required this.data,
      required this.inDate,
      required this.outDate});
  final String data, inDate, outDate;

  static const String searchResultsScreenRoute = '/SearchResultsScreen';

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  late SearchModel searchModel;
  @override
  void initState() {
    super.initState();
    Map<String, dynamic> decodedJson = jsonDecode(widget.data);
    searchModel = SearchModel.fromJson(decodedJson);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Assets.images.logo.image(width: 68.w, height: 42.h),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          searchModel.data.isEmpty
              ? Center(
                  child: Text(
                    'There is No Data for your search',
                    style: textStyle(),
                  ),
                )
              : Expanded(
                  child: ListView.separated(
                    itemCount: searchModel.data.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },
                    itemBuilder: (BuildContext context, int index) {
                      SearchDatum searchData = searchModel.data[index];
                      return InkWell(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ResultDetailsScreen(
                                      searchModel: searchData,
                                      checkInDate: widget.inDate,
                                      checkOutDate: widget.outDate,
                                    ))),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 152.w,
                                    height: 103.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            searchData.images.first.image,
                                          ),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  7.horizontalSpace,
                                  SizedBox(
                                    width: 168.w,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(
                                              width: 95.w,
                                              child: Text(
                                                searchData.name,
                                                style: textStyle(
                                                    weight: FontWeight.w700,
                                                    size: 10,
                                                    color: Colors.black),
                                              ),
                                            ),
                                            const Spacer(),
                                            Text(
                                              "${searchData.diningSession} ⭐",
                                              style: textStyle(size: 8.8),
                                            )
                                          ],
                                        ),
                                        16.verticalSpace,
                                        Row(
                                          children: [
                                            Assets.icons.person.svg(
                                                height: 14.h,
                                                color: AppColors
                                                    .ffE0BC66BorderColor),
                                            8.horizontalSpace,
                                            Text(
                                              searchData.rooms.first.adult,
                                              style: textStyle(
                                                  size: 12,
                                                  color: Colors.black),
                                            ),
                                            const Spacer(),
                                            Assets.icons.livivngroom.svg(
                                              height: 14.h,
                                            ),
                                            8.horizontalSpace,
                                            Text(
                                              searchData.lounges,
                                              style: textStyle(
                                                  size: 12,
                                                  color: Colors.black),
                                            ),
                                            const Spacer(),
                                            Assets.icons.bathroom.svg(
                                              height: 14.h,
                                            ),
                                            8.horizontalSpace,
                                            Text(
                                              searchData.bathrooms,
                                              style: textStyle(
                                                  size: 12,
                                                  color: Colors.black),
                                            ),
                                            const Spacer(),
                                            Assets.icons.bed.svg(
                                              height: 14.h,
                                            ),
                                            8.horizontalSpace,
                                            Text(
                                              searchData.rooms.first.beds,
                                              style: textStyle(
                                                  size: 12,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        13.verticalSpace,
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_on_outlined,
                                              color:
                                                  AppColors.ffE0BC66BorderColor,
                                              size: 20.r,
                                            ),
                                            Text(
                                              searchData.areaId,
                                              style: textStyle(
                                                  size: 10,
                                                  color: Colors.black),
                                            ),
                                            const Spacer(),
                                            Text(
                                              'الاطلالة :${searchData.view}',
                                              style: textStyle(
                                                  size: 10,
                                                  color: Colors.black),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'السعر / 7ليالي',
                                    style: textStyle(
                                      size: 10,
                                      color: Colors.black,
                                    ),
                                  ),
                                  5.horizontalSpace,
                                  Text(
                                    "${searchData.price} ر.س",
                                    style: textStyle(size: 10),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'ضريبة القيمة المضافة',
                                    style: textStyle(
                                      size: 8,
                                    ),
                                  ),
                                  5.horizontalSpace,
                                  Text(
                                    searchData.tax,
                                    style: textStyle(size: 8),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
