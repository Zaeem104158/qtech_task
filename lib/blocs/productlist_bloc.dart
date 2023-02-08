import 'package:bloc/bloc.dart';
import 'package:qtech_product_task/blocs/productlist_event.dart';
import 'package:qtech_product_task/repository/api_requests.dart';


class ProductListBloc extends Bloc<ProcuctListEvent, ProductListState> {
  ProductListBloc() : super(ProductListInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetProductList>((event, emit) async {
      try {
        emit(ProductListLoading());
        final mList = await _apiRepository.fetchProductList();
        emit(ProductListLoaded(mList));
        if (mList.error != null) {
          emit(ProductListError(mList.error));
        }
      } on NetworkError {
        emit(const ProductListError("Failed to fetch data. is your device online?"));
      }
    });
  }
}