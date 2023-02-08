import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qtech_product_task/blocs/productlist_bloc.dart';
import 'package:qtech_product_task/blocs/productlist_event.dart';
import 'package:qtech_product_task/model/product_details_model.dart';
import 'package:qtech_product_task/pages/product_details_page.dart';
import 'package:qtech_product_task/provider/product_list_provider.dart';
import 'package:qtech_product_task/utils/asset_constant.dart';
import 'package:qtech_product_task/widget/image_view_widget.dart';
import 'package:qtech_product_task/widget/text_form_field_component.dart';
import 'package:qtech_product_task/widget/text_form_field_no_border_component.dart';

class ProductLtstPage extends StatefulWidget {
  @override
  _ProductLtstPageState createState() => _ProductLtstPageState();
}

class _ProductLtstPageState extends State<ProductLtstPage> {
  final ProductListBloc _newsBloc = ProductListBloc();

  @override
  void initState() {
    _newsBloc.add(GetProductList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            //search product
            TextFormFieldComponent(
              hint: "Search",
              label: "Search",
              textEditingController: searchTextEditingController,
              onChanged: (value) {},
              suffixWidget: InkWell(
                child: Icon(Icons.search),
                onTap: () {
                    _newsBloc.add(GetProductList());
                },
              ),
            ),
            Expanded(child: _buildProductList()),
          ],
        ),
      ),
    );
  }

  Widget _buildProductList() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _newsBloc,
        child: BlocListener<ProductListBloc, ProductListState>(
          listener: (context, state) {
            if (state is ProductListError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<ProductListBloc, ProductListState>(
            builder: (context, state) {
              if (state is ProductListInitial) {
                return _buildLoading();
              } else if (state is ProductListLoading) {
                return _buildLoading();
              } else if (state is ProductListLoaded) {
                return _buildProductCard(context, state.productModel);
              } else if (state is ProductListError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  //Product List Card
  Widget _buildProductCard(BuildContext context, ProductListModel model) {
    List<Result>? productList = model.data?.products.results;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
          mainAxisExtent: 280),
      itemCount: productList!.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            slugIdOfProduct = productList[index].slug;
            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return ProcutDetailsPage();
            // }));
            log("$slugIdOfProduct");
          },
          child: Container(
            margin: const EdgeInsets.all(0.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                // side: BorderSide(
                //   color: Colors.greenAccent,
                // ),
              ),
              child: Container(
                margin: const EdgeInsets.all(0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //Image with lable
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 30.0, bottom: 8.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: ImageViewComponent(
                                imageUrl: productList[index].image,
                                boxFit: BoxFit.contain,
                                imageRadius: 0.0,
                                backgroundColor: Colors.grey,
                                placeHolderIcon: productPlaceholderAsset,
                              ),
                            ),
                          ),
                          productList[index].stock == 0
                              ? const Positioned(
                                  left: 80,
                                  top: 0,
                                  child: Chip(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                    label: Text(
                                      "স্টকে নেই",
                                      style:
                                          TextStyle(color: Color(0xFFC62828)),
                                    ),
                                    backgroundColor: Color(0xFFFFCCCC),
                                  ))
                              : const SizedBox(),
                        ],
                      ),
                    ),
                    //Product Name
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 0.0, bottom: 8.0, left: 8.0, right: 8.0),
                      child: Text(
                        productList[index].productName,
                        style: const TextStyle(
                          color: Color(
                            0xFF323232,
                          ),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    //Purching Pricing
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 8.0, bottom: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                const TextSpan(
                                  text: 'ক্রয় ',
                                  style: TextStyle(
                                    color: Color(0xFF646464),
                                    fontSize: 8.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      '৳ ${productList[index].charge.currentCharge}',
                                  style: const TextStyle(
                                    color: Color(0xFFDA2079),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "৳ ${productList[index].charge.sellingPrice}",
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Color(0xFFDA2079),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    //Selling Price and profit
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 8.0, bottom: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                const TextSpan(
                                  text: 'বিক্রয় ',
                                  style: TextStyle(
                                    color: Color(0xFF646464),
                                    fontSize: 8.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      '৳ ${productList[index].charge.currentCharge}',
                                  style: const TextStyle(
                                    color: Color(0xFF646464),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // লাভ
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                const TextSpan(
                                  text: 'লাভ',
                                  style: TextStyle(
                                    color: Color(0xFF646464),
                                    fontSize: 8.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      ' ৳ ${productList[index].charge.profit}',
                                  style: const TextStyle(
                                    color: Color(0xFF646464),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}
