import 'dart:convert';

import 'package:flutter/foundation.dart';

class ProductModel {
  final String? productId;
  final String? productName;
  final String? productImageUrl;
  final double? productRating;
  final double? productPrice;
  final String? productDescription;
  final List<String>? productGallery;
  final List<String>? productTags;
  final bool? isFavorite;
  ProductModel({
    this.productId,
    this.productName,
    this.productImageUrl,
    this.productRating,
    this.productPrice,
    this.productDescription,
    this.productGallery,
    this.productTags,
    this.isFavorite,
  });

  ProductModel copyWith({
    String? productId,
    String? productName,
    String? productImageUrl,
    double? productRating,
    double? productPrice,
    String? productDescription,
    List<String>? productGallery,
    List<String>? productTags,
    bool? isFavorite,
  }) {
    return ProductModel(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      productImageUrl: productImageUrl ?? this.productImageUrl,
      productRating: productRating ?? this.productRating,
      productPrice: productPrice ?? this.productPrice,
      productDescription: productDescription ?? this.productDescription,
      productGallery: productGallery ?? this.productGallery,
      productTags: productTags ?? this.productTags,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'productName': productName,
      'productImageUrl': productImageUrl,
      'productRating': productRating,
      'productPrice': productPrice,
      'productDescription': productDescription,
      'productGallery': productGallery,
      'productTags': productTags,
      'isFavorite': isFavorite,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      productId: map['productId'],
      productName: map['productName'],
      productImageUrl: map['productImageUrl'],
      productRating: map['productRating']?.toDouble(),
      productPrice: map['productPrice']?.toDouble(),
      productDescription: map['productDescription'],
      productGallery: List<String>.from(map['productGallery']),
      productTags: List<String>.from(map['productTags']),
      isFavorite: map['isFavorite'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(productId: $productId, productName: $productName, productImageUrl: $productImageUrl, productRating: $productRating, productPrice: $productPrice, productDescription: $productDescription, productGallery: $productGallery, productTags: $productTags, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.productId == productId &&
        other.productName == productName &&
        other.productImageUrl == productImageUrl &&
        other.productRating == productRating &&
        other.productPrice == productPrice &&
        other.productDescription == productDescription &&
        listEquals(other.productGallery, productGallery) &&
        listEquals(other.productTags, productTags) &&
        other.isFavorite == isFavorite;
  }

  @override
  int get hashCode {
    return productId.hashCode ^
        productName.hashCode ^
        productImageUrl.hashCode ^
        productRating.hashCode ^
        productPrice.hashCode ^
        productDescription.hashCode ^
        productGallery.hashCode ^
        productTags.hashCode ^
        isFavorite.hashCode;
  }
}
