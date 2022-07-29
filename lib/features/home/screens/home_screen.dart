import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/home/screens/widgets/address_box.dart';
import 'package:amazon_clone/features/home/screens/widgets/carousel_image.dart';
import 'package:amazon_clone/features/home/screens/widgets/deal_of_day.dart';
import 'package:amazon_clone/features/home/screens/widgets/top_categories.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: Column(
        children: const [
          AddressBox(),
          SizedBox(height: 10.0),
          TopCategories(),
          SizedBox(height: 10.0),
          CarouselImage(),
          SizedBox(height: 10.0),
          DealOfDay(),
        ],
      ),
    );
  }
}
