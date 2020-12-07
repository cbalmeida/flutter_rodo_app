class VehicleType {
  int id;
  String name;
  String imagePath;
  bool isImageAnAsset;

  VehicleType({this.id, this.name, this.imagePath, this.isImageAnAsset});

  factory VehicleType.fromJson(Map<String, dynamic> json) {
    return VehicleType(
      id: json['id'],
      name: json['name'],
      imagePath: json['image_path'],
      isImageAnAsset: json['is_image_an_asset'],
    );
  }
}
