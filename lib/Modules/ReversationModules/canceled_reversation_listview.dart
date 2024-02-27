import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:qotoon/Controllers/BookedStatus/bloc/booked_event.dart';
import 'package:qotoon/Controllers/BookedStatus/bloc/booked_state.dart';
import 'package:qotoon/Modules/ReversationModules/reversation_listview_widget.dart';
import 'package:qotoon/Shared/Components/loading_widget.dart';
import 'package:qotoon/Shared/Components/no_data_text.dart';

import '../../Controllers/BookedStatus/bloc/booked_bloc.dart';
import '../../Shared/Constants/app_colors.dart';

class CanceledReversationListView extends StatelessWidget {
  const CanceledReversationListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ReversationBloc bookedBloc =
        KiwiContainer().resolve<ReversationBloc>();
    bookedBloc.add(ReversationEventStart(context: context, status: 'canceled'));
    return BlocBuilder(
      bloc: bookedBloc,
      builder: (context, state) {
        return state is ReversationStateSuccess
            ? state.reversationsModel.data.isEmpty
                ? const Center(
                    child: NoDataText(),
                  )
                : ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    itemBuilder: (context, index) {
                      var data = state.reversationsModel.data[index];
                      return ReversationListViewWidget(
                        data: data,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        color: AppColors.ffE0BC66BorderColor,
                      );
                    },
                    itemCount: state.reversationsModel.data.length)
            : const LoadingWidget();
      },
    );
  }
}
