import 'package:amazon_clone/common/widgets/stars.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

class SearchedProduct extends StatelessWidget {
  final Product product;
  const SearchedProduct({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalRating = 0;
    for (int i = 0; i < product.rating!.length; i++) {
      totalRating += product.rating![i].rating;
    }
    double avgRating = 0;
    if (totalRating != 0) {
      avgRating = totalRating / product.rating!.length;
    }
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              Image.network(
                product.images[0],
                fit: BoxFit.contain,
                height: 135.0,
                width: 135.0,
              ),
              Column(
                children: [
                  Container(
                    width: 235.0,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      product.name,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    width: 235.0,
                    padding: const EdgeInsets.only(left: 10.0, top: 5.0),
                    child: Stars(rating: avgRating),
                  ),
                  Container(
                    width: 235.0,
                    padding: const EdgeInsets.only(left: 10.0, top: 5.0),
                    child: Text(
                      '\$${product.price}',
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: 235.0,
                    padding: const EdgeInsets.only(left: 10.0),
                    child: const Text(
                      'Eligible for FREE Shipping',
                    ),
                  ),
                  Container(
                    width: 235.0,
                    padding: const EdgeInsets.only(left: 10.0, top: 5.0),
                    child: const Text(
                      'In Stock',
                      style: TextStyle(
                        color: Colors.teal,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
