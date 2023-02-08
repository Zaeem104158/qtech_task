
import 'package:qtech_product_task/model/product_details_model.dart';
import 'package:qtech_product_task/provider/product_list_provider.dart';


class ApiRepository {
  final _provider = ApiProvider();

  Future<ProductListModel> fetchProductList() {
    return _provider.fetchProductList();
  }
}

class NetworkError extends Error {}