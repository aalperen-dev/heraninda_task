import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:heraninda_task/features/auth/data/models/address_model.dart';

class UserModel {
  final String? userId;
  final String? userFullname;
  final String? userEmail;
  final String? userTckn;
  final String? profilePictureUrl;
  final DateTime? dateOfBirth;
  final List<Address?>? addresses;
  UserModel({
    this.userId,
    this.userFullname,
    this.userEmail,
    this.userTckn,
    this.profilePictureUrl,
    this.dateOfBirth,
    this.addresses,
  });

  UserModel copyWith({
    String? userId,
    String? userFullname,
    String? userEmail,
    String? userTckn,
    String? profilePictureUrl,
    DateTime? dateOfBirth,
    List<Address?>? addresses,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      userFullname: userFullname ?? this.userFullname,
      userEmail: userEmail ?? this.userEmail,
      userTckn: userTckn ?? this.userTckn,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      addresses: addresses ?? this.addresses,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'userFullname': userFullname,
      'userEmail': userEmail,
      'userTckn': userTckn,
      'profilePictureUrl': profilePictureUrl,
      'dateOfBirth': dateOfBirth?.millisecondsSinceEpoch,
      'addresses': addresses?.map((x) => x?.toMap()).toList(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'],
      userFullname: map['userFullname'],
      userEmail: map['userEmail'],
      userTckn: map['userTckn'],
      profilePictureUrl: map['profilePictureUrl'],
      dateOfBirth:
          map['dateOfBirth'] != null
              ? DateTime.fromMillisecondsSinceEpoch(map['dateOfBirth'])
              : null,
      addresses:
          map['addresses'] != null
              ? List<Address?>.from(
                map['addresses']?.map((x) => Address?.fromMap(x)),
              )
              : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(userId: $userId, userFullname: $userFullname, userEmail: $userEmail, userTckn: $userTckn, profilePictureUrl: $profilePictureUrl, dateOfBirth: $dateOfBirth, addresses: $addresses)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.userId == userId &&
        other.userFullname == userFullname &&
        other.userEmail == userEmail &&
        other.userTckn == userTckn &&
        other.profilePictureUrl == profilePictureUrl &&
        other.dateOfBirth == dateOfBirth &&
        listEquals(other.addresses, addresses);
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        userFullname.hashCode ^
        userEmail.hashCode ^
        userTckn.hashCode ^
        profilePictureUrl.hashCode ^
        dateOfBirth.hashCode ^
        addresses.hashCode;
  }
}
