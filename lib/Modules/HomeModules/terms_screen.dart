import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';

import '../../Controllers/Terms/bloc/terms_bloc.dart';
import '../../Controllers/Terms/bloc/terms_event.dart';
import '../../Controllers/Terms/bloc/terms_state.dart';
import '../../Shared/Components/custom_app_bar.dart';
import '../../Shared/Components/error_text.dart';
import '../../Shared/Components/loading_widget.dart';
import '../../Shared/Components/text_style.dart';
import '../../Shared/Constants/app_strings.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});
static const String termsScreenRoute = '/TermsScreen';		
  @override
  Widget build(BuildContext context) {
    final TermsBloc termsBloc = KiwiContainer().resolve<TermsBloc>();
    termsBloc.add(TermsEventStart(context: context));
    return Scaffold(
      appBar: CustomAppBar(context, 0),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.terms,
              style: textStyle(size: 24, color: Colors.black),
            ),
            32.verticalSpace,
            BlocBuilder(
              bloc: termsBloc,
              builder: (context, state) {
                return state is TermsStateStart
                    ? const Center(child: LoadingWidget())
                    : state is TermsStateSuccess
                        ? Text(
                            state.termsModel.data[0].description,
                            style: textStyle(size: 12, color: Colors.black),
                            textAlign: TextAlign.justify,
                          )
                        : const ErrorCenterText();
              },
            )
          ],
        ),
      ),
    );
  }
}

