class FavoriteModel {
  String idRestaurant;
  String idPicture;
  String city;
  String name;
  String rating;

  FavoriteModel({this.idRestaurant, this.idPicture, this.city, this.name, this.rating});

  Map<String, dynamic> toMap() {
    return {
      'id': idRestaurant,
      'pictureId': idPicture,
      'city': city,
      'name': name,
      'rating': rating,
    };
  }

  FavoriteModel.fromMap(Map<String, dynamic> map) {
    idRestaurant = map['id'];
    idPicture = map['pictureId'];
    city = map['city'];
    name = map['name'];
    rating = map['rating'];
  }
}
