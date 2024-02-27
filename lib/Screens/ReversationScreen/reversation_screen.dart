import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:qotoon/Controllers/ReversationCubit/reversation_cubit.dart';
import 'package:qotoon/Shared/Components/container_button.dart';
import 'package:qotoon/Shared/Constants/app_colors.dart';
import 'package:qotoon/Shared/Constants/app_strings.dart';

import '../../Modules/ReversationModules/canceled_reversation_listview.dart';
import '../../Modules/ReversationModules/current_reversation_listview.dart';
import '../../Modules/ReversationModules/last_reversation_listview.dart';

class ReversationScreen extends StatelessWidget {
  const ReversationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ReversationCubit reversationCubit =
        KiwiContainer().resolve<ReversationCubit>();
    return BlocBuilder(
      bloc: reversationCubit,
      builder: (context, state) {
        var tabs2 = [
          CustomContainerButton(
            height: 28.h,
            title: AppStrings.currentReservation,
            width: 97.w,
            textSize: 10,
            textColor: reversationCubit.index == 0 ? null : AppColors.ff796870,
            color: reversationCubit.index == 0 ? null : Colors.transparent,
          ),
          CustomContainerButton(
            height: 28.h,
            title: AppStrings.pastReservation,
            width: 97.w,
            textSize: 10,
            textColor: reversationCubit.index == 1 ? null : AppColors.ff796870,
            color: reversationCubit.index == 1 ? null : Colors.transparent,
          ),
          CustomContainerButton(
            height: 28.h,
            title: AppStrings.canceledReservation,
            width: 97.w,
            textSize: 10,
            textColor: reversationCubit.index == 2 ? null : AppColors.ff796870,
            color: reversationCubit.index == 2 ? null : Colors.transparent,
          ),
        ];
        return DefaultTabController(
            length: 3,
            child: Column(
              children: [
                TabBar(
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.transparent,
                  overlayColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  onTap: (value) {
                    reversationCubit.changeIndex(value);
                  },
                  tabs: tabs2,
                ),
                const Expanded(
                    child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    CurrentReversationListView(),
                    LastReversationListView(),
                    CanceledReversationListView(),
                  ],
                ))
              ],
            ));
      },
    );
  }
}
