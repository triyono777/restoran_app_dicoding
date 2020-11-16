class FavoriteModel {
  String idRestaurant;
  String idPicture;
  String city;

  FavoriteModel({this.idRestaurant, this.idPicture, this.city});

  Map<String, dynamic> toMap() {
    return {
      'restaurant_id': idRestaurant,
      'picture_id': idPicture,
      'city': city,
    };
  }

  FavoriteModel.fromMap(Map<String, dynamic> map) {
    idRestaurant = map['restaurant_id'];
    idPicture = map['picture_id'];
    city = map['city'];
  }
}
