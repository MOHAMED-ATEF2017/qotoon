import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:qotoon/Controllers/MyApartmentsController/ApartmentBloc/apartment_bloc.dart';
import 'package:qotoon/Controllers/MyApartmentsController/ApartmentBloc/apartment_event.dart';
import 'package:qotoon/Controllers/MyApartmentsController/ApartmentCubit/apartment_cubit.dart';
import 'package:qotoon/Modules/ReversationModules/current_reversation_listview.dart';
import 'package:qotoon/Shared/Components/container_button.dart';
import 'package:qotoon/Shared/Components/custom_app_bar.dart';
import 'package:qotoon/Shared/Constants/app_strings.dart';

import '../../Controllers/MyApartmentsController/ApartmentBloc/apartment_state.dart';
import '../../Shared/Components/error_text.dart';
import '../../Shared/Components/loading_widget.dart';
import '../../Shared/Components/no_data_text.dart';
import '../../Shared/Constants/app_colors.dart';

class MyApartmentsScreen extends StatelessWidget {
  const MyApartmentsScreen({super.key});

  static const String myApartmentScreenRoute = "/myApartmentScreenRoute";

  @override
  Widget build(BuildContext context) {
    final ApartmentCubit apartmentCubit =
        KiwiContainer().resolve<ApartmentCubit>();
    final ApartmentBloc apartmentBloc =
        KiwiContainer().resolve<ApartmentBloc>();
    apartmentBloc.add(ApartmentBlocMyEventStart(context: context));
    return Scaffold(
      appBar: CustomAppBar(context, 4),
      body: BlocBuilder(
        bloc: apartmentCubit,
        builder: (context, state) {
          return DefaultTabController(
              // initialIndex: apartmentCubit.selectedIndex,
              length: 2,
              child: Column(
                children: [
                  16.verticalSpace,
                  TabBar(
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent),
                      physics: const NeverScrollableScrollPhysics(),
                      dividerColor: Colors.transparent,
                      indicatorColor: Colors.transparent,
                      tabs: [
                        CustomContainerButton(
                            textColor: apartmentCubit.selectedIndex == 0
                                ? AppColors.mainColorFF8D8083
                                : null,
                            height: 35.h,
                            onPressed: () {
                              apartmentCubit.changeSelectedIndex(0);
                              apartmentBloc.add(
                                  ApartmentBlocMyEventStart(context: context));
                            },
                            color: apartmentCubit.selectedIndex == 0
                                ? Colors.white
                                : null,
                            title: AppStrings.myApart),
                        CustomContainerButton(
                            textColor: apartmentCubit.selectedIndex == 1
                                ? AppColors.mainColorFF8D8083
                                : null,
                            onPressed: () {
                              apartmentCubit.changeSelectedIndex(1);
                              apartmentBloc.add(ApartmentBlocSoldEventStart(
                                  context: context));
                            },
                            height: 35.h,
                            color: apartmentCubit.selectedIndex == 1
                                ? Colors.white
                                : null,
                            title: AppStrings.soldApart),
                      ]),
                  Expanded(
                      child: TabBarView(
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                        NN(apartmentBloc: apartmentBloc),
                        NN(
                          apartmentBloc: apartmentBloc,
                        ),
                      ]))
                ],
              ));
        },
      ),
    );
  }
}

class NN extends StatelessWidget {
  const NN({super.key, required this.apartmentBloc});
  final ApartmentBloc apartmentBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: apartmentBloc,
      builder: (context, state) {
        return (state is ApartmentBlocMyStateSuccess)
            ? state.response.data['data'] == null
                ? const NoDataText()
                : ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    itemBuilder: (context, index) {
                      state.response.data['data'][index];
                      return CurrentReversationListView();
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        color: AppColors.ffE0BC66BorderColor,
                      );
                    },
                    itemCount: state.response.data.length)
            : state is ApartmentBlocMyStateStart ||
                    state is ApartmentBlocSoldStateStart
                ? const LoadingWidget()
                : const ErrorCenterText();
      },
    );
  }
}
