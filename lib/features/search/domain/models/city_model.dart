class City {
  final int? id;
  final String? name;
  final double? latitude;
  final double? longitude;
  final double? elevation;
  final String? featureCode;
  final String? countryCode;
  final int? admin1Id;
  final int? admin2Id;
  final String? timezone;
  final int? population;
  final int? countryId;
  final String? country;
  final String? admin1;
  final String? admin2;

  City({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.elevation,
    this.featureCode,
    this.countryCode,
    this.admin1Id,
    this.admin2Id,
    this.timezone,
    this.population,
    this.countryId,
    this.country,
    this.admin1,
    this.admin2,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['name'],
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      elevation: (json['elevation'] as num?)?.toDouble(),
      featureCode: json['feature_code'],
      countryCode: json['country_code'],
      admin1Id: json['admin1_id'],
      admin2Id: json['admin2_id'],
      timezone: json['timezone'],
      population: json['population'],
      countryId: json['country_id'],
      country: json['country'],
      admin1: json['admin1'],
      admin2: json['admin2'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
      'elevation': elevation,
      'feature_code': featureCode,
      'country_code': countryCode,
      'admin1_id': admin1Id,
      'admin2_id': admin2Id,
      'timezone': timezone,
      'population': population,
      'country_id': countryId,
      'country': country,
      'admin1': admin1,
      'admin2': admin2,
    };
  }
}
