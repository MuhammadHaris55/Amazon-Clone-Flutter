import 'package:amazon_clone/common/widgets/loader.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/home/widgets/address_box.dart';
import 'package:amazon_clone/features/product_details/screens/product_details_screen.dart';
import 'package:amazon_clone/features/search/services/search_services.dart';
import 'package:amazon_clone/features/search/widgets/searched_product.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search-screen';

  final String searchQuery;
  const SearchScreen({Key? key, required this.searchQuery}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product>? productList;

  final SearchServices searchServices = SearchServices();

  @override
  void initState() {
    super.initState();

    fetchSearchedProducts();
  }

  void fetchSearchedProducts() async {
    productList =
        await searchServices.fetchSearchedProducts(context, widget.searchQuery);
    setState(() {});
  }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 42.0,
                    margin: const EdgeInsets.only(left: 15.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(7.0),
                      elevation: 1,
                      child: TextFormField(
                        onFieldSubmitted: navigateToSearchScreen,
                        decoration: InputDecoration(
                          prefixIcon: InkWell(
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.only(left: 6.0),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 23.0,
                              ),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(top: 10.0),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(7.0),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(7.0),
                            ),
                            borderSide: BorderSide(
                              color: Colors.black38,
                              width: 1.0,
                            ),
                          ),
                          hintText: "Search Amazon.in",
                          hintStyle: const TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  color: Colors.transparent,
                  height: 45.0,
                  child: const Icon(
                    Icons.mic,
                    color: Colors.black,
                    size: 25.0,
                  ),
                )
              ],
            ),
          ),
        ),
        body: productList == null
            ? const Loader()
            : Column(
                children: [
                  const AddressBox(),
                  const SizedBox(height: 10.0),
                  Expanded(
                    child: ListView.builder(
                      itemCount: productList!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                ProductDetailScreen.routeName,
                                arguments: productList![index],
                              );
                            },
                            child:
                                SearchedProduct(product: productList![index]));
                      },
                    ),
                  ),
                ],
              ));
  }
}
