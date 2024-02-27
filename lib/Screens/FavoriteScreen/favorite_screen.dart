import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:qotoon/Controllers/FavoriteController/FavoriteBloc/favorite_event.dart';
import 'package:qotoon/Controllers/FavoriteController/FavoriteBloc/favorite_state.dart';
import 'package:qotoon/Models/reversations_model.dart';
import 'package:qotoon/Shared/Components/error_text.dart';
import 'package:qotoon/Shared/Components/loading_widget.dart';
import 'package:qotoon/Shared/Constants/app_colors.dart';
import 'package:qotoon/Shared/logger.dart';

import '../../Controllers/FavoriteController/FavoriteBloc/favorite_bloc.dart';
import '../../Modules/ReversationModules/reversation_listview_widget.dart';
import '../../Shared/Components/no_data_text.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoriteBloc favoriteBloc = KiwiContainer().resolve<FavoriteBloc>();

    favoriteBloc.add(FavoriteEventStart(context: context));
    return BlocBuilder(
      bloc: favoriteBloc,
      builder: (context, state) {
        return state is FavoriteStateStart
            ? const Center(child: LoadingWidget())
            : state is FavoriteStateSuccess
                ? state.data.isEmpty
                    ? const NoDataText()
                    : ListView.separated(
                        itemCount: state.data.length,
                        separatorBuilder: (context, index) => const Divider(
                          color: AppColors.ffE0BC66BorderColor,
                        ),
                        itemBuilder: (context, index) {
                          logger.e(state.data);
                          return ReversationListViewWidget(
                            isFromFavorite: true,
                            data: ReversationDatum.fromJson({}),
                          );
                        },
                      )
                : const ErrorCenterText();
      },
    );
  }
}
