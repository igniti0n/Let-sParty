class LatLng {
  final double latitude;
  final double longitude;

  const LatLng({this.latitude, this.longitude});

  factory LatLng.fromMap(Map<String, dynamic> coordinates) {
    return new LatLng(
      latitude: coordinates['latitude'],
      longitude: coordinates['longitude'],
    );
  }

  static Map<String, dynamic> toMap(LatLng coordinates){
      return {
        'latitude' : coordinates.latitude,
        'longitude' : coordinates.longitude,
      };
  }

}
