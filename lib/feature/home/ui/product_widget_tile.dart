import 'package:flutter/material.dart';
import 'package:learnbloc/feature/home/ui/bloc/home_bloc.dart';
import 'package:learnbloc/feature/home/ui/model/home_product_data_mode.dart';

class ProductWidgetTile extends StatelessWidget {
  final ProductDataMode productDataMode;
  final HomeBloc homeBloc;
  const ProductWidgetTile(
      {super.key, required this.productDataMode, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            height: 200,
            width: double.maxFinite,
          ),
          Text(
            productDataMode.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(productDataMode.description),
          Row(
            children: [
              Text(
                "\$${productDataMode.price}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  homeBloc.add(HomeProductWishListButtonClickEvent(
                      clickedProduct: productDataMode));
                },
                icon: const Icon(Icons.favorite),
              ),
              IconButton(
                  onPressed: () {
                    homeBloc.add(HomeProductCartButtonClickEvent(
                        clickedProduct: productDataMode));
                  },
                  icon: const Icon(Icons.shopping_bag_outlined))
            ],
          )
        ],
      ),
    );
  }
}
