class SolarSystemModel {
  String? id;
  String? name;
  String? resume;
  String? introduction;
  String? image;
  List<String>? searchTags;
  Features? features;
  String? geography;

  SolarSystemModel(
      {this.id,
      this.name,
      this.resume,
      this.introduction,
      this.image,
      this.searchTags,
      this.features,
      this.geography});

  SolarSystemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    resume = json['resume'];
    introduction = json['introduction'];
    image = json['image'];
    searchTags = json['searchTags'].cast<String>();
    features =
        json['features'] != null ? Features.fromJson(json['features']) : null;
    geography = json['geography'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['resume'] = resume;
    data['introduction'] = introduction;
    data['image'] = image;
    data['searchTags'] = searchTags;
    if (features != null) {
      data['features'] = features!.toJson();
    }
    data['geography'] = geography;
    return data;
  }
}

class Features {
  List<String>? orbitalPeriod;
  String? orbitalSpeed;
  String? rotationDuration;
  String? radius;
  String? diameter;
  String? sunDistance;
  Satellites? satellites;
  String? temperature;

  Features(
      {this.orbitalPeriod,
      this.orbitalSpeed,
      this.rotationDuration,
      this.radius,
      this.diameter,
      this.sunDistance,
      this.satellites,
      this.temperature});

  Features.fromJson(Map<String, dynamic> json) {
    orbitalPeriod = json['orbitalPeriod'].cast<String>();
    orbitalSpeed = json['orbitalSpeed'];
    rotationDuration = json['rotationDuration'];
    radius = json['radius'];
    diameter = json['Diameter'];
    sunDistance = json['sunDistance'];
    satellites = json['satellites'] != null
        ? Satellites.fromJson(json['satellites'])
        : null;
    temperature = json['temperature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orbitalPeriod'] = orbitalPeriod;
    data['orbitalSpeed'] = orbitalSpeed;
    data['rotationDuration'] = rotationDuration;
    data['radius'] = radius;
    data['Diameter'] = diameter;
    data['sunDistance'] = sunDistance;
    if (satellites != null) {
      data['satellites'] = satellites!.toJson();
    }
    data['temperature'] = temperature;
    return data;
  }
}

class Satellites {
  int? number;
  List<String>? names;

  Satellites({this.number, this.names});

  Satellites.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    names = json['names'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['names'] = names;
    return data;
  }
}
