import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:qtech_product_task/model/product_details_model.dart';

TextEditingController searchTextEditingController = TextEditingController();
var slugIdOfProduct = "";

  var  baseUrl =
      'https://panel.supplyline.network/api/product/search-suggestions/?limit=10&offset=10&search=rice';
        // final String productDetailsUrl =
  //     'https://panel.supplyline.network/api/product-details/?$slugIdOfProduct/';

class ApiProvider {
  final Dio _dio = Dio();

  Future<ProductListModel> fetchProductList( {int pageSize = 10, bool isFromLoadNext = false,}) async {

    if (searchTextEditingController.text == null ||
        searchTextEditingController.text == "") {
      baseUrl;
    } else {
      baseUrl =
          'https://panel.supplyline.network/api/product/search-suggestions/?limit=10&offset=10&search=${searchTextEditingController.text}';
    }
    //   if (!isFromLoadNext) {
    //   campaignList = [];
    //   pageNo = 1;
    //   allCampaignPageLimit.value = null;
    // }

    try {
      Response response = await _dio.get(baseUrl);
      return ProductListModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ProductListModel.withError("/ Connection issue");
    }
  }

  //   Future<ProductListModel> fetchProductDetails() async {
  //   try {
  //     Response response = await _dio.get(productDetailsUrl);
  //     return ProductListModel.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     print("Exception occured: $error stackTrace: $stacktrace");
  //     return ProductListModel.withError("/ Connection issue");
  //   }
  // }
  // void loadNextCampaignPage() {
  //   if (!isLastPage) {
  //     pageNo++;
  //     fetchProductList(isFromLoadNext: true);
  //   }
  // }

}

  