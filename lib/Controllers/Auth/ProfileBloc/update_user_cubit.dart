import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'update_user_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileState());
  XFile? profileImage;
  final ImagePicker imagePicker = ImagePicker();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> changeProfileImage() async {
    profileImage = await imagePicker.pickImage(source: ImageSource.gallery);
    emit(UpdateProfileState());
  }
}
