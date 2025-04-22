class JobData {
  JobData({
    required this.postUid,
    required this.companyName,
    required this.clothing,
    required this.instruction,
    required this.imageURL,
    required this.many,
    required this.location,
    required this.allowedDomains,
    required this.station,
  });
  String postUid;
  String companyName;
  String imageURL;
  String instruction;

  String clothing;
  String many;
  String location;
  List<String> allowedDomains;
  List<DetailModel> station = [];

  factory JobData.fromMap(Map<String, dynamic> data) {
    return JobData(
      postUid: data['PostUid'] ?? '',
      companyName: data['companyName'] ?? '',
      clothing: data['topClothing'] ?? '',
      instruction: data['instruction'] ?? '',
      imageURL: data['imageURL'] ?? '',
      many: data['many'] ?? '',
      location: data['location'] ?? '',
      allowedDomains: List<String>.from(data["allowedDomains"]),
      station: (data['station'] as List<dynamic>?)
              ?.map((detail) => DetailModel(
                  sLocation: detail['sLocation'] as String,
                  schoolBuilding: detail['schoolBuilding'] as String,
                  station: detail['station'] as String,
                  manyDetail: detail['manyDetail'] ?? "",
                  training: detail['training'] ?? ""))
              .toList() ??
          [],
    );
  }
}

class DetailModel {
  String schoolBuilding, sLocation, station, manyDetail, training;

  DetailModel({
    required this.schoolBuilding,
    required this.sLocation,
    required this.station,
    required this.manyDetail,
    required this.training,
  });

  Map<String, dynamic> toMap() {
    return {
      'schoolBuilding': schoolBuilding,
      'sLocation': sLocation,
      'station': station,
      'manyDetail': manyDetail,
      'training': training,
    };
  }
}

class WorksCardModel {
  final String text;
  final String icon;

  WorksCardModel({required this.text, required this.icon});
}
