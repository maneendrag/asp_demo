import 'package:asp_base/screen/home/screens/product_details/product_details_viewmodel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:stacked/stacked.dart';

class ProductDetailsScreen extends StatelessWidget {
  int? productID;

  ProductDetailsScreen({Key? key, this.productID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductDetailsViewModel>.reactive(
        viewModelBuilder: () => ProductDetailsViewModel(),
        onViewModelReady: (model) => model.getProductDetailsData(productID!),
        builder: (context, model, child) {
          return model.isBusy == true
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.yellow,
                ))
              : SafeArea(
                  child: Scaffold(

                    body: ListView(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                CarouselSlider(
                                  options: CarouselOptions(
                                    height: 280,
                                    aspectRatio: 0.1,
                                    viewportFraction: 0.99,
                                    initialPage: 0,
                                    enableInfiniteScroll: true,
                                    reverse: false,
                                    autoPlay: true,
                                    autoPlayInterval: Duration(seconds: 3),
                                    autoPlayAnimationDuration:
                                        Duration(milliseconds: 800),
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    enlargeCenterPage: true,
                                    enlargeFactor: 0.9,
                                    onPageChanged: null,
                                    scrollDirection: Axis.horizontal,
                                  ),
                                  items: model.productsDetailsResponse!.images!
                                      .map((i) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Container(
                                            width:
                                                MediaQuery.of(context).size.width,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            decoration: const BoxDecoration(
                                                color: Colors.amber),
                                            child: Image.network(
                                              i,
                                              fit: BoxFit.cover,
                                            ));
                                      },
                                    );
                                  }).toList(),
                                ),
                                const SizedBox(
                                  height: 22,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 12),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        model.productsDetailsResponse!.title!,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        "\$ ${model.productsDetailsResponse!.price!.toString()}",
                                        style: const TextStyle(
                                            color: Colors.green,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 22,
                                      ),
                                      Text(
                                        model.productsDetailsResponse!.description!,
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 22,
                                      ),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Rating ${model.productsDetailsResponse!.rating!}",
                                            style: TextStyle(
                                                color: Colors.amberAccent.shade200,
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          model.cartCountNumber > 0
                                              ? Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12),
                                            child: Row(

                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    model.updateProductCartCount(
                                                        model.productsDetailsResponse!
                                                            .id!,
                                                        "userID",
                                                        "INCREMENT");
                                                  },
                                                  child: Container(
                                                    height: 50,
                                                    width: 50,
                                                    decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(28), bottomLeft: Radius.circular(28)),
                                                        color: Colors.green),
                                                    child: const Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                      size: 33,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 50,
                                                  width: 55,
                                                  color: Colors.white,
                                                  child: Center(
                                                    child: Text(
                                                      model.cartCountNumber.toString(),
                                                      style: const TextStyle(
                                                          color: Colors.green,
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    model.cartCountNumber == 1
                                                        ? model.deleteProductCartCount(
                                                        model
                                                            .productsDetailsResponse!
                                                            .id!,
                                                        "userID")
                                                        : model.updateProductCartCount(
                                                        model
                                                            .productsDetailsResponse!
                                                            .id!,
                                                        "userID",
                                                        "DECREMENT");
                                                  },
                                                  child: Container(
                                                    decoration: const BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(28), bottomRight: Radius.circular(28)),
                                                        color: Colors.green),
                                                    height: 50,
                                                    width: 55,
                                                    child: const Icon(
                                                      Icons.remove,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                              : GestureDetector(
                                            onTap: () {
                                              model.addToCart(
                                                  model.productsDetailsResponse!.id!);
                                            },
                                            child: Center(
                                              child: Container(
                                                margin:
                                                EdgeInsets.symmetric(vertical: 32),
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 65, vertical: 16),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(28),
                                                    color: const Color(0xff0F4C75)),
                                                child: const Text(
                                                  "Add To Cart",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 22,
                                ),
                                RatingBar.builder(
                                  initialRating: model.productsDetailsResponse!.rating!,
                                  minRating: 0,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  unratedColor: Colors.white,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amberAccent.shade200,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                SizedBox(
                                  height: 22,
                                ),
                              ],
                            ),
                            model.cartCountNumber > 0
                                ? GestureDetector(
                                    onTap: () {
                                      model.navigateToCartScreen();
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(vertical: 32),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 65, vertical: 16),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(28),
                                          color: const Color(0xff0F4C75)),
                                      child: const Text(
                                        "Check Out",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      ],
                    ),
                  ),
                );
        });
  }
}
