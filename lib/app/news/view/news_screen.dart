import 'package:flutter/material.dart';
import 'package:ajev_application/core/base/base_screen.dart';
import '../../../core/widgets/template_screen.dart';
import '../view_model/news_view.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      onInit: (viewmodel) {},
      viewmodel: NewsView(context: context),
      builder: (context, viewmodel, child, deviceScreen) {
        return BuildTemplateMain(
          showBackButton: false,
          titleText: 'ข่าวสาร',
          nameWidgetAppBar: 'ข่าวสาร',
          paddingScreen: EdgeInsets.zero,
          showAppbar: true,
          child: _buildNewsList(viewmodel),
        );
      },
    );
  }

  Widget _buildNewsList(NewsView viewmodel) {
    return ListView.builder(
      padding: const EdgeInsets.all(20.0),
      itemCount: viewmodel.newsList.length,
      itemBuilder: (context, index) {
        final news = viewmodel.newsList[index];
        return _buildNewsItem(news);
      },
    );
  }

  Widget _buildNewsItem(NewsModel news) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          news.title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(news.imagePath, fit: BoxFit.cover),
        ),
        const SizedBox(height: 10),
        Text(
          news.description,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
        const Divider(height: 40),
      ],
    );
  }
}
