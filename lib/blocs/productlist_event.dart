import 'package:equatable/equatable.dart';
import 'package:qtech_product_task/model/product_details_model.dart';

abstract class ProcuctListEvent extends Equatable {
  const ProcuctListEvent();

  @override
  List<Object> get props => [];
}

class GetProductList extends ProcuctListEvent {}


abstract class ProductListState extends Equatable {
  const ProductListState();

  @override
  List<Object?> get props => [];
}

class ProductListInitial extends ProductListState {}

class ProductListLoading extends ProductListState {}

class ProductListLoaded extends ProductListState {
  final ProductListModel productModel;
  const ProductListLoaded(this.productModel);
}

class ProductListError extends ProductListState {
  final String? message;
  const ProductListError(this.message);
}
