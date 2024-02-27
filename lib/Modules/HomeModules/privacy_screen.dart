import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';

import '../../Controllers/Privacy/bloc/privacy_bloc.dart';
import '../../Controllers/Privacy/bloc/privacy_event.dart';
import '../../Controllers/Privacy/bloc/privacy_state.dart';
import '../../Shared/Components/custom_app_bar.dart';
import '../../Shared/Components/error_text.dart';
import '../../Shared/Components/loading_widget.dart';
import '../../Shared/Components/text_style.dart';
import '../../Shared/Constants/app_strings.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});
static const String privacyScreenRoute = '/PrivacyScreen';		
  @override
  Widget build(BuildContext context) {

    final PrivacyBloc privacyBloc = KiwiContainer().resolve<PrivacyBloc>();
    privacyBloc.add(PrivacyEventStart(context: context));
    return Scaffold(
      appBar: CustomAppBar(context, 0),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.privacy,
              style: textStyle(size: 24, color: Colors.black),
            ),
            32.verticalSpace,
            BlocBuilder(
              bloc: privacyBloc,
              builder: (context, state) {
                return state is PrivacyStateStart
                    ? const Center(child: LoadingWidget())
                    : state is PrivacyStateSuccess
                        ? Text(
                            state.privacyModel.data[0].description,
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

