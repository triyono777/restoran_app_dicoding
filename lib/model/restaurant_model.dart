class RestaurantModel {
  bool error;
  String message;
  int count;
  List<Restaurants> restaurants;

  RestaurantModel({this.error, this.message, this.count, this.restaurants});

  RestaurantModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    count = json['count'];
    if (json['restaurants'] != null) {
      restaurants = new List<Restaurants>();
      json['restaurants'].forEach((v) {
        restaurants.add(new Restaurants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    data['count'] = this.count;
    if (this.restaurants != null) {
      data['restaurants'] = this.restaurants.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Restaurants {
  String id;
  String name;
  String description;
  String pictureId;
  String city;
  var rating;

  Restaurants({this.id, this.name, this.description, this.pictureId, this.city, this.rating});

  Restaurants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    pictureId = json['pictureId'];
    city = json['city'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['pictureId'] = this.pictureId;
    data['city'] = this.city;
    data['rating'] = this.rating;
    return data;
  }
}
