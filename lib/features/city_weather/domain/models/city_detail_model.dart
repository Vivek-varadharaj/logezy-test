class CurrentWeatherResponse {
  final double latitude;
  final double longitude;
  final double generationTimeMs;
  final int utcOffsetSeconds;
  final String timezone;
  final String timezoneAbbreviation;
  final double elevation;
  final CurrentWeatherUnits currentWeatherUnits;
  final CurrentWeather currentWeather;

  CurrentWeatherResponse({
    required this.latitude,
    required this.longitude,
    required this.generationTimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.currentWeatherUnits,
    required this.currentWeather,
  });

  factory CurrentWeatherResponse.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherResponse(
      latitude: json['latitude'].toDouble(),
      longitude: json['longitude'].toDouble(),
      generationTimeMs: json['generationtime_ms'].toDouble(),
      utcOffsetSeconds: json['utc_offset_seconds'],
      timezone: json['timezone'],
      timezoneAbbreviation: json['timezone_abbreviation'],
      elevation: json['elevation'].toDouble(),
      currentWeatherUnits: CurrentWeatherUnits.fromJson(json['current_weather_units']),
      currentWeather: CurrentWeather.fromJson(json['current_weather']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'generationtime_ms': generationTimeMs,
      'utc_offset_seconds': utcOffsetSeconds,
      'timezone': timezone,
      'timezone_abbreviation': timezoneAbbreviation,
      'elevation': elevation,
      'current_weather_units': currentWeatherUnits.toJson(),
      'current_weather': currentWeather.toJson(),
    };
  }
}

class CurrentWeatherUnits {
  final String time;
  final String interval;
  final String temperature;
  final String windspeed;
  final String winddirection;
  final String isDay;
  final String weathercode;

  CurrentWeatherUnits({
    required this.time,
    required this.interval,
    required this.temperature,
    required this.windspeed,
    required this.winddirection,
    required this.isDay,
    required this.weathercode,
  });

  factory CurrentWeatherUnits.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherUnits(
      time: json['time'],
      interval: json['interval'],
      temperature: json['temperature'],
      windspeed: json['windspeed'],
      winddirection: json['winddirection'],
      isDay: json['is_day'],
      weathercode: json['weathercode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'interval': interval,
      'temperature': temperature,
      'windspeed': windspeed,
      'winddirection': winddirection,
      'is_day': isDay,
      'weathercode': weathercode,
    };
  }
}

class CurrentWeather {
  final String time;
  final int interval;
  final double temperature;
  final double windspeed;
  final int winddirection;
  final int isDay;
  final int weathercode;

  CurrentWeather({
    required this.time,
    required this.interval,
    required this.temperature,
    required this.windspeed,
    required this.winddirection,
    required this.isDay,
    required this.weathercode,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      time: json['time'],
      interval: json['interval'],
      temperature: json['temperature'].toDouble(),
      windspeed: json['windspeed'].toDouble(),
      winddirection: json['winddirection'],
      isDay: json['is_day'],
      weathercode: json['weathercode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'interval': interval,
      'temperature': temperature,
      'windspeed': windspeed,
      'winddirection': winddirection,
      'is_day': isDay,
      'weathercode': weathercode,
    };
  }
}
