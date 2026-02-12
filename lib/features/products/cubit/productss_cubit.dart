import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_tanta/core/networking/api_error_handler.dart';
import 'package:e_commerce_tanta/features/products/models/product_model.dart';
import 'package:meta/meta.dart';

part 'productss_state.dart';

// class ProductsCubit extends Cubit<ProductssState> {
//   ProductsCubit() : super(ProductssInitial());
// }
class ProductsCubit extends Cubit<ProductssState> {
  List<ProductModel> products = [];
  // ProductsCubit(super.initialState);
  ProductsCubit() : super(ProductssInitial());

  Future<List<ProductModel>> getAllProducts() async {
    // Dio dio = Dio();

    try {
      emit(ProductssLoading());
      Response response = await Dio().get('https://dummyjson.com/products');

      for (int i = 0; i < response.data['products'].length; i++) {
        ProductModel product =
            ProductModel.fromJson(response.data['products'][i]);

        products.add(product);
      }
      emit(ProductssSuccess(products: products));
    } on DioException catch (e) {
      emit(ProductssFailure(errorMessage: ApiErrorHandler.handle(e)));
    }

    return products;
  }
}
