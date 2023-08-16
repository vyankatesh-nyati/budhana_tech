class VehicalModel {
  final String image;
  final String title;
  final String subTitle;
  final double price;

  VehicalModel({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'title': title,
      'subTitle': subTitle,
      'price': price,
    };
  }

  factory VehicalModel.fromMap(Map<String, dynamic> map) {
    return VehicalModel(
      image: map['image'] as String,
      title: map['title'] as String,
      subTitle: map['subTitle'] as String,
      price: map['price'] as double,
    );
  }
}
