class FavoriteModel {
  int id;
  String idRestaurant;
  String idPicture;

  FavoriteModel({this.id, this.idRestaurant, this.idPicture});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'restaurant_id': idRestaurant,
      'picture_id': idPicture,
    };
  }

  FavoriteModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    idRestaurant = map['restaurant_id'];
    idPicture = map['picture_id'];
  }
}
