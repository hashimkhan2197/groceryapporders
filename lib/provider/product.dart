import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'collection_names.dart';

class ProductModel {
  String productDocId;
  String productName;
  String productPrice;
  String productImageRef;

  ProductModel(
      {@required this.productPrice,
      @required this.productName,
      @required this.productDocId,
      @required this.productImageRef});
}

class Product with ChangeNotifier {
  ///naming conventions for store model for firebase
  String _productName = "productName";
  String _productPrice = "productPrice";
  String _productImageRef = "productImage";

  ProductModel _storeProfile;

  ProductModel get storeProfile => _storeProfile;

  Future<void> updateProduct(
      {@required ProductModel updatedProductModel,
      @required String storeDocId,
      @required categoryDocId}) async {
    await Firestore.instance
        .collection(stores_collection)
        .document(storeDocId)
        .collection(category_collection)
        .document(categoryDocId)
        .collection(products_collection).document(updatedProductModel.productDocId)
        .updateData({
      _productName: updatedProductModel.productName,
      _productPrice: updatedProductModel.productPrice,
    }).catchError((error) {
      throw error;
    });
    notifyListeners();
  }

  ProductModel convertToProductModel(DocumentSnapshot docu) {
    var doc = docu.data;
    return ProductModel(
        productDocId: docu.documentID,
        productName: doc[_productName],
        productPrice: doc[_productPrice],
        productImageRef: doc[_productImageRef]);
  }
}
