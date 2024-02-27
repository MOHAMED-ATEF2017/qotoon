import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:qotoon/Controllers/Search/SearchBloc/search_collect_data.dart';
import 'package:qotoon/Controllers/Search/SearchBloc/search_event.dart';
import 'package:qotoon/Controllers/Search/SearchBloc/search_state.dart';
import 'package:qotoon/Controllers/Search/Searchcubit/search_cubit.dart';
import 'package:qotoon/Modules/HomeModules/home_search_container.dart';
import 'package:qotoon/Shared/Components/container_button.dart';
import 'package:qotoon/Shared/Components/custom_app_bar.dart';
import 'package:qotoon/Shared/Components/loading_widget.dart';
import 'package:qotoon/Shared/Components/text_style.dart';
import 'package:qotoon/Shared/Components/toast.dart';
import 'package:qotoon/Shared/Constants/app_colors.dart';
import 'package:qotoon/Shared/Constants/app_strings.dart';

import '../../Controllers/Search/SearchBloc/search_bloc.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  static const String searchScreenRoute = '/SearchScreen';
  final SearchCubit searchCubit = KiwiContainer().resolve<SearchCubit>();
  final SearchBloc searchBloc = KiwiContainer().resolve<SearchBloc>();

  @override
  Widget build(BuildContext context) {
    SearchCollectData collectData = SearchCollectData();
    return BlocBuilder(
      bloc: searchCubit,
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              CustomAppBar(context, 0),
              HomeSearchContainer(
                  searchCubit: searchCubit, formKey: searchCubit.formKey),
              /*        10.verticalSpace,
              Container(
                width: 1.sw,
                height: 375.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.r),
                        topRight: Radius.circular(30.r)),
                    border: Border.all(color: AppColors.ffE0BC66BorderColor)),
                child: CalendarDatePicker(
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(DateTime.now().year, 12, 31),
                  onDateChanged: (value) {},
                ),
              ),
           */
              50.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    Text(
                      AppStrings.adultNo,
                      style: textStyle(size: 16, weight: FontWeight.w700),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () => searchCubit.addAdultNo(),
                      child: Container(
                        width: 17.w,
                        height: 17.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            border: Border.all(
                                color: AppColors.ffE0BC66BorderColor)),
                        child: Icon(
                          Icons.add,
                          size: 10.r,
                        ),
                      ),
                    ),
                    16.horizontalSpace,
                    Text(
                      searchCubit.adult.toString(),
                      style: textStyle(size: 16, weight: FontWeight.w700),
                    ),
                    16.horizontalSpace,
                    InkWell(
                      onTap: () => searchCubit.minusAdultNo(),
                      child: Container(
                        width: 17.w,
                        height: 17.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            border: Border.all(
                                color: AppColors.ffE0BC66BorderColor)),
                        child: Icon(
                          Icons.remove,
                          size: 10.r,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              20.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    Text(
                      AppStrings.childrenNo,
                      style: textStyle(size: 16, weight: FontWeight.w700),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () => searchCubit.addChildrenNo(),
                      child: Container(
                        width: 17.w,
                        height: 17.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            border: Border.all(
                                color: AppColors.ffE0BC66BorderColor)),
                        child: Icon(
                          Icons.add,
                          size: 10.r,
                        ),
                      ),
                    ),
                    16.horizontalSpace,
                    Text(
                      searchCubit.children.toString(),
                      style: textStyle(size: 16, weight: FontWeight.w700),
                    ),
                    16.horizontalSpace,
                    InkWell(
                      onTap: () => searchCubit.minusChildrenNo(),
                      child: Container(
                        width: 17.w,
                        height: 17.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            border: Border.all(
                                color: AppColors.ffE0BC66BorderColor)),
                        child: Icon(
                          Icons.remove,
                          size: 10.r,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              BlocBuilder(
                bloc: searchBloc,
                builder: (context, state) {
                  return state is SearchStateStart
                      ? const LoadingWidget()
                      : CustomContainerButton(
                          title: AppStrings.confirm,
                          width: 230.w,
                          onPressed: () {
                            if (searchCubit.searchLocation == '' ||
                                searchCubit.arriveDate == '' ||
                                searchCubit.leavingDate == '') {
                              customToast(AppStrings.pleaseFillData, context);
                            } else {
                              collectData.adults = searchCubit.adult.toString();
                              collectData.childs =
                                  searchCubit.children.toString();
                              collectData.checkInData =
                                  searchCubit.arriveDate.toString();
                              collectData.checkOutData =
                                  searchCubit.leavingDate.toString();
                              collectData.cityId =
                                  searchCubit.searchLocation.toString();
                              searchBloc.add(SearchEventStart(
                                  collectData: collectData, context: context));
                            }
                          },
                        );
                },
              ),
              50.verticalSpace
            ],
          ),
        );
      },
    );
  }
}
