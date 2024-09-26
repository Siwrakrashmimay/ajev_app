// ignore_for_file: unused_field

import 'package:ajev_application/core/base/base_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../provider/user_profile_provider.dart';
import '../../../core/init/constants/image/image_constants.dart';

class NewsView extends BaseViewModel {
  final UserProfileProvider? _userProfileProvider;
  NewsView({required BuildContext context})
      : _userProfileProvider = context.read<UserProfileProvider>();

  List<NewsModel> newsList = [
    NewsModel(
      title: 'AJ พระเอกตัวจริง Rebranding ...',
      description: '“AJ” พระเอกตัวจริง พลิกโฉมครั้งใหญ่ในรอบ 23 ปี',
      imagePath: ImageConstants.instance.rectangle17,
    ),
    NewsModel(
      title: 'ความคุ้มครองตามประเภทของ ...',
      description: 'ประกันภัยมอเตอร์ไซค์ไฟฟ้า เริ่มต้นเพียง 2,707 บาท',
      imagePath: ImageConstants.instance.rectangle171,
    ),
  ];
}

class NewsModel {
  final String title;
  final String description;
  final String imagePath;

  NewsModel({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}
