import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:qotoon/Controllers/Search/CitiesBloc/cities_event.dart';
import 'package:qotoon/Controllers/Search/CitiesBloc/cities_state.dart';
import 'package:qotoon/Controllers/Search/Searchcubit/search_cubit.dart';
import 'package:qotoon/Shared/Constants/app_strings.dart';

import '../../Controllers/Search/CitiesBloc/cities_bloc.dart';
import '../../Shared/Components/text_style.dart';
import '../../Shared/Constants/app_colors.dart';

class HomeSearchContainer extends StatefulWidget {
  const HomeSearchContainer({
    super.key,
    required this.searchCubit, required this.formKey,
  });
  final SearchCubit searchCubit;
      final GlobalKey<FormState> formKey ;		
  @override
  State<HomeSearchContainer> createState() => _HomeSearchContainerState();
}

class _HomeSearchContainerState extends State<HomeSearchContainer> {
  final CitiesBloc citiesBloc = KiwiContainer().resolve<CitiesBloc>();
  @override
  void initState() {
    super.initState();
    citiesBloc.add(CitiesEventStart(context: context));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Center(
        child: Container(
          width: 328.w,
          height: 126.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border:
                  Border.all(color: AppColors.ffE0BC66BorderColor, width: 2)),
          child: Column(
            children: [
              8.verticalSpace,

              //***************** location row *************** */
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  8.horizontalSpace,
                  const Icon(
                    Icons.location_on_outlined,
                    color: AppColors.ffE0BC66BorderColor,
                  ),
                  8.horizontalSpace,
                  BlocBuilder(
                    bloc: citiesBloc,
                    builder: (context, state) {
                      return Expanded(
                        child: SizedBox(
                          height: 25.h,
                          child: DropdownButtonFormField<String>(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            hint: Text(state is CitiesStateStart
                                ? 'Loading .....'
                                : AppStrings.aqarLocation),
                            items: state is CitiesStateStart
                                ? []
                                : state is CitiesStateSuccess
                                    ? state.citiesModel.data
                                        .map((e) => DropdownMenuItem<String>(
                                            value: e.id.toString(),
                                            child: Text(
                                              e.name,
                                              style: textStyle(size: 10),
                                            )))
                                        .toList()
                                    : [],
                            onChanged: (value) {
                              widget.searchCubit.changeSearchLocation(value!);
                            },
                            validator: (value) {
                              return value!.isEmpty
                                  ? AppStrings.pleaseLogin
                                  : null;
                            },
                            borderRadius: BorderRadius.circular(8.r),
                            style: textStyle(size: 10),
                            decoration: InputDecoration(
                                hintStyle: textStyle(size: 10),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 8.w),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.ffE0BC66BorderColor)),
                                errorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.ffE0BC66BorderColor)),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.ffE0BC66BorderColor))),
                          ),
                        ),
                      );
                    },
                  ),
                  16.horizontalSpace
                ],
              ),
              const Divider(
                color: AppColors.ffE0BC66BorderColor,
              ),

              //****************** dates row ******************* */
              BlocBuilder(
                bloc: widget.searchCubit,
                builder: (context, state) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      8.horizontalSpace,
                      //*************** arriving ***************/
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              'تاريخ الوصول : ',
                              style: textStyle(size: 10),
                            ),
                            Expanded(
                                child: SizedBox(
                              height: 25.h,
                              child: InkWell(
                                onTap: () => showDatePicker(
                                  context: context,
                                  firstDate: DateTime.now(),
                                  lastDate:
                                      DateTime(DateTime.now().year, 12, 31),
                                ).then((value) => widget.searchCubit
                                    .changeArrivingDate(value!
                                        .toIso8601String()
                                        .split('T')
                                        .first)),
                                child: TextFormField(
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  enabled: false,
                                  validator: (value) {
                                    return value!.isEmpty
                                        ? AppStrings.pleaseLogin
                                        : null;
                                  },
                                  controller: TextEditingController(
                                      text: widget.searchCubit.arriveDate),
                                  style: textStyle(size: 10),
                                  decoration: InputDecoration(
                                      hintStyle: textStyle(size: 10),
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 8.w),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColors
                                                  .ffE0BC66BorderColor)),
                                      errorBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColors
                                                  .ffE0BC66BorderColor)),
                                      border: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColors
                                                  .ffE0BC66BorderColor))),
                                ),
                              ),
                            ))
                          ],
                        ),
                      ),
                      2.horizontalSpace,
                      Container(
                        color: AppColors.ffE0BC66BorderColor,
                        width: 2.w,
                        height: 30.h,
                      ),
                      2.horizontalSpace,
                      //***************** leaving ************* */
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              'تاريخ المغادرة : ',
                              style: textStyle(size: 10),
                            ),
                            Expanded(
                                child: SizedBox(
                              height: 25.h,
                              child: InkWell(
                                onTap: () => showDatePicker(
                                  context: context,
                                  firstDate: DateTime.now(),
                                  lastDate:
                                      DateTime(DateTime.now().year, 12, 31),
                                ).then((value) => widget.searchCubit
                                    .changeLeavingDate(value!
                                        .toIso8601String()
                                        .split('T')
                                        .first)),
                                child: TextFormField(
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    return value!.isEmpty
                                        ? AppStrings.pleaseLogin
                                        : null;
                                  },
                                  style: textStyle(size: 10),
                                  controller: TextEditingController(
                                      text: widget.searchCubit.leavingDate),
                                  decoration: InputDecoration(
                                      enabled: false,
                                      hintStyle: textStyle(size: 10),
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 8.w),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColors
                                                  .ffE0BC66BorderColor)),
                                      errorBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColors
                                                  .ffE0BC66BorderColor)),
                                      border: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColors
                                                  .ffE0BC66BorderColor))),
                                ),
                              ),
                            ))
                          ],
                        ),
                      ),
                      8.horizontalSpace
                    ],
                  );
                },
              ),
              const Divider(
                color: AppColors.ffE0BC66BorderColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  8.horizontalSpace,
                  const Icon(
                    Icons.person_outline_rounded,
                    color: AppColors.ffE0BC66BorderColor,
                  ),
                  8.horizontalSpace,
                  BlocBuilder(
                    bloc: widget.searchCubit,
                    builder: (context, state) {
                      return Text(
                        'عدد الافراد : ${widget.searchCubit.adult} بالغ ، ${widget.searchCubit.children} أطفال',
                        style: textStyle(size: 10),
                      );
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
