import 'dart:convert';

class Address {
  final String? addressId;
  final String? userId;
  final String? street;
  final String? city;
  final String? state;
  final String? postalCode;
  final String? country;
  final String? description;
  final String? addresstype;
  Address({
    this.addressId,
    this.userId,
    this.street,
    this.city,
    this.state,
    this.postalCode,
    this.country,
    this.description,
    this.addresstype,
  });

  Address copyWith({
    String? addressId,
    String? userId,
    String? street,
    String? city,
    String? state,
    String? postalCode,
    String? country,
    String? description,
    String? addresstype,
  }) {
    return Address(
      addressId: addressId ?? this.addressId,
      userId: userId ?? this.userId,
      street: street ?? this.street,
      city: city ?? this.city,
      state: state ?? this.state,
      postalCode: postalCode ?? this.postalCode,
      country: country ?? this.country,
      description: description ?? this.description,
      addresstype: addresstype ?? this.addresstype,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'addressId': addressId,
      'userId': userId,
      'street': street,
      'city': city,
      'state': state,
      'postalCode': postalCode,
      'country': country,
      'description': description,
      'addresstype': addresstype,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      addressId: map['addressId'],
      userId: map['userId'],
      street: map['street'],
      city: map['city'],
      state: map['state'],
      postalCode: map['postalCode'],
      country: map['country'],
      description: map['description'],
      addresstype: map['addresstype'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Address(addressId: $addressId, userId: $userId, street: $street, city: $city, state: $state, postalCode: $postalCode, country: $country, description: $description, addresstype: $addresstype)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Address &&
        other.addressId == addressId &&
        other.userId == userId &&
        other.street == street &&
        other.city == city &&
        other.state == state &&
        other.postalCode == postalCode &&
        other.country == country &&
        other.description == description &&
        other.addresstype == addresstype;
  }

  @override
  int get hashCode {
    return addressId.hashCode ^
        userId.hashCode ^
        street.hashCode ^
        city.hashCode ^
        state.hashCode ^
        postalCode.hashCode ^
        country.hashCode ^
        description.hashCode ^
        addresstype.hashCode;
  }
}
