import 'package:flutter/material.dart';
import 'package:logezy/common/widgets/custom_appbar.dart';
import 'package:logezy/features/search/controllers/search_controller.dart';
import 'package:logezy/utils/app_colors.dart';
import 'package:logezy/utils/app_texts.dart';
import 'package:provider/provider.dart';

class RecentSearchScreen extends StatefulWidget {
  const RecentSearchScreen({super.key});

  @override
  State<RecentSearchScreen> createState() => _RecentSearchScreenState();
}

class _RecentSearchScreenState extends State<RecentSearchScreen> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SearchCityController>(context, listen: false)
          .getRecentSearches();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral0,
      appBar: const CustomAppBar(heading: AppTexts.recentSearches, height: 60),
      body: Consumer<SearchCityController>(
        builder: (context, value, child) => ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
          padding: const EdgeInsets.all(20),
          itemCount: value.recentSearches.length,
          itemBuilder: (context, index) => ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            tileColor: AppColors.alertGold.withAlpha(50),
            title: Text(value.recentSearches[index]),
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
