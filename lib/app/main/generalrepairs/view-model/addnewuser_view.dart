// ignore_for_file: unused_field

import 'package:ajev_application/core/base/base_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../provider/user_profile_provider.dart';

class AddNewUserView extends BaseViewModel {
  final UserProfileProvider? _userProfileProvider;
  AddNewUserView({required BuildContext context})
      : _userProfileProvider = context.read<UserProfileProvider>();
}
