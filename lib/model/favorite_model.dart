class FavoriteModel {
  String idRestaurant;
  String idPicture;
  String city;
  String name;

  FavoriteModel({this.idRestaurant, this.idPicture, this.city, this.name});

  Map<String, dynamic> toMap() {
    return {
      'id': idRestaurant,
      'pictureId': idPicture,
      'city': city,
      'name': name,
    };
  }

  FavoriteModel.fromMap(Map<String, dynamic> map) {
    idRestaurant = map['id'];
    idPicture = map['pictureId'];
    city = map['city'];
    name = map['name'];
  }
}
