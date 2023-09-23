import 'dart:convert';

PlaystoreModel playstoreModelFromJson(String str) => PlaystoreModel.fromJson(json.decode(str));

String playstoreModelToJson(PlaystoreModel data) => json.encode(data.toJson());

class PlaystoreModel {
  final bool status;
  final PlaystoreData data;

  PlaystoreModel({
    required this.status,
    required this.data,
  });

  factory PlaystoreModel.fromJson(Map<String, dynamic> json) => PlaystoreModel(
        status: json["status"],
        data: PlaystoreData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class PlaystoreData {
  final String title;
  final String company;
  final String description;
  final String icon;
  final String rating;
  final String reviewsTotal;
  final String appSize;
  final String ratedFor;
  final String downloadsTotal;
  final List<String> tags;
  final List<String> images;
  final List<Review> reviews;

  PlaystoreData({
    required this.title,
    required this.company,
    required this.description,
    required this.icon,
    required this.rating,
    required this.reviewsTotal,
    required this.appSize,
    required this.ratedFor,
    required this.downloadsTotal,
    required this.tags,
    required this.images,
    required this.reviews,
  });

  factory PlaystoreData.fromJson(Map<String, dynamic> json) => PlaystoreData(
        title: json["title"],
        company: json["company"],
        description: json["description"],
        icon: json["icon"],
        rating: json["rating"],
        reviewsTotal: json["reviews_total"],
        appSize: json["app_size"],
        ratedFor: json["rated_for"],
        downloadsTotal: json["downloads_total"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        images: List<String>.from(json["images"].map((x) => x)),
        reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "company": company,
        "description": description,
        "icon": icon,
        "rating": rating,
        "reviews_total": reviewsTotal,
        "app_size": appSize,
        "rated_for": ratedFor,
        "downloads_total": downloadsTotal,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "images": List<dynamic>.from(images.map((x) => x)),
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
      };
}

class Review {
  final int id;
  final int rating;
  final String comment;
  final DateTime date;
  final User user;

  Review({
    required this.id,
    required this.rating,
    required this.comment,
    required this.date,
    required this.user,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        rating: json["rating"],
        comment: json["comment"],
        date: DateTime.parse(json["date"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rating": rating,
        "comment": comment,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "user": user.toJson(),
      };
}

class User {
  final String name;
  final String image;

  User({
    required this.name,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
      };
}
