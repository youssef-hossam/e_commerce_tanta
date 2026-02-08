import 'package:dio/dio.dart';
import 'package:e_commerce_tanta/features/home/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductsView extends StatelessWidget {
  final List<ProductModel> products = [];
  ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAllProducts(),
      builder: (context, AsyncSnapshot snapshot) => GridView.builder(
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.all(10),
          color: Colors.green,
          child: Column(
            children: [
              // Image.network(
              //   snapshot.data[index].IMA,
              //   height: 100,
              //   width: 100,
              // ),
              Text(
                snapshot.data[index].title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                ),
              ),
              Text(
                '\$' + 'price',
                style: TextStyle(
                  color: Color(0xff808080),
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<List<ProductModel>> getAllProducts() async {
    // Dio dio = Dio();

    for (int i = 0; i < 10; i++) {
      Response response = await Dio().get('https://dummyjson.com/products');
      ProductModel product =
          ProductModel.fromJson(response.data['products'][i]);

      products.add(product);
    }
    return products;
  }
}
