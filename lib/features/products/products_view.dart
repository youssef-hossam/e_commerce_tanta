import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_tanta/features/products/models/product_model.dart';
import 'package:e_commerce_tanta/features/products/product_details_view.dart';
import 'package:flutter/material.dart';

// class ProductsView extends StatelessWidget {
//   final List<ProductModel> products = [];
//   ProductsView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: getAllProducts(),
//       builder: (context, AsyncSnapshot snapshot) =>
//     );
//   }

//   Future<List<ProductModel>> getAllProducts() async {
//     // Dio dio = Dio();

//     for (int i = 0; i < 10; i++) {
//       Response response = await Dio().get('https://dummyjson.com/products');
//       ProductModel product =
//           ProductModel.fromJson(response.data['products'][i]);

//       products.add(product);
//     }
//     return products;
//   }
// }

class ProductsView extends StatelessWidget {
  final List<ProductModel> products = [];
  ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAllProducts(),
      builder: (context, snapshot) {
        return snapshot.connectionState == ConnectionState.waiting
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                itemCount: snapshot.data!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.8,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailesView(id: snapshot.data![index].id),
                      )),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(75, 158, 158, 158),
                    ),
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Image.network(
                            snapshot.data![index].thumbnail,
                            height: 100,
                            width: 100,
                          ),
                        ),
                        Text(
                          snapshot.data![index].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '\$' + snapshot.data![index].price.toString(),
                          maxLines: 2,
                          style: TextStyle(
                            color: Color(0xff808080),
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          '\$' + snapshot.data![index].description.toString(),
                          maxLines: 1,
                          style: TextStyle(
                            color: Color(0xff808080),
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }

  Future<List<ProductModel>> getAllProducts() async {
    // Dio dio = Dio();
    Response response = await Dio().get('https://dummyjson.com/products');

    for (int i = 0; i < response.data['products'].length; i++) {
      ProductModel product =
          ProductModel.fromJson(response.data['products'][i]);

      products.add(product);
    }
    return products;
  }
}
