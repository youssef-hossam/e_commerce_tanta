import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_tanta/features/products/cubit/productss_cubit.dart';
import 'package:e_commerce_tanta/features/products/models/product_model.dart';
import 'package:e_commerce_tanta/features/products/product_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsView extends StatelessWidget {
  static const routeName = '/products';
  ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<ProductsCubit, ProductssState>(
      builder: (context, state) {
        if (state is ProductssLoading) {
          return GridView.builder(
            itemCount: state.products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.8,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailesView(
                      id: state.products[index].id,
                    ),
                  )),
              child: Skeletonizer(
                enabled: true,
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
                        child: state.products[index].thumbnail == null
                            ? SizedBox(
                                height: 100,
                                width: 100,
                              )
                            : Image.network(
                                '${state.products[index].thumbnail}',
                                height: 100,
                                width: 100,
                              ),
                      ),
                      // Text(

                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(
                      //     color: Colors.black,
                      //     fontSize: 18,
                      //   ),
                      // ),
                      Text(
                        ' ${state.products[index].description}',
                        maxLines: 2,
                        style: TextStyle(
                          color: Color(0xff808080),
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        ' ${state.products[index].price}',
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
            ),
          );
        } else if (state is ProductssSuccess) {
          return GridView.builder(
            itemCount: state.products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.8,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailesView(id: 1),
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
                        '${state.products[index].thumbnail}',
                        height: 100,
                        width: 100,
                      ),
                    ),
                    // Text(

                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 18,
                    //   ),
                    // ),
                    Text(
                      ' ${state.products[index].description}',
                      maxLines: 2,
                      style: TextStyle(
                        color: Color(0xff808080),
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      ' ${state.products[index].price}',
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
        } else if (state is ProductssFailure) {
          return Center(
            child: Column(
              children: [
                Icon(
                  Icons.error,
                  size: 50,
                ),
                Text(state.errorMessage)
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    ));
  }
}
