import 'package:dio/dio.dart';
import 'package:e_commerce_tanta/features/products/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetailesView extends StatelessWidget {
  final int id;
  const ProductDetailesView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Product Details',
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
      ),
      body: FutureBuilder(
        future: fetchProductDetails(),
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      snapshot.data!.thumbnail ??
                          'https://upload.wikimedia.org/wikipedia/commons/3/3f/Placeholder_view_vector.svg',
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      snapshot.data!.title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      snapshot.data!.description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                      child: ListView.builder(
                        itemCount: snapshot.data!.reviews.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Text(
                            snapshot.data!.reviews[index].rating.toString() ??
                                'no rating'),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }

  Future<ProductModel> fetchProductDetails() async {
    Response response = await Dio().get('https://dummyjson.com/products/$id');

    ProductModel productModel = ProductModel.fromJson(response.data);

    return productModel;
  }
}
