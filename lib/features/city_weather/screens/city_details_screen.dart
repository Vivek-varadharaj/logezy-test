import 'package:flutter/material.dart';
import 'package:logezy/common/widgets/custom_appbar.dart';
import 'package:logezy/features/city_weather/controllers/city_weather_controller.dart';
import 'package:logezy/features/search/domain/models/city_model.dart';
import 'package:logezy/utils/app_colors.dart';
import 'package:logezy/utils/app_text_styles.dart';
import 'package:logezy/utils/app_texts.dart';
import 'package:provider/provider.dart';

class CityDetailsScreen extends StatefulWidget {
  final City city;
  const CityDetailsScreen({super.key, required this.city});

  @override
  State<CityDetailsScreen> createState() => _CityDetailsScreenState();
}

class _CityDetailsScreenState extends State<CityDetailsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CityWeatherController>(context, listen: false)
          .getCityDetails(searchCity: widget.city);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CityWeatherController>(builder: (context, provider, child) {
      return Scaffold(
        appBar: CustomAppBar(
          height: 60,
          heading: (widget.city.name ?? ""),
        ),
        backgroundColor: AppColors.neutral0,
        body: provider.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    AppTexts.temperature,
                                    style: AppTextStyles.heeboHeading
                                        .copyWith(color: AppColors.alertGold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.thermostat,
                                          color: AppColors.alertGold),
                                      Text(provider.currentWeatherResponse
                                              ?.currentWeather.temperature
                                              .toString() ??
                                          "No data available"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Wind Speed",
                                    style: AppTextStyles.heeboHeading
                                        .copyWith(color: AppColors.alertGold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.air,
                                          color: AppColors.alertGold),
                                      Text(provider.currentWeatherResponse
                                              ?.currentWeather.windspeed
                                              .toString() ??
                                          "No data available"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Wind Direction",
                                    style: AppTextStyles.heeboHeading
                                        .copyWith(color: AppColors.alertGold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.compass_calibration,
                                          color: AppColors.alertGold),
                                      Text(provider.currentWeatherResponse
                                              ?.currentWeather.winddirection
                                              .toString() ??
                                          "No data available"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Time Zone",
                                    style: AppTextStyles.heeboHeading
                                        .copyWith(color: AppColors.alertGold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(provider
                                              .currentWeatherResponse?.timezone
                                              .toString() ??
                                          "No data available"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      );
    });
  }
}
