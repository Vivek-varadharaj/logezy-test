import 'package:flutter/material.dart';
import 'package:logezy/common/widgets/custom_appbar.dart';
import 'package:logezy/common/widgets/custom_text_field.dart';
import 'package:logezy/features/city_weather/screens/city_details_screen.dart';
import 'package:logezy/features/search/controllers/search_controller.dart';
import 'package:logezy/features/search/screens/recent_search_screen.dart';
import 'package:logezy/utils/app_colors.dart';
import 'package:logezy/utils/app_text_styles.dart';
import 'package:logezy/utils/app_texts.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const RecentSearchScreen(),
          ));
        },
        child: const Icon(Icons.history),
      ),
      backgroundColor: AppColors.neutral0,
      appBar: const CustomAppBar(
        height: 60,
        heading: (AppTexts.searchCity),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              color: AppColors.neutral0,
              height: 20,
            ),
            Container(
              width: double.infinity,
              color: AppColors.neutral0,
              child: CustomTextField(
                hintText: AppTexts.searchCity,
                onChanged: (value) {
                  if (value != null && value.trim().isNotEmpty) {
                    Provider.of<SearchCityController>(context, listen: false)
                        .search(searchCity: value ?? "");
                  }
                },
              ),
            ),
            Expanded(
                child: Consumer<SearchCityController>(
              builder: (context, value, child) => value.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : value.cities.isEmpty
                      ? const Center(
                          child: Text(AppTexts.pleaseSearch),
                        )
                      : ListView.separated(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 8,
                          ),
                          itemCount: value.cities.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              tileColor: AppColors.primary100.withAlpha(50),
                              title: Text(
                                value.cities[index].name ?? "",
                                style: AppTextStyles.para2
                                    .copyWith(color: AppColors.primary300),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CityDetailsScreen(
                                      city: Provider.of<SearchCityController>(
                                              context,
                                              listen: false)
                                          .cities[index],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
            )),
          ],
        ),
      ),
    );
  }
}
