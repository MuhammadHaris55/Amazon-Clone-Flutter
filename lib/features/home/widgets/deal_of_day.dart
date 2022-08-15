import 'package:amazon_clone/common/widgets/loader.dart';
import 'package:amazon_clone/features/home/services/home_service.dart';
import 'package:amazon_clone/features/product_details/screens/product_details_screen.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  Product? product;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchDealOfDay();
  }

  void fetchDealOfDay() async {
    product = await homeServices.fetchDealOfDay(context);
    setState(() {});
  }

  void navigateToDetailScreen() {
    Navigator.pushNamed(
      context,
      ProductDetailScreen.routeName,
      arguments: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    return product == null
        ? const Loader()
        : product!.name.isEmpty
            ? const SizedBox()
            : GestureDetector(
                onTap: navigateToDetailScreen,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 10.0, top: 15.0),
                      child: const Text(
                        'Deal of the day',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Image.network(
                      product!.images[0],
                      height: 235.0,
                      fit: BoxFit.fitHeight,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15.0),
                      alignment: Alignment.topLeft,
                      child: Text(
                        '\$${product!.price}',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(
                          left: 15.0, top: 5.0, right: 40.0),
                      child: Text(
                        product!.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:
                            // [
                            product!.images
                                .map(
                                  (e) => Image.network(
                                    e,
                                    fit: BoxFit.fitWidth,
                                    width: 100.0,
                                    height: 100.0,
                                  ),
                                )
                                .toList(),
                        //   Image.network(
                        //     'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
                        //     fit: BoxFit.fitWidth,
                        //     width: 100.0,
                        //     height: 100.0,
                        //   ),
                        //   Image.network(
                        //     'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
                        //     fit: BoxFit.fitWidth,
                        //     width: 100.0,
                        //     height: 100.0,
                        //   ),
                        //   Image.network(
                        //     'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
                        //     fit: BoxFit.fitWidth,
                        //     width: 100.0,
                        //     height: 100.0,
                        //   ),
                        //   Image.network(
                        //     'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
                        //     fit: BoxFit.fitWidth,
                        //     width: 100.0,
                        //     height: 100.0,
                        //   ),
                        //   Image.network(
                        //     'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
                        //     fit: BoxFit.fitWidth,
                        //     width: 100.0,
                        //     height: 100.0,
                        //   ),
                        // ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 15.0)
                          .copyWith(left: 15.0),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'See all deals',
                        style: TextStyle(
                          color: Colors.cyan[800],
                        ),
                      ),
                    ),
                  ],
                ),
              );
  }
}
