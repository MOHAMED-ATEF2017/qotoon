import 'package:flutter/material.dart';

import 'update_profile_collectdata.dart';

class UpdateProfileEvent {}

class UpdateProfileEventStart extends UpdateProfileEvent {
  final BuildContext context;
  final UpdateProfileCollectData collectData;
  UpdateProfileEventStart({required this.context, required this.collectData});
}
