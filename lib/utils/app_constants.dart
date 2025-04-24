class AppConstants {
  // base url
  static const String appBaseUrl = 'https://geocoding-api.open-meteo.com';

  static const String token = 'token';

  // URLS FOR API CALLS

  static const String searchCityApi = "/v1/search";
  static const List cityJson = 
[
  { "name": "Thrissur", "country": "India", "latitude": 10.5276, "longitude": 76.2144 },
  { "name": "Kochi", "country": "India", "latitude": 9.9312, "longitude": 76.2673 },
  { "name": "Mumbai", "country": "India", "latitude": 19.0760, "longitude": 72.8777 },
  { "name": "Delhi", "country": "India", "latitude": 28.6139, "longitude": 77.2090 },
  { "name": "Chennai", "country": "India", "latitude": 13.0827, "longitude": 80.2707 },
  { "name": "Bengaluru", "country": "India", "latitude": 12.9716, "longitude": 77.5946 },
  { "name": "Hyderabad", "country": "India", "latitude": 17.3850, "longitude": 78.4867 },
  { "name": "Ahmedabad", "country": "India", "latitude": 23.0225, "longitude": 72.5714 },
  { "name": "Pune", "country": "India", "latitude": 18.5204, "longitude": 73.8567 },
  { "name": "Kolkata", "country": "India", "latitude": 22.5726, "longitude": 88.3639 },
  { "name": "Jaipur", "country": "India", "latitude": 26.9124, "longitude": 75.7873 },
  { "name": "Lucknow", "country": "India", "latitude": 26.8467, "longitude": 80.9462 },
  { "name": "Patna", "country": "India", "latitude": 25.5941, "longitude": 85.1376 },
  { "name": "Bhopal", "country": "India", "latitude": 23.2599, "longitude": 77.4126 },
  { "name": "Nagpur", "country": "India", "latitude": 21.1458, "longitude": 79.0882 },
  { "name": "Thiruvananthapuram", "country": "India", "latitude": 8.5241, "longitude": 76.9366 },
  { "name": "Kannur", "country": "India", "latitude": 11.8745, "longitude": 75.3704 },
  { "name": "Coimbatore", "country": "India", "latitude": 11.0168, "longitude": 76.9558 },
  { "name": "Madurai", "country": "India", "latitude": 9.9252, "longitude": 78.1198 },
  { "name": "Mangalore", "country": "India", "latitude": 12.9141, "longitude": 74.8560 }
]
;
}
