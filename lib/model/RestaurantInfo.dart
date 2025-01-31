import 'package:cloud_firestore/cloud_firestore.dart';

import 'Location.dart';

class RestaurantInfo {
  RestaurantInfo({this.id, this.name, this.location, this.thumb});

  factory RestaurantInfo.fromJson(Map<String, dynamic> json) {
    return RestaurantInfo(
      id: json['id'],
      name: json['name'],
      location: Location.fromJson(json['location']),
      thumb: json['thumb'],
    );
  }

  factory RestaurantInfo.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return RestaurantInfo(
      id: documentSnapshot.data['id'],
      name: documentSnapshot.data['name'],
      location: Location.fromJson(documentSnapshot.data['location']),
      thumb: documentSnapshot.data['thumb'],
    );
  }

  final String id;
  final String name;
  final Location location;
  final String thumb;

  Map<String, dynamic> toMap() => {
        'id': id ?? -1,
        'name': name ?? 'unknown',
        'location': location != null ? location.toMap() : 'unknown',
        'thumb': thumb ?? 'unknown',
      };
}
