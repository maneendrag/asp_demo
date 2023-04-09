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
                    backgroundColor: Colors.white,
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 12,
                            ),
                            CarouselSlider(
                              options: CarouselOptions(
                                height: 220,
                                aspectRatio: 2,
                                viewportFraction: 0.9,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: false,
                                autoPlayInterval: Duration(seconds: 3),
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                                enlargeFactor: 0.3,
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
                                        color: Colors.black,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    "\$ ${model.productsDetailsResponse!.price!.toString()}",
                                    style: const TextStyle(
                                        color: Colors.red,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 22,
                                  ),
                                  Text(
                                    model.productsDetailsResponse!.description!,
                                    style: const TextStyle(
                                        color: Colors.red,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 22,
                                  ),
                                  RatingBar.builder(
                                    initialRating: 3.2,
                                    minRating: 0,
                                    direction: Axis.horizontal,
                                    allowHalfRating: false,
                                    itemCount: 5,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  SizedBox(
                                    height: 22,
                                  ),
                                  Text(
                                    "Rating ${model.productsDetailsResponse!.rating!.ceil().toString()}",
                                    style: const TextStyle(
                                        color: Colors.red,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 22,
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
                                            height: 55,
                                            width: 55,
                                            color: Colors.red,
                                            child: const Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12),
                                          child: Text(
                                            model.cartCountNumber.toString(),
                                            style: const TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold),
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
                                            height: 55,
                                            width: 55,
                                            color: Colors.blue,
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
                                  )
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
                  ),
                );
        });
  }
}
