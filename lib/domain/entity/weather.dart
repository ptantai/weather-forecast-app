class Weather {
  final Location? location;
  final Current? current;

  Weather({
    this.location,
    this.current,
  });
}

class Current {
  final int? lastUpdatedEpoch;
  final String? lastUpdated;
  final int? tempC;
  final double? tempF;
  final int? isDay;
  final Condition? condition;

  Current({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
  });
}

class Condition {
  final String? text;
  final String? icon;
  final int? code;

  Condition({
    this.text,
    this.icon,
    this.code,
  });
}

class Location {
  final String? name;
  final String? region;
  final String? country;
  final double? lat;
  final double? lon;
  final String? tzId;

  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
  });
}
