class DistrictsModel {
  final String divisionId;
  final String divisionName;
  final List<District> districts;

  DistrictsModel({
    required this.divisionId,
    required this.divisionName,
    required this.districts,
  });

  factory DistrictsModel.fromJson(Map<String, dynamic> json) {
    var list = json['districts'] as List;
    List<District> districtsList =
        list.map((i) => District.fromJson(i)).toList();

    return DistrictsModel(
      divisionId: json['division_id'],
      divisionName: json['division_name'],
      districts: districtsList,
    );
  }
}

class District {
  final String id;
  final String name;
  final String bnName;
  final String lat;
  final String long;

  District({
    required this.id,
    required this.name,
    required this.bnName,
    required this.lat,
    required this.long,
  });

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      id: json['id'],
      name: json['name'],
      bnName: json['bn_name'],
      lat: json['lat'],
      long: json['long'],
    );
  }
}
