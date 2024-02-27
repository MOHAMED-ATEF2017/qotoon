import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:qotoon/Controllers/BookedStatus/bloc/booked_event.dart';
import 'package:qotoon/Controllers/BookedStatus/bloc/booked_state.dart';
import 'package:qotoon/Shared/Components/error_text.dart';
import 'package:qotoon/Shared/Components/loading_widget.dart';
import 'package:qotoon/Shared/Components/no_data_text.dart';

import '../../Controllers/BookedStatus/bloc/booked_bloc.dart';
import '../../Models/reversations_model.dart';
import '../../Shared/Constants/app_colors.dart';
import 'reversation_listview_widget.dart';

class CurrentReversationListView extends StatelessWidget {
  const CurrentReversationListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ReversationBloc reversationBloc =
        KiwiContainer().resolve<ReversationBloc>();
    reversationBloc
        .add(ReversationEventStart(context: context, status: 'recent'));
    return BlocBuilder(
      bloc: reversationBloc,
      builder: (context, state) {
        return state is ReversationStateSuccess
            ? state.reversationsModel.data.isEmpty
                ? const NoDataText()
                : ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    itemBuilder: (context, index) {
                      ReversationDatum data =
                          state.reversationsModel.data[index];
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
            : state is ReversationStateStart
                ? const LoadingWidget()
                : const ErrorCenterText();
      },
    );
  }
}
